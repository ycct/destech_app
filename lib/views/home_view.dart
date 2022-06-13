import 'package:destech_app/utils/alert_enum.dart';
import 'package:destech_app/utils/extensions.dart';
import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../utils/methods.dart';
import '../viewmodel/book_list_view_model.dart';
import '../widgets/all_listview.dart';
import '../widgets/custom_error_widget.dart';
import '../widgets/favourites_listview.dart';
import 'components/components.dart';
import 'favourites_view.dart';

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
        title: AlertEnum.danger.titleText,
      );
    } else if (context.viewModel.status == Status.loading) {
      return const CircularProgressIndicator();
    } else if (context.viewModel.status == Status.success) {
      return Scaffold(
        appBar: buildAppBar(context, "Home"),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.paddingSmallWidth),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              context.sizedBoxHeightExtraSmall,
              Expanded(
                flex: 4,
                child: FavouritesListView(
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
                child: BookListView(
                    bookViewModel: context.viewModel.bookViewModel),
              ),
            ],
          ),
        ),
      );
    } else {
      return CustomErrorWidget(
        title: AlertEnum.warning.titleText,
      );
    }
  }
}
