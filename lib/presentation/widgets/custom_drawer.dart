import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../app_theme.dart';
import '../views/homescreen/homescreen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SizedBox(
      width: screenSize.width * 0.7,
      child: Column(
        children: [
          Container(
            height: screenSize.height * 0.25,
            width: double.infinity,
            color: AppTheme.white,
            alignment: Alignment.center,
            child: Text(
              "News App",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Expanded(
            child: Container(
              height: screenSize.height * 0.25,
              width: double.infinity,
              color: AppTheme.black,
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushReplacementNamed(
                          context, Homescreen.routeName);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          "assets/icons/home_icon.svg",
                          color: AppTheme.white,
                        ),
                        Text(
                          "    Go To Home",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: AppTheme.white),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: AppTheme.white,
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        "assets/icons/theme_icon.svg",
                        color: AppTheme.white,
                      ),
                      Text(
                        "    Theme",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: AppTheme.white),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 16),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppTheme.white),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: DropdownButton(
                      padding: const EdgeInsets.all(5),
                      underline: SizedBox(),
                      borderRadius: BorderRadius.circular(16),
                      items: const [
                        DropdownMenuItem(
                          value: "Light",
                          child: Text(
                            "Light",
                            style: TextStyle(color: AppTheme.white),
                          ),
                        ),
                        DropdownMenuItem(
                          value: "Dark",
                          child: Text(
                            "Dark",
                            style: TextStyle(color: AppTheme.white),
                          ),
                        ),
                      ],
                      onChanged: (value) {},
                      value: "Light",
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: AppTheme.white,
                      ),
                      iconSize: 30,
                      style: TextStyle(color: AppTheme.black),
                      dropdownColor: AppTheme.gray,
                    ),
                  ),
                  Divider(
                    color: AppTheme.white,
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        "assets/icons/language_icon.svg",
                        color: AppTheme.white,
                      ),
                      Text(
                        "    Language",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: AppTheme.white),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 16),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppTheme.white),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: DropdownButton(
                      padding: const EdgeInsets.all(5),
                      underline: SizedBox(),
                      borderRadius: BorderRadius.circular(16),
                      items: const [
                        DropdownMenuItem(
                          value: "English",
                          child: Text(
                            "English",
                            style: TextStyle(color: AppTheme.white),
                          ),
                        ),
                        DropdownMenuItem(
                          value: "Arabic",
                          child: Text(
                            "Arabic",
                            style: TextStyle(color: AppTheme.white),
                          ),
                        ),
                      ],
                      onChanged: (value) {},
                      value: "English",
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: AppTheme.white,
                      ),
                      iconSize: 30,
                      style: TextStyle(color: AppTheme.black),
                      dropdownColor: AppTheme.gray,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
