import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:elevate_task/core/utilis/app_assets.dart';
import 'package:elevate_task/fetures/products/ui/manager/product_cubit/products_cubit.dart';
import 'package:elevate_task/fetures/products/ui/view/widgets/custom_error_widget.dart';
import 'package:elevate_task/fetures/products/ui/view/widgets/loading_widget.dart';
import '../products_widget.dart';

class ProductListView extends StatelessWidget {
  ProductListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leadingWidth: 90,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Image.asset(AppAssets.logo),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              children: [
                Container(
                    width: 300,
                    height: 50,
                    decoration: ShapeDecoration(
                      color: Colors.white.withOpacity(0.699999988079071),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1, color: Color(0xFF004182)),
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: TextFormField(

                      decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(AppAssets.iconSearch),
                      ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(50)),
                      ),
                    )),
                SizedBox(width: 5,),
                Image.asset(AppAssets.iconCart, width: 30),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: BlocBuilder<ProductsCubit, ProductsState>(
              builder: (context, state) {
                if (state is ProductsSuccess) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio: 0.65,
                        ),
                        shrinkWrap: true,
                        itemCount: state.products.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) => ProductWidget(
                              product: state.products[index],
                            )),
                  );
                } else if (state is ProductsFailure) {
                  return CustomErrorWidget(errorMessage: state.errMessage);
                }
                return LoadingWidget();
              },
            ),
          ),
        ],
      ),
    );
  }
}
