import 'package:destech_app/routes/routes.dart';
import 'package:destech_app/viewmodel/book_list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
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
      builder: (context, child) {
        final vm = Provider.of<BookListViewModel>(context);
        return GetMaterialApp(
          theme: vm.isDark
              ? ThemeData.dark().copyWith(primaryColor: Colors.pinkAccent)
              : ThemeData.light().copyWith(primaryColor: Colors.pinkAccent),
          debugShowCheckedModeBanner: false,
          getPages: AppRoutes.routes,
          initialRoute: "/splash",
        );
      },
    );
  }
}
