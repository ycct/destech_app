
import 'package:destech_app/views/favourites_view.dart';
import 'package:destech_app/views/splash_view.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../views/detailed_view.dart';
import '../views/home_view.dart';

class AppRoutes {
  static final routes = [
    GetPage(
      name: '/splash',
      page: () => const SplashView(),
    ),
    GetPage(
      name: '/home',
      page: () => const HomeView(),
    ),
    GetPage(
      name: '/detailed',
      page: () => const DetailedView(bookModel: null,),
    ),
    GetPage(
      name: '/favourites',
      page: () => const FavouritesView(),
    )


  ];
}