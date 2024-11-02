import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/view/bloc/ProductDetail_bloc/product_details_bloc.dart';

class Editscreen extends StatelessWidget {
  const Editscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final titleController = TextEditingController();
    final priceController = TextEditingController();
    final descriptionController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Change Product by ID'),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(height: 30),
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(
                  hintText: 'Title',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 25),
              TextFormField(
                controller: priceController,
                decoration: InputDecoration(
                  hintText: 'Price',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a price';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 25),
              TextFormField(
                controller: descriptionController,
                decoration: InputDecoration(
                  hintText: 'Description',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 25),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                    Colors.purple.withOpacity(0.8),
                  ),
                ),
                onPressed: () {
                  if (formKey.currentState?.validate() ?? false) {
                    context.read<ProductDetailsBloc>().add(
                          FetchProcuctById(
                              productId: int.parse(titleController.text)),
                        );
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content:  Text('Data edited Successfully')));
                  }
                },
                child: const Text(
                  'Change Product',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
