// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:otlozhka/core/database/transations_db.dart' as _i3;
import 'package:otlozhka/features/transactions/data/datasources/local_transaction_categories_source.dart'
    as _i4;
import 'package:otlozhka/features/transactions/data/datasources/local_transactions_source.dart'
    as _i5;
import 'package:otlozhka/features/transactions/data/repositories/transaction_categories_repository.dart'
    as _i7;
import 'package:otlozhka/features/transactions/data/repositories/transactions_repository.dart'
    as _i9;
import 'package:otlozhka/features/transactions/domain/repositories/transaction_catogory_repository.dart'
    as _i6;
import 'package:otlozhka/features/transactions/domain/repositories/transaction_repository.dart'
    as _i8;
import 'package:otlozhka/features/transactions/domain/usecases/transactions/add_transaction.dart'
    as _i10;
import 'package:otlozhka/features/transactions/domain/usecases/transactions/change_transaction.dart'
    as _i12;
import 'package:otlozhka/features/transactions/domain/usecases/transactions/detete_transaction.dart'
    as _i14;
import 'package:otlozhka/features/transactions/domain/usecases/transactions/get_transaction.dart'
    as _i16;
import 'package:otlozhka/features/transactions/domain/usecases/transactions/get_transactions.dart'
    as _i22;
import 'package:otlozhka/features/transactions/domain/usecases/transactions/get_transactions_by_category_id.dart'
    as _i17;
import 'package:otlozhka/features/transactions/domain/usecases/transactions/get_transactions_by_type.dart'
    as _i18;
import 'package:otlozhka/features/transactions/domain/usecases/transactions_category/add_transaction_category.dart'
    as _i11;
import 'package:otlozhka/features/transactions/domain/usecases/transactions_category/change_transaction_category.dart'
    as _i13;
import 'package:otlozhka/features/transactions/domain/usecases/transactions_category/detete_transaction_category.dart'
    as _i15;
import 'package:otlozhka/features/transactions/domain/usecases/transactions_category/get_transaction_catrgories.dart'
    as _i19;
import 'package:otlozhka/features/transactions/domain/usecases/transactions_category/get_transaction_catrgories_by_type.dart'
    as _i20;
import 'package:otlozhka/features/transactions/domain/usecases/transactions_category/get_transaction_catrgory.dart'
    as _i21;
import 'package:otlozhka/features/transactions/presentation/bloc/transaction_categories_bloc/transaction_categories_bloc.dart'
    as _i23;
import 'package:otlozhka/features/transactions/presentation/bloc/transactions_bloc/transactions_bloc.dart'
    as _i24;

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
    gh.factory<_i3.TransactionsDatabase>(() => _i3.TransactionsDatabase());
    gh.factory<_i4.TransactionCategorySource>(() =>
        _i4.LocalTransactionCategorySource(gh<_i3.TransactionsDatabase>()));
    gh.factory<_i5.TransactionSource>(
        () => _i5.LocalTransactionSource(gh<_i3.TransactionsDatabase>()));
    gh.factory<_i6.ITransactionCategoryRepository>(() =>
        _i7.TransactionCategoryRepository(gh<_i4.TransactionCategorySource>()));
    gh.factory<_i8.ITransactionRepository>(
        () => _i9.TransactionRepository(gh<_i5.TransactionSource>()));
    gh.factory<_i10.AddTransaction>(
        () => _i10.AddTransaction(gh<_i8.ITransactionRepository>()));
    gh.factory<_i11.AddTransactionCategory>(() =>
        _i11.AddTransactionCategory(gh<_i6.ITransactionCategoryRepository>()));
    gh.factory<_i12.ChangeTransaction>(
        () => _i12.ChangeTransaction(gh<_i8.ITransactionRepository>()));
    gh.factory<_i13.ChangeTransactionCategory>(() =>
        _i13.ChangeTransactionCategory(
            gh<_i6.ITransactionCategoryRepository>()));
    gh.factory<_i14.DeleteTransaction>(
        () => _i14.DeleteTransaction(gh<_i8.ITransactionRepository>()));
    gh.factory<_i15.DeleteTransactionCategory>(() =>
        _i15.DeleteTransactionCategory(
            gh<_i6.ITransactionCategoryRepository>()));
    gh.factory<_i16.GetTransaction>(
        () => _i16.GetTransaction(gh<_i8.ITransactionRepository>()));
    gh.factory<_i17.GetTransactionByCategoryId>(() =>
        _i17.GetTransactionByCategoryId(gh<_i8.ITransactionRepository>()));
    gh.factory<_i18.GetTransactionByType>(
        () => _i18.GetTransactionByType(gh<_i8.ITransactionRepository>()));
    gh.factory<_i19.GetTransactionCategories>(() =>
        _i19.GetTransactionCategories(
            gh<_i6.ITransactionCategoryRepository>()));
    gh.factory<_i20.GetTransactionCategoriesByType>(() =>
        _i20.GetTransactionCategoriesByType(
            gh<_i6.ITransactionCategoryRepository>()));
    gh.factory<_i21.GetTransactionCategory>(() =>
        _i21.GetTransactionCategory(gh<_i6.ITransactionCategoryRepository>()));
    gh.factory<_i22.GetTransactions>(
        () => _i22.GetTransactions(gh<_i8.ITransactionRepository>()));
    gh.singleton<_i23.TransactionCategoriesBloc>(
        () => _i23.TransactionCategoriesBloc(
              addTransactionCategory: gh<_i11.AddTransactionCategory>(),
              changeTransactionCategory: gh<_i13.ChangeTransactionCategory>(),
              getTransactionCategory: gh<_i21.GetTransactionCategory>(),
              getTransactionCategories: gh<_i19.GetTransactionCategories>(),
            ));
    gh.singleton<_i24.TransactionsBloc>(() => _i24.TransactionsBloc(
          addTransaction: gh<_i10.AddTransaction>(),
          changeTransaction: gh<_i12.ChangeTransaction>(),
          getTransaction: gh<_i16.GetTransaction>(),
          getTransactions: gh<_i22.GetTransactions>(),
        ));
    return this;
  }
}
