import 'package:destech_app/utils/extensions.dart';
import 'package:flutter/material.dart';
import '../model/book_model.dart';
import '../utils/constants.dart';
import '../viewmodel/book_list_view_model.dart';

class DetailedView extends StatelessWidget {
  final BookModel bookModel;

  const DetailedView({
    Key? key,
    required this.bookModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildImageIconContainerStack(context, context.viewModel),
            Text(
              bookModel.title!.toUpperCase(),
              style: context.headline5,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.paddingExtraLargeWidth,
                vertical: context.paddingUltraSmallHeight,
              ),
              child: const Divider(
                thickness: 2,
              ),
            ),
            buildTitles(context, bookModel.published!, context.headline5!),
            context.sizedBoxHeightExtraSmall,
            buildTitles(context, bookModel.publisher!, context.headline6!),
            buildTitles(context, bookModel.genre!, context.subtitle1!),
            context.sizedBoxHeightUltraSmall,
            buildTitles(context, bookModel.author!, context.headline6!),
            buildTitles(context, bookModel.isbn!, context.bodyText1!),
            context.sizedBoxHeightExtraSmall,
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.paddingExtraLargeWidth,
              ),
              child: Text(
                bookModel.description! * 5,
                textAlign: TextAlign.center,
              ),
            ),
            context.sizedBoxHeightDefault,
          ],
        ),
      ),
    );
  }

  Widget buildTitles(BuildContext context, String title, TextStyle style) =>
      Padding(
        padding: EdgeInsets.symmetric(
          vertical: context.paddingUltraSmallHeight,
        ),
        child: Text(title, style: style),
      );

  Stack buildImageIconContainerStack(
      BuildContext context, BookListViewModel viewModel) {
    return Stack(
      children: [
        buildBackgroundImage(context),
        buildFavouriteIcon(context, viewModel),
        buildStyledContainer(context, viewModel)
      ],
    );
  }

  Container buildBackgroundImage(BuildContext context) {
    return Container(
      width: double.infinity,
      height: context.dynamicHeight(0.5),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            bookModel.image!,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Positioned buildFavouriteIcon(
      BuildContext context, BookListViewModel viewModel) {
    return Positioned(
      top: context.paddingLargeHeight,
      right: context.paddingSmallWidth,
      child: IconButton(
        onPressed: () {
          viewModel.addBookToFavouriteList(bookModel);
          viewModel.isFavourite(bookModel);
        },
        icon: Icon(
          Icons.favorite,
          size: 45,
          color: viewModel.isFavourite(bookModel)
              ? context.primaryColor
              : context.disabledColor,
        ),
      ),
    );
  }

  Container buildStyledContainer(
      BuildContext context, BookListViewModel viewModel) {
    return Container(
      margin: EdgeInsets.only(
        top: context.dynamicHeight(0.45),
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: context.scaffoldBackgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(AppConstants.extraLargeRadius),
          topRight: Radius.circular(AppConstants.extraLargeRadius),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(context.paddingDefaultWidth),
            child: Container(
              width: context.dynamicWidth(0.35),
              height: 6,
              decoration: BoxDecoration(
                color: viewModel.isFavourite(bookModel)
                    ? context.primaryColor
                    : context.disabledColor,
                borderRadius: BorderRadius.circular(
                  AppConstants.defaultRadius,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
