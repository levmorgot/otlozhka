// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:otlozhka/core/database/transations_db.dart' as _i4;
import 'package:otlozhka/features/transactions/data/datasources/local_transaction_categories_source.dart'
    as _i5;
import 'package:otlozhka/features/transactions/data/datasources/local_transactions_source.dart'
    as _i6;
import 'package:otlozhka/features/transactions/data/repositories/transaction_categories_repository.dart'
    as _i8;
import 'package:otlozhka/features/transactions/data/repositories/transactions_repository.dart'
    as _i10;
import 'package:otlozhka/features/transactions/domain/repositories/transaction_catogory_repository.dart'
    as _i7;
import 'package:otlozhka/features/transactions/domain/repositories/transaction_repository.dart'
    as _i9;
import 'package:otlozhka/features/transactions/domain/usecases/transactions/add_transaction.dart'
    as _i11;
import 'package:otlozhka/features/transactions/domain/usecases/transactions/change_transaction.dart'
    as _i13;
import 'package:otlozhka/features/transactions/domain/usecases/transactions/detete_transaction.dart'
    as _i15;
import 'package:otlozhka/features/transactions/domain/usecases/transactions/get_transaction.dart'
    as _i17;
import 'package:otlozhka/features/transactions/domain/usecases/transactions/get_transactions.dart'
    as _i23;
import 'package:otlozhka/features/transactions/domain/usecases/transactions/get_transactions_by_category_id.dart'
    as _i18;
import 'package:otlozhka/features/transactions/domain/usecases/transactions/get_transactions_by_type.dart'
    as _i19;
import 'package:otlozhka/features/transactions/domain/usecases/transactions_category/add_transaction_category.dart'
    as _i12;
import 'package:otlozhka/features/transactions/domain/usecases/transactions_category/change_transaction_category.dart'
    as _i14;
import 'package:otlozhka/features/transactions/domain/usecases/transactions_category/detete_transaction_category.dart'
    as _i16;
import 'package:otlozhka/features/transactions/domain/usecases/transactions_category/get_transaction_catrgories.dart'
    as _i20;
import 'package:otlozhka/features/transactions/domain/usecases/transactions_category/get_transaction_catrgories_by_type.dart'
    as _i21;
import 'package:otlozhka/features/transactions/domain/usecases/transactions_category/get_transaction_catrgory.dart'
    as _i22;
import 'package:otlozhka/features/transactions/presentation/bloc/transaction_categories_bloc/transaction_categories_bloc.dart'
    as _i24;
import 'package:otlozhka/features/transactions/presentation/bloc/transactions_bloc/transactions_bloc.dart'
    as _i25;
import 'package:otlozhka/features/transactions/presentation/controllers/form_transaction_controller.dart'
    as _i3;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.FormTransactionController>(
        () => _i3.FormTransactionController());
    gh.factory<_i4.TransactionsDatabase>(() => _i4.TransactionsDatabase());
    gh.factory<_i5.TransactionCategorySource>(() =>
        _i5.LocalTransactionCategorySource(gh<_i4.TransactionsDatabase>()));
    gh.factory<_i6.TransactionSource>(
        () => _i6.LocalTransactionSource(gh<_i4.TransactionsDatabase>()));
    gh.factory<_i7.ITransactionCategoryRepository>(() =>
        _i8.TransactionCategoryRepository(gh<_i5.TransactionCategorySource>()));
    gh.factory<_i9.ITransactionRepository>(
        () => _i10.TransactionRepository(gh<_i6.TransactionSource>()));
    gh.factory<_i11.AddTransaction>(
        () => _i11.AddTransaction(gh<_i9.ITransactionRepository>()));
    gh.factory<_i12.AddTransactionCategory>(() =>
        _i12.AddTransactionCategory(gh<_i7.ITransactionCategoryRepository>()));
    gh.factory<_i13.ChangeTransaction>(
        () => _i13.ChangeTransaction(gh<_i9.ITransactionRepository>()));
    gh.factory<_i14.ChangeTransactionCategory>(() =>
        _i14.ChangeTransactionCategory(
            gh<_i7.ITransactionCategoryRepository>()));
    gh.factory<_i15.DeleteTransaction>(
        () => _i15.DeleteTransaction(gh<_i9.ITransactionRepository>()));
    gh.factory<_i16.DeleteTransactionCategory>(() =>
        _i16.DeleteTransactionCategory(
            gh<_i7.ITransactionCategoryRepository>()));
    gh.factory<_i17.GetTransaction>(
        () => _i17.GetTransaction(gh<_i9.ITransactionRepository>()));
    gh.factory<_i18.GetTransactionByCategoryId>(() =>
        _i18.GetTransactionByCategoryId(gh<_i9.ITransactionRepository>()));
    gh.factory<_i19.GetTransactionByType>(
        () => _i19.GetTransactionByType(gh<_i9.ITransactionRepository>()));
    gh.factory<_i20.GetTransactionCategories>(() =>
        _i20.GetTransactionCategories(
            gh<_i7.ITransactionCategoryRepository>()));
    gh.factory<_i21.GetTransactionCategoriesByType>(() =>
        _i21.GetTransactionCategoriesByType(
            gh<_i7.ITransactionCategoryRepository>()));
    gh.factory<_i22.GetTransactionCategory>(() =>
        _i22.GetTransactionCategory(gh<_i7.ITransactionCategoryRepository>()));
    gh.factory<_i23.GetTransactions>(
        () => _i23.GetTransactions(gh<_i9.ITransactionRepository>()));
    gh.lazySingleton<_i24.TransactionCategoriesBloc>(
        () => _i24.TransactionCategoriesBloc(
              addTransactionCategory: gh<_i12.AddTransactionCategory>(),
              changeTransactionCategory: gh<_i14.ChangeTransactionCategory>(),
              getTransactionCategory: gh<_i22.GetTransactionCategory>(),
              getTransactionCategories: gh<_i20.GetTransactionCategories>(),
            ));
    gh.lazySingleton<_i25.TransactionsBloc>(() => _i25.TransactionsBloc(
          addTransaction: gh<_i11.AddTransaction>(),
          changeTransaction: gh<_i13.ChangeTransaction>(),
          deleteTransaction: gh<_i15.DeleteTransaction>(),
          getTransactions: gh<_i23.GetTransactions>(),
        ));
    return this;
  }
}
