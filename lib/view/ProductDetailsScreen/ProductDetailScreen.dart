import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/view/EditScreen/editScreen.dart';
import 'package:shopping_app/view/bloc/ProductDetail_bloc/product_details_bloc.dart';

class ProductDetailScreen extends StatefulWidget {
  final int id;

  ProductDetailScreen({
    required this.id,
  });
  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        context
            .read<ProductDetailsBloc>()
            .add(FetchProcuctById(productId: widget.id));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    String? selectedItem;
    return Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple.withOpacity(0.8),
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.shopping_cart, color: Colors.white),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Add to Cart',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          scrolledUnderElevation: 0,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Editscreen(),
                      ));
                },
                icon: const Icon(Icons.edit))
          ],
        ),
        body: BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
          builder: (context, state) {
            if (state is ProductLoadingState) {
              log('Loading State');
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ProductLoadedState) {
              return SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                        child: SingleChildScrollView(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          1,
                          (index) => Image.network(
                            state.product?.images![0].toString() ?? '',
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    )),
                    const SizedBox(height: 16),
                    Text(
                      state.product?.title.toString() ?? '',
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '\$${state.product?.price.toString()}',
                      style: const TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      height: 30,
                      width: 80,
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(state.product?.category.toString() ?? ''),
                      ),
                    ),
                    const SizedBox(
                      height: 9,
                    ),
                    const Text(
                      'About the item',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      state.product?.description.toString() ?? '',
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              );
            }

            if (state is ProductErrorState) {
              return Center(
                child: Text(state.error.toString()),
              );
            }

            return const SizedBox();
          },
        ));
  }
}
