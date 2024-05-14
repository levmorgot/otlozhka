// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:otlozhka/core/database/transations_db.dart' as _i5;
import 'package:otlozhka/features/transactions/data/datasources/local_transaction_categories_source.dart'
    as _i6;
import 'package:otlozhka/features/transactions/data/datasources/local_transactions_source.dart'
    as _i7;
import 'package:otlozhka/features/transactions/data/repositories/transaction_categories_repository.dart'
    as _i9;
import 'package:otlozhka/features/transactions/data/repositories/transactions_repository.dart'
    as _i11;
import 'package:otlozhka/features/transactions/domain/repositories/transaction_catogory_repository.dart'
    as _i8;
import 'package:otlozhka/features/transactions/domain/repositories/transaction_repository.dart'
    as _i10;
import 'package:otlozhka/features/transactions/domain/usecases/transactions/add_transaction.dart'
    as _i12;
import 'package:otlozhka/features/transactions/domain/usecases/transactions/change_transaction.dart'
    as _i14;
import 'package:otlozhka/features/transactions/domain/usecases/transactions/detete_transaction.dart'
    as _i16;
import 'package:otlozhka/features/transactions/domain/usecases/transactions/get_transaction.dart'
    as _i18;
import 'package:otlozhka/features/transactions/domain/usecases/transactions/get_transactions.dart'
    as _i24;
import 'package:otlozhka/features/transactions/domain/usecases/transactions/get_transactions_by_category_id.dart'
    as _i19;
import 'package:otlozhka/features/transactions/domain/usecases/transactions/get_transactions_by_type.dart'
    as _i20;
import 'package:otlozhka/features/transactions/domain/usecases/transactions_category/add_transaction_category.dart'
    as _i13;
import 'package:otlozhka/features/transactions/domain/usecases/transactions_category/change_transaction_category.dart'
    as _i15;
import 'package:otlozhka/features/transactions/domain/usecases/transactions_category/detete_transaction_category.dart'
    as _i17;
import 'package:otlozhka/features/transactions/domain/usecases/transactions_category/get_transaction_catrgories.dart'
    as _i21;
import 'package:otlozhka/features/transactions/domain/usecases/transactions_category/get_transaction_catrgories_by_type.dart'
    as _i22;
import 'package:otlozhka/features/transactions/domain/usecases/transactions_category/get_transaction_catrgory.dart'
    as _i23;
import 'package:otlozhka/features/transactions/presentation/bloc/transaction_categories_bloc/transaction_categories_bloc.dart'
    as _i25;
import 'package:otlozhka/features/transactions/presentation/bloc/transactions_bloc/transactions_bloc.dart'
    as _i26;
import 'package:otlozhka/features/transactions/presentation/controllers/form_transaction_controller.dart'
    as _i4;
import 'package:otlozhka/routes/router.dart' as _i3;

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
    gh.singleton<_i3.AppRouter>(() => _i3.AppRouter());
    gh.factory<_i4.FormTransactionController>(
        () => _i4.FormTransactionController());
    gh.factory<_i5.TransactionsDatabase>(() => _i5.TransactionsDatabase());
    gh.factory<_i6.TransactionCategorySource>(() =>
        _i6.LocalTransactionCategorySource(gh<_i5.TransactionsDatabase>()));
    gh.factory<_i7.TransactionSource>(
        () => _i7.LocalTransactionSource(gh<_i5.TransactionsDatabase>()));
    gh.factory<_i8.ITransactionCategoryRepository>(() =>
        _i9.TransactionCategoryRepository(gh<_i6.TransactionCategorySource>()));
    gh.factory<_i10.ITransactionRepository>(
        () => _i11.TransactionRepository(gh<_i7.TransactionSource>()));
    gh.factory<_i12.AddTransaction>(
        () => _i12.AddTransaction(gh<_i10.ITransactionRepository>()));
    gh.factory<_i13.AddTransactionCategory>(() =>
        _i13.AddTransactionCategory(gh<_i8.ITransactionCategoryRepository>()));
    gh.factory<_i14.ChangeTransaction>(
        () => _i14.ChangeTransaction(gh<_i10.ITransactionRepository>()));
    gh.factory<_i15.ChangeTransactionCategory>(() =>
        _i15.ChangeTransactionCategory(
            gh<_i8.ITransactionCategoryRepository>()));
    gh.factory<_i16.DeleteTransaction>(
        () => _i16.DeleteTransaction(gh<_i10.ITransactionRepository>()));
    gh.factory<_i17.DeleteTransactionCategory>(() =>
        _i17.DeleteTransactionCategory(
            gh<_i8.ITransactionCategoryRepository>()));
    gh.factory<_i18.GetTransaction>(
        () => _i18.GetTransaction(gh<_i10.ITransactionRepository>()));
    gh.factory<_i19.GetTransactionByCategoryId>(() =>
        _i19.GetTransactionByCategoryId(gh<_i10.ITransactionRepository>()));
    gh.factory<_i20.GetTransactionByType>(
        () => _i20.GetTransactionByType(gh<_i10.ITransactionRepository>()));
    gh.factory<_i21.GetTransactionCategories>(() =>
        _i21.GetTransactionCategories(
            gh<_i8.ITransactionCategoryRepository>()));
    gh.factory<_i22.GetTransactionCategoriesByType>(() =>
        _i22.GetTransactionCategoriesByType(
            gh<_i8.ITransactionCategoryRepository>()));
    gh.factory<_i23.GetTransactionCategory>(() =>
        _i23.GetTransactionCategory(gh<_i8.ITransactionCategoryRepository>()));
    gh.factory<_i24.GetTransactions>(
        () => _i24.GetTransactions(gh<_i10.ITransactionRepository>()));
    gh.factory<_i25.TransactionCategoriesBloc>(
        () => _i25.TransactionCategoriesBloc(
              addTransactionCategory: gh<_i13.AddTransactionCategory>(),
              changeTransactionCategory: gh<_i15.ChangeTransactionCategory>(),
              getTransactionCategory: gh<_i23.GetTransactionCategory>(),
              getTransactionCategories: gh<_i21.GetTransactionCategories>(),
            ));
    gh.factory<_i26.TransactionsBloc>(() => _i26.TransactionsBloc(
          addTransaction: gh<_i12.AddTransaction>(),
          changeTransaction: gh<_i14.ChangeTransaction>(),
          getTransaction: gh<_i18.GetTransaction>(),
          getTransactions: gh<_i24.GetTransactions>(),
        ));
    return this;
  }
}
