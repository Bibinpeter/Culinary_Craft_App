import 'package:flutter/material.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  List<String> favoriteItems = [];

  void _addToFavorites(bool isFavorite, String title) {
    setState(() {
      if (isFavorite) {
        favoriteItems.add(title);
      } else {
        favoriteItems.remove(title);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
        centerTitle: true,
        backgroundColor: Colors.teal, // Set your preferred color
        elevation: 0, // Remove the elevation
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: favoriteItems.isEmpty
            ? const Center(
                child: Text(
                  'No favorites yet!',
                  style: TextStyle(fontSize: 18),
                ),
              )
            : ListView.builder(
                itemCount: favoriteItems.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 3,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(
                        favoriteItems[index],
                        style: TextStyle(fontSize: 16),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          _removeFromFavorites(index);
                        },
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }

  void _removeFromFavorites(int index) {
    setState(() {
      favoriteItems.removeAt(index);
    });
  }
}
