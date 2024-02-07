import 'package:apitask/modelclass/allproductmodel.dart';
import 'package:apitask/modelclass/electronicsmodel.dart';
import 'package:apitask/services/allproductservices.dart';
import 'package:apitask/services/categoryservices.dart';
import 'package:apitask/services/electronicservices.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> slideImages = [
    Image.asset("images/jOOJOzR-1280.jpg"),
    Image.asset("images/960f24bf37a0f58ad49fd3f5d8f96415.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: [
            Container(
              height: 70,
              child: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset("images/Screenshot_2023-12-08_112356.png"),
                    Text(
                      'CartMart',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                  ],
                ),
              ),
              color: Colors.purple.shade200,
            ),
            Container(
              height: 210,
              decoration: BoxDecoration(
                color: Colors.purple.shade100,
              ),
              child: CarouselSlider(
                items: [
                  Image.asset(
                    "images/jOOJOzR-1280.jpg",
                    fit: BoxFit.fitHeight,
                  ),
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: AssetImage("images/download.jpeg")))),
                ],
                options: CarouselOptions(
                  height: 200.0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  viewportFraction: 0.8,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 70,
              width: double.infinity,
              child: FutureBuilder<List<dynamic>>(
                future: Services.getCategories(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<dynamic>> snapshot) {
                  if (snapshot.hasData) {
                    var categoryview = snapshot.data!;

                    return ListView.builder(
                        itemCount: categoryview.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.purple.shade200),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                      child: Text(categoryview[index],
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold))),
                                )),
                          );
                        });
                  }
                  return Shimmer(
                      gradient: LinearGradient(
                        begin: Alignment.bottomRight,
                        end: Alignment.centerLeft,
                        stops: const <double>[0, 0.3, 0.6, 0.9, 1],
                        colors: [
                          Colors.purple.shade100.withOpacity(0.1),
                          Colors.purple.withOpacity(0.3),
                          Colors.purple.withOpacity(0.5),
                          Colors.purple.withOpacity(0.7),
                          Colors.purple.withOpacity(0.9),
                        ],
                      ),
                      child: Shimmer.fromColors(
                        child: Container(
                          color: Colors.white,
                        ),
                        highlightColor: Colors.purple,
                        baseColor: Colors.purple,
                      ));
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            FutureBuilder(
                future: Allproductservices.getAllproducts(),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  print(snapshot.data);
                  if (snapshot.hasData) {
                    var allproductview = snapshot.data;

                    return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            print('data ${snapshot.data![index]}');
                            return Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black)),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.network(snapshot.data[index].image,
                                      cacheHeight: 100),
                                  Text(
                                    snapshot.data![index].title!,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            );
                          },
                        ));
                  }
                  return Shimmer(
                      gradient: LinearGradient(
                        begin: Alignment.bottomRight,
                        end: Alignment.centerLeft,
                        stops: const <double>[0, 0.3, 0.6, 0.9, 1],
                        colors: [
                          Colors.purple.shade100.withOpacity(0.1),
                          Colors.purple.withOpacity(0.3),
                          Colors.purple.withOpacity(0.5),
                          Colors.purple.withOpacity(0.7),
                          Colors.purple.withOpacity(0.9),
                        ],
                      ),
                      child: Shimmer.fromColors(
                        child: Container(
                          color: Colors.white,
                        ),
                        highlightColor: Colors.purple,
                        baseColor: Colors.purple,
                      ));
                }),
          ],
        ),
      ),
    );
  }
}
