import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/view/bloc/api_products_bloc.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        context.read<ApiProductsBloc>().add(getDataEvent());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () {
          context.read<ApiProductsBloc>().add(getDataEvent());
        }),
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Discover our exclusive products'),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: BlocBuilder<ApiProductsBloc, ApiProductsState>(
          builder: (context, state) {
            if (state is ProductsInitialState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ProductsLoadedState) {
              var data = state.ProductDataList!;
              return GridView.builder(
                padding: EdgeInsets.all(16),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.7,
                ),
                itemCount: state.ProductDataList!.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => ProductDetailScreen(product: product),
                      //   ),
                      // );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Image.network(
                              data[index].images![index].toString(),
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              data[index].title!.toString(),
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              data[index].description!.toString(),
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '\$${data[index].price!.toString()},',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.purple),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }

            if (state is ProductsErrorState) {
              return Center(
                child: Text(state.error.toString()),
              );
            }

            return SizedBox();
          },
        ));
  }
}
