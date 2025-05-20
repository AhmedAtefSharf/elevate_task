import 'package:either_dart/src/either.dart';
import 'package:elevate_task/core/errors/faliure.dart';
import 'package:elevate_task/core/utilis/api_constance.dart';
import 'package:elevate_task/fetures/products/data/models/product.dart';
import 'package:elevate_task/fetures/products/data/repos/product_repo.dart';
import 'package:elevate_task/fetures/products/data/services/api_service.dart';

class ProductRepoimpl implements ProductRepo {
  final ApiService apiService;

  ProductRepoimpl(this.apiService);

  @override
  Future<Either<Failure, List<Product>>> fetchProducts() async {
    try {
      var data = await apiService.get(url: ApiConstance.apiUrl);
      List<Product> products = [];

      for (var item in data) {
        products.add(Product.fromJson(item));
      }

      return Right(products);

      return Right(products);
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
