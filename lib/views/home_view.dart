import 'package:destech_app/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/constants.dart';
import '../utils/methods.dart';
import '../viewmodel/book_list_view_model.dart';
import '../widgets/all_listview.dart';
import '../widgets/favourites_listview.dart';
import 'favourites_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, "Home"),
      body: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.paddingSmallWidth),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              context.sizedBoxHeightExtraSmall,
              Expanded(
                flex: 4,
                child: CategoryListView(
                  onTap: () {
                    navigateToWidget(
                      context,
                      const FavouritesView(),
                    );
                  },
                  height: context.dynamicHeight(0.14),
                  width: context.dynamicWidth(0.4),
                  title: 'Favourites 1',
                  image: AppConstants.picture,
                ),
              ),
              context.sizedBoxHeightExtraSmall,
              Text("Book List", style: context.headline6),
              const Divider(
                thickness: 2,
              ),
              Expanded(
                flex: 15,
                child: BookLGridView(
                    bookViewModel:
                    context.viewModel.bookViewModel),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

AppBar buildAppBar(BuildContext context, String title) {
  return AppBar(
    actions: [
        IconButton(onPressed: (){
          Provider.of<BookListViewModel>(context,listen: false).changeTheme();
        }, icon: const Icon(Icons.sunny_snowing))
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
