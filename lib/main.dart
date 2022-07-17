import 'package:course_app_demo/details_screen.dart';
import 'package:course_app_demo/model/category.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:course_app_demo/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Couse App',
      theme: ThemeData(),
      home:  const DetailsScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.only(left: 20, top: 50, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SvgPicture.asset("assets/icons/menu.svg"),
                  Image.asset("assets/images/user.png"),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Hey Alex,',
                style: kHeadingextStyle,
              ),
              const Text(
                'Find a course you want to learn',
                style: kSubheadingextStyle,
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                height: 55,
                width: double.infinity,
                decoration: BoxDecoration(color: const Color.fromARGB(255, 227, 226, 226), borderRadius: BorderRadius.circular(40)),
                child: Row(
                  children: <Widget>[
                    SvgPicture.asset("assets/icons/search.svg"),
                    const SizedBox(
                      width: 16,
                    ),
                    const Text(
                      'Search for anything',
                      style: TextStyle(fontSize: 18, color: Color(0xffa0a5bd)),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text("Category", style: kTitleTextStyle),
                  Text("See all",
                      style: kSubtitleTextSyule.copyWith(
                        color: kBlueColor,
                      ))
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: StaggeredGrid.count(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                children: const [
                  CategoriesCards(categoryID: 0),
                  CategoriesCards(categoryID: 1),
                  CategoriesCards(categoryID: 2),
                  CategoriesCards(categoryID: 3),
                ],
              )),
            ],
          )),
    );
  }
}

class CategoriesCards extends StatelessWidget {
  const CategoriesCards({
    Key? key,
    required this.categoryID,
  }) : super(key: key);
  final int categoryID;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: 200,
      decoration: BoxDecoration(
        color: kBlueColor,
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(image: AssetImage(categories[categoryID].image), fit: BoxFit.fill),
      ),child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(categories[categoryID].name,style: kTitleTextStyle,),
          Text('${categories[categoryID].numOfCourses}  Courses',style: TextStyle(color: kTextColor.withOpacity(.5))),
        ],
        
      ),
      
    );
  }
}

//5. dakikada kaldım