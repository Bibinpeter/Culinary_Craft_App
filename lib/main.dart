
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:prj1/adminpages/models/model.dart';
import 'package:prj1/indropages/showp.dart';
import 'package:prj1/indropages/widgets/helper/helper.dart';
import 'package:prj1/userhome/bottomnav.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.registerAdapter(RecipeAdapter());
  await Hive.initFlutter();
 

  if (kIsWeb) {
    await Firebase.initializeApp(
        );
  } else {
    await Firebase.initializeApp(); 
  }

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isSignedIn = false;

  @override
  void initState() {
    super.initState();
    getUserLoggedInStatus();
  }

  getUserLoggedInStatus() async {
    await HelperFunctions.getUserLoggedInStatus().then((value) {
      if (value != null) {
        setState(() {
          _isSignedIn = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      debugShowCheckedModeBanner: false,
      home: _isSignedIn ?  const BottomNav(): const Showp(),
    );
  }
}