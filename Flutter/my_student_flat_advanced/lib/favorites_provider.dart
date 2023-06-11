import 'package:flutter/material.dart';

class FavoritesProvider with ChangeNotifier {
  List<String> favoriteItems = []; // Liste des éléments favoris

  // Méthode pour ajouter ou supprimer un élément des favoris
  void toggleFavorite(String item) {
    if (favoriteItems.contains(item)) {
      favoriteItems.remove(item);
    } else {
      favoriteItems.add(item);
    }
    notifyListeners(); // Notifier les auditeurs du changement d'état
  }

  // Méthode pour vérifier si un élément est favori ou non
  bool isFavorite(String item) {
    return favoriteItems.contains(item);
  }
}
