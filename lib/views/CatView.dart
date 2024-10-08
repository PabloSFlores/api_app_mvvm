import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:api_app_mvvm/viewmodels/CatViewModel.dart';

class CatView extends StatefulWidget {
  @override
  _CatViewState createState() => _CatViewState();
}

class _CatViewState extends State<CatView> {
  @override
  void initState() {
    super.initState();
    Provider.of<CatViewModel>(context, listen: false).fetchRandomCat();
  }

  @override
  Widget build(BuildContext context) {
    // Obtener el tamaño de la pantalla en la que se está ejecutando la aplicación
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return ChangeNotifierProvider(
      create: (context) => CatViewModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Detalles del gato"),
        ),
        body: Center(
          child: Consumer<CatViewModel>(
            builder: (context, viewModel, child) {
              if (viewModel.isLoading) {
                return const CircularProgressIndicator();
              }

              if (viewModel.cat != null && viewModel.cat!.url.isNotEmpty) {
                return Column(
                  children: [
                    Image.network(
                      viewModel.cat!.url,
                      width: screenWidth * 0.8,
                      height: screenHeight * 0.5,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          viewModel.fetchRandomCat();
                        });
                      },
                      child: const Text("Mostrar otro gato"),
                    ),
                  ],
                );
              }

              return ElevatedButton(
                onPressed: () {
                  viewModel.fetchRandomCat();
                },
                child: Text("Ver otro gato"),
              );
            },
          ),
        ),
      ),
    );
  }
}
