import 'package:destech_app/utils/alert_enum.dart';
import 'package:destech_app/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../utils/constants.dart';
import '../viewmodel/book_list_view_model.dart';
import '../widgets/all_listview.dart';
import '../widgets/custom_error_widget.dart';
import '../widgets/favourites_listview.dart';
import 'components/components.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    if (context.viewModel.status == Status.notFound) {
      return CustomErrorWidget(
        onRefresh: () async {
          await Provider.of<BookListViewModel>(context, listen: false)
              .getData(context);
        },
        title: AlertEnum.danger.titleText,
      );
    } else if (context.viewModel.status == Status.loading) {
      return const CircularProgressIndicator();
    } else if (context.viewModel.status == Status.success) {
      return SafeArea(
        child: Scaffold(
          body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) => [
              buildSliverAppBar(context,"Home"),
            ],
            body: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: context.paddingSmallWidth),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  context.sizedBoxHeightExtraSmall,
                  Expanded(
                    flex: 4,
                    child: FavouritesListView(
                      onTap: () {
                        Get.toNamed(
                          "/favourites",
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
                    child: BookListView(
                        bookViewModel: context.viewModel.bookViewModel),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    } else {
      return CustomErrorWidget(
        onRefresh: () async {
          await Provider.of<BookListViewModel>(context, listen: false)
              .getData(context);
        },
        title: AlertEnum.warning.titleText,
      );
    }
  }
}

