import 'package:destech_app/viewmodel/book_list_view_model.dart';
import 'package:destech_app/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BookListViewModel(),
      child: MaterialApp(
        theme: ThemeData.dark().copyWith(primaryColor: Colors.pinkAccent),
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        routes: {
          '/': (context) => const SplashView(),
        },
      ),
    );
  }
}
