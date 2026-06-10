import 'package:estatelqapp/features/home_favorite_feature/presentation/widgets/app_bar_for_favorite_page.dart';
import 'package:estatelqapp/features/home_favorite_feature/presentation/widgets/body_favorite_page.dart';
import 'package:flutter/material.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});
  static String id = 'FavoritePage';

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBarForFavoritePage(),
      // body: BodyFavoriteBage(),
    );
  }
}
