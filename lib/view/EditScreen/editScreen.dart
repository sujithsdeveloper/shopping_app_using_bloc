import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/view/bloc/product_details_bloc.dart';

class Editscreen extends StatelessWidget {
  const Editscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SearchBar(
              backgroundColor: WidgetStatePropertyAll(
                Colors.white,
              ),
              controller: controller,
              keyboardType: TextInputType.number,
              hintText: 'Enter product id',
            ),
          ),
          SizedBox(height: 25),
          ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                  Colors.purple.withOpacity(0.8),
                ),
              ),
              onPressed: () {
                context.read<ProductDetailsBloc>().add(
                    FetchProcuctById(productId: int.parse(controller.text)));
                Navigator.pop(context);
              },
              child: Text(
                'Change Product',
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
    );
  }
}
