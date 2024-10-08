import 'package:flutter/material.dart';
import 'package:api_app_mvvm/models/Cat.dart';
import 'package:api_app_mvvm/services/CatService.dart';

class CatViewModel extends ChangeNotifier {
  final CatService catService = new CatService();
  Cat? _cat;

  bool _isLoading = false;

  Cat? get cat => _cat;

  bool get isLoading => _isLoading;

  Future<void> fetchRandomCat() async {
    _isLoading = true;
    notifyListeners();

    try {
      _cat = await catService.fetchRandomCat();
    } catch (e) {
      print("Error: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
