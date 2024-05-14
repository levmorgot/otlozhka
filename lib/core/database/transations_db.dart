import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:otlozhka/core/error/failure.dart';
import 'package:otlozhka/core/injectable/injectable_init.dart';
import 'package:otlozhka/core/utils/enum.dart';
import 'package:otlozhka/core/utils/extensoins.dart';
import 'package:otlozhka/features/transactions/domain/entities/transaction_category_entity.dart';
import 'package:otlozhka/features/transactions/domain/entities/transaction_entity.dart' as tr;
import 'package:otlozhka/features/transactions/domain/usecases/params/add_transaction_category_params.dart';
import 'package:otlozhka/features/transactions/domain/usecases/params/add_transaction_params.dart';
import 'package:otlozhka/features/transactions/domain/usecases/params/change_transaction_category_params.dart';
import 'package:otlozhka/features/transactions/domain/usecases/params/change_transaction_params.dart';
import 'package:otlozhka/generated/assets.gen.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

@Injectable()
class TransactionsDatabase {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _initDatabase('transactions.db');
      return _database!;
    }
  }

  Future<void> init() async {
    await getIt<TransactionsDatabase>().addDefaultTransactionCategories();
  }

  Future<Database> _initDatabase(String filePath) async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, filePath);
    return openDatabase(path, version: 2, onCreate: _createDatabase);
  }



  Future _createDatabase(Database database, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const nullableIntType = 'INTEGER';
    const doubleType = 'REAL';
    const stringType = 'TEXT NOT NULL';
    const nullableStringType = 'TEXT';

    await database.execute('''
    CREATE TABLE $tableTransactionCategories (
      ${TransactionCategoryFields.id} $idType,
      ${TransactionCategoryFields.type} $stringType,
      ${TransactionCategoryFields.name} $stringType,
      ${TransactionCategoryFields.icon} $stringType,
      ${TransactionCategoryFields.color} $stringType,
      ${TransactionCategoryFields.maxMonthAmount} $doubleType,
      ${TransactionCategoryFields.createdAt} $stringType
    )
    ''');

    await database.execute('''
    CREATE TABLE ${tr.tableTransactions} (
      ${tr.TransactionFields.id} $idType,
      ${tr.TransactionFields.categoryId} $nullableIntType,
      ${tr.TransactionFields.type} $stringType,
      ${tr.TransactionFields.amount} $doubleType,
      ${tr.TransactionFields.transactionDate} $stringType,
      ${tr.TransactionFields.createdAt} $stringType,
      ${tr.TransactionFields.comment} $nullableStringType
    )
    ''');
  }

  Future<void> addDefaultTransactionCategories() async {
    final db = await database;
    final defaultCategoriesIds = defaultCategories.map((category) => category.id).toList();
    await db.delete(tableTransactionCategories, where: '${TransactionCategoryFields.id} IN (${defaultCategoriesIds.join(",")})');
    for (final category in defaultCategories) {
      await db.insert(tableTransactionCategories, category.toJson());
    }
  }

  Future<Either<Failure, tr.Transaction>> addTransaction(AddTransactionParams params) async {
    try {
      final database = await this.database;
      final values = {
        tr.TransactionFields.categoryId: params.categoryId,
        tr.TransactionFields.type: EnumUtil.toJson(params.type),
        tr.TransactionFields.amount: params.amount,
        tr.TransactionFields.transactionDate: params.transactionDate.toIso8601String(),
        tr.TransactionFields.createdAt: DateTime.now().toIso8601String(),
        tr.TransactionFields.comment: params.comment,
      };
      final id = await database.insert(tr.tableTransactions, values);
      final transaction = await _getTransaction(id);
      return Right(transaction);
    } catch (e) {
      return Left(DatabaseFailure(
        errorMessage: e.toString(),
        functionName: 'addTransaction',
      ));
    }
  }

  Future<Either<Failure, List<tr.Transaction>>> getTransactions() async {
    try {
      final database = await this.database;
      final rows = await database.query(tr.tableTransactions);
      final transactions = rows.map((json) => tr.Transaction.fromJson(json)).toList();
      return Right(transactions);
    } catch (e) {
      return Left(DatabaseFailure(
        errorMessage: e.toString(),
        functionName: 'getTransactions',
      ));
    }
  }

  Future<Either<Failure, tr.Transaction>> getTransaction(int id) async {
    try {
      final transaction = await _getTransaction(id);
      return Right(transaction);
    } catch (e) {
      return Left(DatabaseFailure(
        errorMessage: e.toString(),
        functionName: 'getTransaction',
      ));
    }
  }

  Future<Either<Failure, tr.Transaction>> changeTransaction(ChangeTransactionParams params) async {
    try {
      final database = await this.database;
      final transaction = await _getTransaction(params.id);

      await database.update(
        tr.tableTransactions,
        transaction
            .copyWith(
              categoryId: params.categoryId,
              type: params.type,
              amount: params.amount,
              transactionDate: params.transactionDate,
              comment: params.comment,
            )
            .toJson(),
        where: '${tr.TransactionFields.id} = ?',
        whereArgs: [transaction.id],
      );
      final updatedTransaction = await _getTransaction(params.id);
      return Right(updatedTransaction);
    } catch (e) {
      return Left(DatabaseFailure(
        errorMessage: e.toString(),
        functionName: 'changeTransaction',
      ));
    }
  }

  Future<Either<Failure, None>> deleteTransaction(int id) async {
    try {
      final database = await this.database;
      await database.delete(
        tr.tableTransactions,
        where: '${tr.TransactionFields.id} = ?',
        whereArgs: [id],
      );
      return const Right(None());
    } catch (e) {
      return Left(DatabaseFailure(
        errorMessage: e.toString(),
        functionName: 'deleteTransaction',
      ));
    }
  }

  Future<Either<Failure, TransactionCategory>> addTransactionCategory(AddTransactionCategoryParams params) async {
    try {
      final database = await this.database;
      final values = {
        TransactionCategoryFields.type: EnumUtil.toJson(params.type),
        TransactionCategoryFields.name: params.name,
        TransactionCategoryFields.color: params.color.toHex(),
        TransactionCategoryFields.icon: params.icon,
        TransactionCategoryFields.createdAt: DateTime.now().toIso8601String(),
      };
      final id = await database.insert(tableTransactionCategories, values);
      final category = await _getTransactionCategory(id);
      return Right(category);
    } catch (e) {
      return Left(DatabaseFailure(
        errorMessage: e.toString(),
        functionName: 'addCategory',
      ));
    }
  }

  Future<Either<Failure, List<TransactionCategory>>> getTransactionCategories() async {
    try {
      final database = await this.database;
      final rows = await database.query(tableTransactionCategories);
      final categories = rows.map((json) => TransactionCategory.fromJson(json)).toList();
      return Right(categories);
    } catch (e) {
      return Left(DatabaseFailure(
        errorMessage: e.toString(),
        functionName: 'getTransactionCategories',
      ));
    }
  }

  Future<Either<Failure, TransactionCategory>> getTransactionCategory(int id) async {
    try {
      final category = await _getTransactionCategory(id);
      return Right(category);
    } catch (e) {
      return Left(DatabaseFailure(
        errorMessage: e.toString(),
        functionName: 'getTransactionCategory',
      ));
    }
  }

  Future<Either<Failure, TransactionCategory>> changeTransactionCategory(ChangeTransactionCategoryParams params) async {
    try {
      final database = await this.database;
      final category = await _getTransactionCategory(params.id);
      await database.update(
        tableTransactionCategories,
        category
            .copyWith(
              name: params.name,
              icon: params.icon,
              color: params.color,
            )
            .toJson(),
        where: '${TransactionCategoryFields.id} = ?',
        whereArgs: [params.id],
      );
      final updatedCategory = await _getTransactionCategory(params.id);
      return Right(updatedCategory);
    } catch (e) {
      return Left(DatabaseFailure(
        errorMessage: e.toString(),
        functionName: 'changeTransactionCategory',
      ));
    }
  }

  Future<Either<Failure, None>> deleteTransactionCategory(int id) async {
    try {
      final database = await this.database;
      final List<Map<String, dynamic>> transactions = await database.query(
        tr.tableTransactions,
        where: '${tr.TransactionFields.categoryId} = ?',
        whereArgs: [id],
      );
      await database.transaction((txn) async {
        for (final transaction in transactions) {
          await txn.update(
            tr.tableTransactions,
            {tr.TransactionFields.categoryId: null},
            where: '${tr.TransactionFields.id} = ?',
            whereArgs: [transaction[tr.TransactionFields.id]],
          );
        }
        await txn.delete(
          tableTransactionCategories,
          where: '${TransactionCategoryFields.id} = ?',
          whereArgs: [id],
        );
      });
      return const Right(None());
    } catch (e) {
      return Left(DatabaseFailure(
        errorMessage: e.toString(),
        functionName: 'deleteTransactionCategory',
      ));
    }
  }

  Future<tr.Transaction> _getTransaction(int id) async {
    final database = await this.database;
    final row = (await database.query(tr.tableTransactions, where: '${tr.TransactionFields.id} = ?', whereArgs: [id], limit: 1)).first;
    final transaction = tr.Transaction.fromJson(row);
    return transaction;
  }

  Future<TransactionCategory> _getTransactionCategory(int id) async {
    final database = await this.database;
    final row = (await database.query(tableTransactionCategories, where: '${TransactionCategoryFields.id} = ?', whereArgs: [id], limit: 1)).first;
    final category = TransactionCategory.fromJson(row);
    return category;
  }

  List<TransactionCategory> defaultCategories = [
    TransactionCategory(
      id: 0,
      name: 'Здоровье',
      icon: Assets.images.transactions.health.path,
      color: Colors.red[400]!,
      type: tr.TransactionType.expense,
      createdAt: DateTime.now(),
    ),
    TransactionCategory(
      id: 1,
      name: 'Досуг',
      icon: Assets.images.transactions.leisure.path,
      color: Colors.green[400]!,
      type: tr.TransactionType.expense,
      createdAt: DateTime.now(),
    ),
    TransactionCategory(
      id: 2,
      name: 'Дом',
      icon: Assets.images.transactions.home.path,
      color: Colors.blue[400]!,
      type: tr.TransactionType.expense,
      createdAt: DateTime.now(),
    ),
    TransactionCategory(
      id: 3,
      name: 'Кафе',
      icon: Assets.images.transactions.cafe.path,
      color: Colors.orange[400]!,
      type: tr.TransactionType.expense,
      createdAt: DateTime.now(),
    ),
    TransactionCategory(
      id: 4,
      name: 'Образование',
      icon: Assets.images.transactions.study.path,
      color: Colors.purple[400]!,
      type: tr.TransactionType.expense,
      createdAt: DateTime.now(),
    ),
    TransactionCategory(
      id: 5,
      name: 'Подарки',
      icon: Assets.images.transactions.gifts.path,
      color: Colors.pink[400]!,
      type: tr.TransactionType.expense,
      createdAt: DateTime.now(),
    ),
    TransactionCategory(
      id: 6,
      name: 'Продукты',
      icon: Assets.images.transactions.products.path,
      color: Colors.indigo[400]!,
      type: tr.TransactionType.expense,
      createdAt: DateTime.now(),
    ),
    TransactionCategory(
      id: 7,
      name: 'Зарплата',
      icon: Assets.images.transactions.money.path,
      color: Colors.lightBlue[400]!,
      type: tr.TransactionType.income,
      createdAt: DateTime.now(),
    ),
    TransactionCategory(
      id: 8,
      name: 'Подарок',
      icon: Assets.images.transactions.gifts.path,
      color: Colors.lightGreen[400]!,
      type: tr.TransactionType.income,
      createdAt: DateTime.now(),
    ),
    TransactionCategory(
      id: 9,
      name: 'Дивиденды',
      icon: Assets.images.transactions.percent.path,
      color: Colors.tealAccent[400]!,
      type: tr.TransactionType.income,
      createdAt: DateTime.now(),
    ),
    TransactionCategory.otherCategory(tr.TransactionType.expense),
    TransactionCategory.otherCategory(tr.TransactionType.income),
  ];
}
