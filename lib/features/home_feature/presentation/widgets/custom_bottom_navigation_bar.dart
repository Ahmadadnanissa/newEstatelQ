import 'package:estatelqapp/core/app_theme.dart';
import 'package:estatelqapp/features/home_feature/presentation/widgets/custom_icon_with_circle.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  bool homeState = true;
  bool favoriteState = false;
  bool personState = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.2),
      child: Container(
        height: width * 0.12,
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                favoriteState = true;
                homeState = false;
                personState = false;
                setState(() {});
              },
              child: CustomIconWithCircle(
                icon: Icon(Icons.favorite_border, size: width * 0.09),

                containerColor: favoriteState
                    ? Color(0xffFFDDD2)
                    : primaryColor,
              ),
            ),
            GestureDetector(
              onTap: () {
                favoriteState = false;
                homeState = true;
                personState = false;
                setState(() {});
              },
              child: CustomIconWithCircle(
                icon: Icon(Icons.home_outlined, size: width * 0.09),
                containerColor: homeState ? Color(0xffFFDDD2) : primaryColor,
              ),
            ),
            GestureDetector(
              onTap: () {
                favoriteState = false;
                homeState = false;
                personState = true;
                setState(() {});
              },
              child: CustomIconWithCircle(
                icon: Icon(Icons.person_outlined, size: width * 0.09),
                containerColor: personState ? Color(0xffFFDDD2) : primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
