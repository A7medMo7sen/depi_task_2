import 'package:flutter/material.dart';
import 'data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isClicked = false;
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actionsPadding: EdgeInsets.only(right: 20),

        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: CircleAvatar(
            radius: 100,
            backgroundImage: AssetImage('assets/images/avatar.jpg'),
          ),
        ),
        title: const Text(
          'Traveler Explorer',
          style: TextStyle(
            color: Color.fromRGBO(0, 96, 150, 1),
            fontSize: 25,
            fontWeight: FontWeight(700),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_none_outlined, size: 30),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'All Destinations',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight(700),
                  color: Colors.black,
                ),
              ),
              Text(
                'Explore top locations worldwide.',
                style: TextStyle(fontSize: 15),
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: data.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 260,
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {
                    final elements = data[index];
                    return Card(
                      color: Colors.white,
                      elevation: 5,
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Image.asset(
                                elements['image'] as String,
                                height: 130,
                                fit: BoxFit.fitHeight,
                              ),
                              if (elements['status'] != null)
                                Positioned(
                                  bottom: 10,
                                  left: 10,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 3,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),

                                      color: elements['status'] == 'Featured'
                                          ? Color.fromRGBO(0, 110, 28, 1)
                                          : elements['status'] == 'Popular'
                                          ? Color.fromRGBO(0, 96, 150, 1)
                                          : null,
                                    ),
                                    child: Text(
                                      elements['status'] as String,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight(700),
                                      ),
                                    ),
                                  ),
                                ),
                              Positioned(
                                right: 10,
                                top: 10,
                                child: Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color.fromRGBO(255, 255, 255, 0.8),
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isClicked = !isClicked;
                                      });
                                    },
                                    child: isClicked
                                        ? Icon(
                                            Icons.favorite,
                                            color: Colors.red,
                                          )
                                        : Icon(Icons.favorite_border),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 15,
                              right: 15,
                              top: 15,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      elements['name'] as String,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight(700),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: Color.fromRGBO(245, 243, 243, 1),
                                      ),
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.star_outlined,
                                              color: Colors.orangeAccent,
                                            ),
                                            Text(
                                              (elements['rate'] as double)
                                                  .toString(),
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight(700),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  elements['country'] as String,
                                  style: TextStyle(fontSize: 15),
                                ),
                                Divider(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'From',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    Text(
                                      '\$${(elements['price'] as int).toString()}',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight(600),
                                        color: Color.fromRGBO(0, 96, 150, 1),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          /* child: SingleChildScrollView(
            child: Row(
              children: [
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: (data.length / 2).ceil(),
                    itemBuilder: (context, index) {
                      final myIndex = index * 2;
                      final elements = data[myIndex];
                      return Card(
                        elevation: 5,
                        clipBehavior: Clip.antiAlias,
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Image.asset(elements['image'] as String),
                                if (elements['status'] != null)
                                  Positioned(
                                    bottom: 10,
                                    left: 10,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 5,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),

                                        color: elements['status'] == 'Featured'
                                            ? Color.fromRGBO(0, 110, 28, 1)
                                            : elements['status'] == 'Popular'
                                            ? Color.fromRGBO(0, 96, 150, 1)
                                            : null,
                                      ),
                                      child: Text(
                                        elements['status'] as String,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight(700),
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 30,
                                right: 30,
                                bottom: 15,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        elements['name'] as String,
                                        style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight(700),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                          color: Color.fromRGBO(
                                            245,
                                            243,
                                            243,
                                            1,
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Colors.orangeAccent,
                                            ),
                                            Text(
                                              (elements['rate'] as double)
                                                  .toString(),
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight(700),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    elements['country'] as String,
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Divider(),
                                  SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'From',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      Text(
                                        '\$${(elements['price'] as double).toString()}',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight(600),
                                          color: Color.fromRGBO(0, 96, 150, 1),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              */
          /*  Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: (data.length / 2).ceil(),
                    itemBuilder: (context, index) {
                      final myIndex = 1 + (index * 2);

                      final elements = data[myIndex];
                      return Card(
                        elevation: 5,
                        clipBehavior: Clip.antiAlias,
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Image.asset(elements['image'] as String),
                                if (elements['status'] != null)
                                  Positioned(
                                    bottom: 10,
                                    left: 10,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 5,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),

                                        color: elements['status'] == 'Featured'
                                            ? Color.fromRGBO(0, 110, 28, 1)
                                            : elements['status'] == 'Popular'
                                            ? Color.fromRGBO(0, 96, 150, 1)
                                            : null,
                                      ),
                                      child: Text(
                                        elements['status'] as String,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight(700),
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 30,
                                right: 30,
                                bottom: 15,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        elements['name'] as String,
                                        style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight(700),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                          color: Color.fromRGBO(
                                            245,
                                            243,
                                            243,
                                            1,
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Colors.orangeAccent,
                                            ),
                                            Text(
                                              (elements['rate'] as double)
                                                  .toString(),
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight(700),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    elements['country'] as String,
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Divider(),
                                  SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'From',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      Text(
                                        '\$${(elements['price'] as double).toString()}',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight(600),
                                          color: Color.fromRGBO(0, 96, 150, 1),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),*/
          /*
              ],
            ),
          ),*/
        ),
      ),
      bottomNavigationBar: Container(
        height: 70,
        decoration: BoxDecoration(color: Color.fromRGBO(239, 237, 237, 1)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = 0;
                });
              },
              child: customBar(
                icon: Icons.home,
                title: 'Home',
                index: 0,
                selectedIndex: selectedIndex,
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = 1;
                });
              },
              child: customBar(
                icon: Icons.explore_rounded,
                title: 'Discover',
                index: 1,
                selectedIndex: selectedIndex,
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = 2;
                });
              },
              child: customBar(
                icon: Icons.grid_view_outlined,
                title: 'Categories',
                index: 2,
                selectedIndex: selectedIndex,
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = 3;
                });
              },
              child: customBar(
                title: 'My Trips',
                icon: Icons.card_travel_rounded,
                index: 3,
                selectedIndex: selectedIndex,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget customBar({
  required String title,
  required IconData icon,
  required int index,
  required int selectedIndex,
}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    decoration: BoxDecoration(
      color: selectedIndex == index ? Color.fromRGBO(145, 247, 142, 1) : null,
      borderRadius: BorderRadius.circular(40),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Icon(icon), Text(title)],
    ),
  );
}
