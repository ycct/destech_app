import 'package:destech_app/utils/extensions.dart';
import 'package:flutter/material.dart';
import '../widgets/all_listview.dart';
import 'home_view.dart';

class FavouritesView extends StatelessWidget {
  const FavouritesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, "Favourites"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.paddingSmallWidth),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            context.sizedBoxHeightExtraSmall,
            Expanded(
              flex: 15,
              child: BookLGridView(
                bookViewModel:  context.viewModel.favouriteBooks,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
