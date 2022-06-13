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
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback(
          (timeStamp) {
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

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Loading", style: TextStyle(fontSize: 50)),
      ),
    );
  }
}
