import 'package:destech_app/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodel/book_list_view_model.dart';
import 'home_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  var count = 0.0;

  @override
  void initState() {
    super.initState();

    animateProgressIndicator();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        animateProgressIndicator();
        Provider.of<BookListViewModel>(context, listen: false)
            .getData(context)
            .then(
              (value) => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeView(),
                ),
              ),
            );
      },
    );
  }

  animateProgressIndicator() {
    setState(() {
      count += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TweenAnimationBuilder(
        duration: const Duration(milliseconds: 1500),
        tween: Tween(begin: 0.0, end: 1.0),
        builder: (_, double value, __) {
          return Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 150,
                  width: 150,
                  child: CircularProgressIndicator(
                      strokeWidth: 3,
                      value: value,
                      color: context.primaryColor),
                ),
                context.sizedBoxHeightExtraSmall,
                Positioned(

                  child: Text(
                    "${(value * 100).round()}%",
                    style: context.headline4,
                  ),
                )

              ],
            ),
          );
        },
      ),
    );
  }
}
