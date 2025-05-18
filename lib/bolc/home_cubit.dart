import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:elevate_task/bolc/home_state.dart';
import '../models/card_model.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitState());

  Future<void> getApiData() async {
    emit(HomeGetLoadingState());
    try {
      final response = await http.get(
        Uri.parse('https://fakestoreapi.com/products'),
      );
      if (response.statusCode == 200) {
        List<dynamic> jsonList = jsonDecode(response.body);
        List<GetData> products =
            jsonList.map((json) => GetData.fromJson(json)).toList();
        emit(HomeGetSuccessState(products));
      } else {
        emit(
          HomeGetErrorState("Failed to load products: ${response.statusCode}"),
        );
      }
    } catch (e) {
      emit(HomeGetErrorState("Error: ${e.toString()}"));
    }
  }
}
