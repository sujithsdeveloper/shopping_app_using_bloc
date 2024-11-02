import 'package:flutter/material.dart';

class Cartscreen extends StatelessWidget {
  const Cartscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
          'Cart',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: List.generate(
          5,
          (index) => const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Card(
              color: Colors.white,
              elevation: 6,
              child: ListTile(
                leading: Image(
                    image: NetworkImage(
                        'https://images.pexels.com/photos/29191749/pexels-photo-29191749/free-photo-of-traditional-farmer-in-rural-vietnamese-setting.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load')),
                title: Text(
                  'data',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  'data',
                  style: TextStyle(color: Colors.black),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.black,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 13,
                          child: Icon(
                            Icons.add,
                            color: Colors.black,
                            size: 15,
                          ),
                        )),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        '1',
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ),
                    CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.black,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 13,
                          child: Icon(
                            Icons.remove,
                            color: Colors.black,
                            size: 15,
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
