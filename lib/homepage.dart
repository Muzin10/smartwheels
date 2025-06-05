import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartwheels/constants/colorconstants/colorconstants.dart';
import 'package:smartwheels/customwidgetss/textwidget.dart';
import 'package:smartwheels/main.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomepagePage extends StatefulWidget {
  const HomepagePage({super.key});

  @override
  State<HomepagePage> createState() => _HomepagePageState();
}

class _HomepagePageState extends State<HomepagePage> {
  List<String> brands = [
    "assets/iconimages/BMW.png",
    "assets/iconimages/Ferrari.png",
    "assets/iconimages/Jaguar.png",
    "assets/iconimages/Mercedes Benz.png",
    "assets/iconimages/Porsche.png",
    "assets/iconimages/Rolls Royce.png",
    "assets/iconimages/Audi.png"
    "assets/iconimages/Volkswagen.png"
  ];

  List<String> carslider=[
    "assets/images/bensiconn.jpg",
    "assets/images/caroselcar.jpg",
    "assets/images/stairing.jpg"
  ];

  List<String> brandNames = [
    "BMW",
    "Ferrari",
    "Jaguar",
    "Benz",
    "Porsche",
    "Rolls royce",
    "Audi",
    "Volkswagen",
  ];

  final List<Map<String, String>> carCollection = [
    {
      "image": "assets/carcollections/audi.png",
      "name": "Audi A6",
      "price": "₹65 Lakhs"
    },
    {
      "image": "assets/carcollections/bennnz.png",
      "name": "Mercedes C-Class",
      "price": "₹60 Lakhs"
    },
    {
      "image": "assets/carcollections/bjhmw.png",
      "name": "BMW 5 Series",
      "price": "₹75 Lakhs"
    },
  ];

  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, // uses shared background
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(Icons.menu, color: Colors.white),
        title: TextSW(
          text: "Smart Wheels",
          fontSize: width * 0.05,
          fontWeight: FontWeight.bold,
        ),
        actions: const [
          Icon(Icons.favorite_border, color: Colors.white),
          SizedBox(width: 12),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔍 Search Bar
              Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(width * 0.03),
                ),
                child: TextFormField(
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(CupertinoIcons.search, color: Colors.white),
                    hintText: "Search cars, brands...",
                    hintStyle: TextStyle(color: Colors.white60),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: height * 0.03),

              // 🖼 Carousel
              CarouselSlider.builder(
                itemCount: 3,
                itemBuilder: (context, index, realIndex) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: width * 0.01),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(width * 0.03),
                      image:  DecorationImage(
                        image: AssetImage(carslider[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
                options: CarouselOptions(
                  height: height * 0.24,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    setState(() {
                      activeIndex = index;
                    });
                  },
                ),
              ),
              const SizedBox(height: 10),

              Center(
                child: AnimatedSmoothIndicator(
                  activeIndex: activeIndex,
                  count: 3,
                  effect: const WormEffect(
                    activeDotColor: Colors.white,
                    dotColor: Colors.white60,
                    dotHeight: 8,
                    dotWidth: 8,
                  ),
                ),
              ),
              SizedBox(height: height * 0.03),

              // 🔥 Popular Brands
              TextSW(
                text: "Popular Brands",
                fontSize: width * 0.045,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: height * 0.015),

              SizedBox(
                height: height * 0.12,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: brands.length,
                  separatorBuilder: (context, index) =>
                      SizedBox(width: width * 0.04),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        CircleAvatar(
                          radius: width * 0.08,
                          backgroundImage: AssetImage(brands[index]),
                          backgroundColor: Colors.white,
                        ),
                        SizedBox(height: height * 0.008),
                        Text(
                          brandNames[index],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: width * 0.035,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(height: height * 0.03),

              // 🚗 Car Collection
              TextSW(
                text: "Car Collection",
                fontSize: width * 0.045,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: height * 0.015),

              SizedBox(
                height: height * 0.25,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: carCollection.length,
                  separatorBuilder: (context, index) =>
                      SizedBox(width: width * 0.04),
                  itemBuilder: (context, index) {
                    final car = carCollection[index];
                    return Container(
                      width: width * 0.55,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(width * 0.04),
                      ),
                      padding: EdgeInsets.all(width * 0.03),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(width * 0.03),
                              child: Image.asset(
                               carslider[index],
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                            ),
                          ),
                          SizedBox(height: height * 0.01),
                          Text(
                            car["name"]!,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: width * 0.04,
                            ),
                          ),
                          Text(
                            car["price"]!,
                            style: TextStyle(
                              color: Colors.greenAccent,
                              fontSize: width * 0.035,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: height * 0.03),
            ],
          ),
        ),
      ),
    );
  }
}
