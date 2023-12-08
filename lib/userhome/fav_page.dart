import 'package:flutter/material.dart';
import 'package:prj1/adminpages/hive_db.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  void initState() {
    super.initState();
    getFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
        centerTitle: true,
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: ValueListenableBuilder(
        valueListenable: favoriteNotifier,
        builder: (context, value, _) {
          return Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 14, 254, 230),
                  Color.fromARGB(255, 255, 25, 133),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: value.isEmpty
                ? const Center(
                    child: Text(
                      'No favorites yet!',
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                : ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: value.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8),
                        child: Container(
                          width: 150, // Adjust the width as needed
                          decoration: BoxDecoration(
                            color: Colors.teal,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                value[index].title,
                                style: const TextStyle(fontSize: 16, color: Colors.white),
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  // Handle delete action
                                },
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          );
        },
      ),
    );
  }
}
