import 'package:destech_app/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodel/book_list_view_model.dart';

AppBar buildAppBar(BuildContext context, String title) {
  return AppBar(
    actions: [
      IconButton(
        onPressed: () {
          Provider.of<BookListViewModel>(context, listen: false).changeTheme();
        },
        icon: const Icon(Icons.sunny_snowing),
      ),
    ],
    backgroundColor: context.primaryColor,
    iconTheme: IconThemeData(
      color: context.scaffoldBackgroundColor,
    ),
    centerTitle: true,
    title: Text(
      title,
      style: context.headline6!.copyWith(
        color: context.scaffoldBackgroundColor,
      ),
    ),
  );
}
