import 'package:flutter/material.dart';
import '../model/book_model.dart';
import '../services/service.dart';
import 'book_view_model.dart';

enum Status { initial, loading, notFound, success }

class BookListViewModel extends ChangeNotifier {
  List<BookModel>? books = [];

  bool isDark = true;

  BookViewModel favouriteBooks = BookViewModel(bookModel: []);
  BookViewModel bookViewModel = BookViewModel(bookModel: []);

  Status status = Status.initial;

  Future<void> getData() async {
    status = Status.loading;
    books = await WebService().fetchData(5);
    bookViewModel = BookViewModel(bookModel: books);
    status = books!.isEmpty ? Status.success : Status.notFound;
    notifyListeners();
  }

  void addBookToFavouriteList(BookModel bookModel) {
    if (favouriteBooks.bookModel!.contains(bookModel)) {
      favouriteBooks.bookModel!.remove(bookModel);
    } else {
      favouriteBooks.bookModel!.add(bookModel);
    }
    notifyListeners();
  }

  bool isFavourite(BookModel bookModel) {
    if (favouriteBooks.bookModel!.contains(bookModel)) {
      return true;
    } else {
      return false;
    }
  }

  void updateItems(int oldIndex, int newIndex, List<BookModel?> items) {
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }
    final item = items.removeAt(oldIndex);
    items.insert(newIndex, item);
    notifyListeners();
  }
  void changeTheme(){
    isDark =! isDark;
    notifyListeners();
  }


}
