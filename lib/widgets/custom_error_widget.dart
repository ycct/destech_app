import 'package:destech_app/utils/extensions.dart';
import 'package:destech_app/views/components/components.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodel/book_list_view_model.dart';

class CustomErrorWidget extends StatelessWidget {
  final String title;

  const CustomErrorWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title),
      body: RefreshIndicator(
        color: context.primaryColor,
        onRefresh: () async {
          await Provider.of<BookListViewModel>(context, listen: false)
              .getData(context);
        },
        child: ListView(
          children: [
            context.sizedBoxHeightDefault,
            Center(
              child: Text(
                title,style: context.headline4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
