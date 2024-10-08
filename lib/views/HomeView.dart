import 'package:flutter/material.dart';
import 'package:api_app_mvvm/views/CatView.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pantalla principal"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => CatView()));
          },
          child: Text("Ver un gato"),
        ),
      ),
    );
  }
}
