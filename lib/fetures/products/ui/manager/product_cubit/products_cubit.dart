import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:elevate_task/fetures/products/data/models/product.dart';
import 'package:elevate_task/fetures/products/data/repos/product_repo.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.productRepo) : super(ProductsInitial());
  final ProductRepo productRepo;

  Future<void> fetchProducts() async {
    emit(ProductsLoading());
    var result = await productRepo.fetchProducts();
    result.fold(
      (failure) => emit(ProductsFailure(failure.errorMessage)),
      (products) => emit(
        ProductsSuccess(products),
      ),
    );
  }
}
