import 'package:flutter/material.dart';

class Admsearch extends StatelessWidget {
  const Admsearch({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 254, 254),
      body: Center(
        child: Column(
          children: [
           
            Padding(
              padding: const EdgeInsets.all(66),
              child: Container(
                width: 200,
                height: 200,
                color: const Color.fromARGB(255, 37, 66, 96),
                child: const Center(
                  child: Text(
                    'add photo',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  
                ),
                
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: (){},
                 child: const Text("add")),
                 SizedBox(width: 20, ),
                 const Icon(Icons.delete)
              ],
            )
          ],
        ),
      ),
    );
  }
}
