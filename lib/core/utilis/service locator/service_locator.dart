import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:elevate_task/fetures/products/data/repos/product_repo_impl.dart';
import 'package:elevate_task/fetures/products/data/services/api_service.dart';

final sl = GetIt.instance;

void initServiceLocator() {
  sl.registerSingleton(ApiService(Dio()));
  sl.registerSingleton<ProductRepoimpl>(ProductRepoimpl(
    sl.get<ApiService>(),
  ));
}
