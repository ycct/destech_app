import 'package:destech_app/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../model/book_model.dart';
import '../utils/constants.dart';
import '../viewmodel/book_list_view_model.dart';
import '../viewmodel/book_view_model.dart';
import '../views/detailed_view.dart';
import 'custom_card.dart';

class BookListView extends StatefulWidget {
  final BookViewModel bookViewModel;

  const BookListView({
    Key? key,
    required this.bookViewModel,
  }) : super(key: key);

  @override
  State<BookListView> createState() => _BookListViewState();
}

class _BookListViewState extends State<BookListView> {
  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<BookListViewModel>(context);
    return ReorderableListView.builder(
      itemCount: widget.bookViewModel.bookModel!.length,
      itemBuilder: (context, index) {
        return InkWell(
          key: ValueKey(widget.bookViewModel.bookModel![index].id),
          child: CustomCard(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: context.paddingUltraSmallHeight),
              child: Row(
                children: [
                  context.sizedBoxWidthSmall,
                  Expanded(
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      height: context.dynamicHeight(0.1),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            AppConstants.extraSmallRadius),
                      ),
                      child: Image.network(
                        widget.bookViewModel.bookModel![index].image!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  context.sizedBoxWidthSmall,
                  Expanded(
                    flex: 2,
                    child: buildTextColumns(
                        context, widget.bookViewModel.bookModel![index]),
                  ),
                ],
              ),
            ),
          ),
          onTap: () {
            Get.to(
              DetailedView(
                bookModel: widget.bookViewModel.bookModel![index],
              ),
            );
          },
        );
      },
      onReorder: (int oldIndex, int newIndex) {
        vm.updateItems(oldIndex, newIndex, widget.bookViewModel.bookModel!);
      },
    );
  }

  Padding buildTextColumns(BuildContext context, BookModel vmBook) {
    return Padding(
      padding: EdgeInsets.all(context.paddingExtraSmallHeight),
      child: Column(
        children: [
          buildRow(context, vmBook, "Title: ", vmBook.title!),
          buildRow(context, vmBook, "Author: ", vmBook.author!),
          buildRow(context, vmBook, "Genre: ", vmBook.genre!),
          buildRow(context, vmBook, "Published: ", vmBook.published!),
        ],
      ),
    );
  }

  Widget buildRow(BuildContext context, BookModel viewModelBook, String title,
      String content) {
    return Padding(
      padding: EdgeInsets.only(bottom: context.paddingUltraSmallHeight),
      child: Row(
        children: [
          Text(
            title,
            style: context.subtitle2!.copyWith(fontWeight: FontWeight.bold),
          ),
          Flexible(
            child: Text(
              content,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
