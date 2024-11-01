import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/view/ProductDetailsScreen/ProductDetailScreen.dart';
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
      (timeStamp) async {
        context.read<ApiProductsBloc>().add(getDataEvent());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          scrolledUnderElevation: 0,
          leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.menu,
                color: Colors.black,
              )),
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.shopping_bag_rounded,
                  color: Colors.black,
                ))
          ],
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
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        'Discover our exclusive \nproducts',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                    ),
                    SizedBox(height: 9),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        'In this markect place you will find various\ntechnics in the cheapest price',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    Row(
                      children: [],
                    ),
                    GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductDetailScreen(
                                  id: data[index].id!.toInt(),
                                ),
                              ),
                            );
                          },
                          child: Stack(
                            children: [
                              Card(
                                color: Colors.white.withOpacity(0.8),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Image.network(
                                          data[index].images![0].toString(),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        data[index].title!.toString(),
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: Text(
                                        data[index].description!.toString(),
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.grey),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        '\$${data[index].price!.toString()}',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                right: 5,
                                child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.favorite_border,
                                      color: Colors.black,
                                    )),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
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
