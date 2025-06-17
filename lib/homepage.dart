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

class _HomepagePageState extends State<HomepagePage> with TickerProviderStateMixin {
  List<String> brands = [
    "assets/iconimages/BMW.png",
    "assets/iconimages/Ferrari.png",
    "assets/iconimages/Jaguar.png",
    "assets/iconimages/Mercedes Benz.png",
    "assets/iconimages/Porsche.png",
    "assets/iconimages/Rolls Royce.png",
    "assets/iconimages/Audi.png",
    "assets/iconimages/Volkswagen.png"
  ];

  List<String> carslider = [
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
    "Rolls Royce",
    "Audi",
    "Volkswagen",
  ];

  final List<Map<String, String>> premiumCars = [
    {"image": "assets/images/audisw.jpg", "name": "Audi", "price": "₹5,999/day", "rating": "4.8"},
    {"image": "assets/images/benzsw.jpg", "name": "Mercedes S-Class", "price": "₹6,499/day", "rating": "4.9"},
    {"image": "assets/images/bmwsw.jpg", "name": "BMW", "price": "₹6,499/day", "rating": "4.9"},
  ];

  final List<Map<String, String>> normalCars = [
    {"image": "assets/images/swiftsw.jpg", "name": "Swift", "price": "₹1,499/day", "rating": "4.6"},
    {"image": "assets/images/polosw.jpg", "name": "Volkswagen Polo", "price": "₹1,599/day", "rating": "4.4"},
    {"image": "assets/images/fortunersw.jpg", "name": "fortuner", "price": "₹2,599/day", "rating": "4.5"},
  ];

  final List<Map<String, String>> weddingCars = [
    {"image": "assets/images/audisw.jpg", "name": "Rolls Royce Ghost", "price": "₹15,000/day", "rating": "5.0"},
    {"image": "assets/images/contessasw.jpg", "name": "contessa", "price": "₹7,999/day", "rating": "4.7"},
  ];

  final List<Map<String, String>> monthlySubscriptionCars = [
    {"image": "assets/images/swiftsw.jpg", "name": "Hyundai Creta", "price": "₹24,999/month", "rating": "4.5"},
    {"image": "assets/images/polosw.jpg", "name": "Tata Nexon", "price": "₹22,499/month", "rating": "4.3"},
  ];

  int activeIndex = 0;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Widget buildCarSection(String title, List<Map<String, String>> cars, IconData icon) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(width * 0.02),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue.shade400, Colors.purple.shade400],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(width * 0.02),
              ),
              child: Icon(icon, color: Colors.white, size: width * 0.05),
            ),
            SizedBox(width: width * 0.03),
            TextSW(
              text: title,
              fontSize: width * 0.045,
              fontWeight: FontWeight.w700,
            ),
            const Spacer(),
            TextButton(
              onPressed: () {},
              child: Text(
                "View All",
                style: TextStyle(
                  color: Colors.blue.shade300,
                  fontSize: width * 0.035,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: height * 0.015),
        SizedBox(
          height: height * 0.32,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: cars.length,
            separatorBuilder: (context, index) => SizedBox(width: width * 0.04),
            itemBuilder: (context, index) {
              final car = cars[index];
              return GestureDetector(
                onTap: () {
                  // Add navigation or car details functionality
                },
                child: Container(
                  width: width * 0.65,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.white.withOpacity(0.15),
                        Colors.white.withOpacity(0.05),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(width * 0.05),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.2),
                      width: 1,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                          margin: EdgeInsets.all(width * 0.03),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(width * 0.04),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 8,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(width * 0.04),
                            child: Stack(
                              children: [
                                Image.asset(
                                  car["image"]!,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: double.infinity,
                                ),
                                Positioned(
                                  top: width * 0.02,
                                  right: width * 0.02,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: width * 0.02,
                                      vertical: width * 0.01,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.7),
                                      borderRadius: BorderRadius.circular(width * 0.03),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                          size: width * 0.03,
                                        ),
                                        SizedBox(width: width * 0.01),
                                        Text(
                                          car["rating"] ?? "4.5",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: width * 0.03,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.all(width * 0.03),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextSW(
                                text: car["name"]!,
                                fontSize: width * 0.038,
                                fontWeight: FontWeight.w600,
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: width * 0.03,
                                        vertical: width * 0.01,
                                      ),
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [Colors.green.shade400, Colors.teal.shade400],
                                        ),
                                        borderRadius: BorderRadius.circular(width * 0.02),
                                      ),
                                      child: Text(
                                        car["price"]!,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: width * 0.035,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(width * 0.02),
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.2),
                                        borderRadius: BorderRadius.circular(width * 0.02),
                                      ),
                                      child: Icon(
                                        Icons.favorite_border,
                                        color: Colors.white,
                                        size: width * 0.035,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: height * 0.03),
      ],
    );
  }

  Widget buildSearchBar() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: height * 0.02),
      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(width * 0.08),
        border: Border.all(color: Colors.white.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Icon(Icons.search, color: Colors.white70, size: width * 0.06),
          SizedBox(width: width * 0.03),
          Expanded(
            child: TextField(
              style: TextStyle(color: Colors.white, fontSize: width * 0.04),
              decoration: InputDecoration(
                hintText: "Search for cars...",
                hintStyle: TextStyle(color: Colors.white60, fontSize: width * 0.04),
                border: InputBorder.none,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(width * 0.02),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(width * 0.02),
            ),
            child: Icon(Icons.tune, color: Colors.white, size: width * 0.05),
          ),
        ],
      ),
    );
  }

  Widget buildQuickActions() {
    final quickActions = [
      {"icon": Icons.schedule, "label": "Quick Rent", "color": Colors.orange},
      {"icon": Icons.local_offer, "label": "Offers", "color": Colors.red},
      {"icon": Icons.star, "label": "Premium", "color": Colors.purple},
      {"icon": Icons.support_agent, "label": "Support", "color": Colors.blue},
    ];

    return Container(
      margin: EdgeInsets.symmetric(vertical: height * 0.02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: quickActions.map((action) {
          return GestureDetector(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(width * 0.04),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    (action["color"] as Color).withOpacity(0.2),
                    (action["color"] as Color).withOpacity(0.1),
                  ],
                ),
                borderRadius: BorderRadius.circular(width * 0.04),
                border: Border.all(color: Colors.white.withOpacity(0.2)),
              ),
              child: Column(
                children: [
                  Icon(
                    action["icon"] as IconData,
                    color: action["color"] as Color,
                    size: width * 0.06,
                  ),
                  SizedBox(height: height * 0.005),
                  Text(
                    action["label"] as String,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: width * 0.03,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      drawer:Drawer(
        backgroundColor: Colors.black87,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(width * 0.04),
            bottomRight: Radius.circular(width * 0.04),
          ),
        ),
        child: ListView(
          children: [
            // Drawer Header
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.deepPurple, Colors.deepPurpleAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: width * 0.1,
                    backgroundImage: NetworkImage(
                      "https://img.freepik.com/free-vector/hand-drawn-side-profile-cartoon-illustration_23-2150517171.jpg",
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  Text(
                    "Musi",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: width * 0.05,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Luxury on Wheels",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: width * 0.03,
                    ),
                  ),
                ],
              ),
            ),

            // Drawer Items
            ListTile(
              leading: Icon(Icons.person, color: Colors.white),
              title: Text(
                "My Profile",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
              ),
              trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.white54),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.directions_car, color: Colors.white),
              title: Text(
                "My Bookings",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
              ),
              trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.white54),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.favorite_border, color: Colors.white),
              title: Text(
                "Wishlist",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
              ),
              trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.white54),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.history, color: Colors.white),
              title: Text(
                "Rental History",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
              ),
              trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.white54),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.settings, color: Colors.white),
              title: Text(
                "Settings",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
              ),
              trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.white54),
              onTap: () {},
            ),

            Divider(color: Colors.white30, height: height * 0.04),

            ListTile(
              leading: Icon(Icons.info_outline, color: Colors.white),
              title: Text(
                "About Us",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
              ),
              trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.white54),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.help_outline, color: Colors.white),
              title: Text(
                "Help & Support",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
              ),
              trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.white54),
              onTap: () {},
            ),

            // Logout
            ListTile(
              leading: Icon(Icons.logout, color: Colors.redAccent),
              title: Text(
                "Logout",
                style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold),
              ),
              trailing: Icon(Icons.exit_to_app, color: Colors.redAccent),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: Colors.grey[900],
                      title: Column(
                        children: [
                          Icon(CupertinoIcons.question_diamond_fill, color: Colors.amber),
                          SizedBox(height: 10),
                          Text(
                            "Are you sure you want to Logout?",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.redAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(width * 0.02),
                              ),
                            ),
                            onPressed: () {
                              // Add logout logic
                            },
                            child: Text("Yes"),
                          ),
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: Colors.white),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(width * 0.02),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("No", style: TextStyle(color: Colors.white)),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) => GestureDetector(
            onTap: () => Scaffold.of(context).openDrawer(),
            child: Container(
              margin: EdgeInsets.all(width * 0.02),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15),
                borderRadius: BorderRadius.circular(width * 0.02),
              ),
              child: const Icon(Icons.menu, color: Colors.white),
            ),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextSW(
              text: "SWheels Rent",
              fontSize: width * 0.05,
              fontWeight: FontWeight.bold,
            ),
            Text(
              "Premium Car Rental",
              style: TextStyle(
                color: Colors.white70,
                fontSize: width * 0.03,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: width * 0.03),
            padding: EdgeInsets.all(width * 0.02),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.circular(width * 0.02),
            ),
            child: Stack(
              children: [
                const Icon(Icons.notifications_none, color: Colors.white),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    width: width * 0.02,
                    height: width * 0.02,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      body: FadeTransition(
        opacity: _fadeAnimation,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildSearchBar(),
                buildQuickActions(),
                SizedBox(height: height * 0.02),
                CarouselSlider.builder(
                  itemCount: carslider.length,
                  itemBuilder: (context, index, realIndex) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: width * 0.01),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(width * 0.04),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 15,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(width * 0.04),
                        child: Stack(
                          children: [
                            Image.asset(
                              carslider[index],
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.transparent,
                                    Colors.black.withOpacity(0.6),
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: width * 0.05,
                              left: width * 0.05,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Luxury Awaits",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: width * 0.05,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "Experience premium comfort",
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: width * 0.035,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  options: CarouselOptions(
                    height: height * 0.25,
                    autoPlay: true,
                    viewportFraction: 1,
                    enlargeCenterPage: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        activeIndex = index;
                      });
                    },
                  ),
                ),
                SizedBox(height: height * 0.02),
                Center(
                  child: AnimatedSmoothIndicator(
                    activeIndex: activeIndex,
                    count: carslider.length,
                    effect: WormEffect(
                      activeDotColor: Colors.white,
                      dotColor: Colors.white.withOpacity(0.4),
                      dotHeight: 10,
                      dotWidth: 10,
                      spacing: 16,
                    ),
                  ),
                ),
                SizedBox(height: height * 0.03),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(width * 0.02),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.amber.shade400, Colors.orange.shade400],
                        ),
                        borderRadius: BorderRadius.circular(width * 0.02),
                      ),
                      child: Icon(Icons.auto_awesome, color: Colors.white, size: width * 0.05),
                    ),
                    SizedBox(width: width * 0.03),
                    TextSW(
                      text: "Popular Brands",
                      fontSize: width * 0.045,
                      fontWeight: FontWeight.w700,
                    ),
                  ],
                ),
                SizedBox(height: height * 0.015),
                SizedBox(
                  height: height * 0.14,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: brands.length,
                    separatorBuilder: (context, index) => SizedBox(width: width * 0.04),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {},
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(width * 0.02),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 10,
                                    offset: const Offset(0, 5),
                                  ),
                                ],
                              ),
                              child: CircleAvatar(
                                radius: width * 0.07,
                                backgroundImage: AssetImage(brands[index]),
                                backgroundColor: Colors.transparent,
                              ),
                            ),
                            SizedBox(height: height * 0.01),
                            TextSW(
                              text: brandNames[index],
                              fontSize: width * 0.032,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: height * 0.03),
                buildCarSection("Premium Collection", premiumCars, Icons.diamond),
                buildCarSection("Everyday Rides", normalCars, Icons.directions_car),
                buildCarSection("Wedding Specials", weddingCars, Icons.celebration),
                buildCarSection("Monthly Plans", monthlySubscriptionCars, Icons.calendar_month),
                SizedBox(height: height * 0.02),
              ],
            ),
          ),
        ),
      ),
    );
  }
}