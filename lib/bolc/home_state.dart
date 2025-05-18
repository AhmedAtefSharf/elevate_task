import 'package:elevate_task/models/card_model.dart';

abstract class HomeState {}

class HomeInitState extends HomeState {}

class HomeGetLoadingState extends HomeState {}

class HomeGetSuccessState extends HomeState {
  final List<GetData> products;
  HomeGetSuccessState(this.products);
}

class HomeGetErrorState extends HomeState {
  final String error;
  HomeGetErrorState(this.error);
}