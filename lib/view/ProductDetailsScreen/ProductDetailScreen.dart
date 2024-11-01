import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/view/EditScreen/editScreen.dart';
import 'package:shopping_app/view/bloc/product_details_bloc.dart';

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
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Editscreen(),
                      ));
                },
                icon: Icon(Icons.edit))
          ],
        ),
        body: BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
          builder: (context, state) {
            if (state is ProductLoadingState) {
              log('Loading State');
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ProductLoadedState) {
              return SingleChildScrollView(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.network(
                        state.product?.images![0].toString() ?? '',
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      state.product?.title.toString() ?? '',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      state.product?.price.toString() ?? '',
                      style: TextStyle(fontSize: 24, color: Colors.purple),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'About the item',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      state.product?.description.toString() ?? '',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple.withOpacity(0.8),
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Row(
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
              );
            }

            if (state is ProductErrorState) {
              return Center(
                child: Text(state.error.toString()),
              );
            }

            return SizedBox();
          },
        ));
  }
}
