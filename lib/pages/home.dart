import 'dart:async';
import 'dart:html' as html;

import 'package:demo_1/product/product.dart';
import 'package:flutter/material.dart';

import '../payment/payment.dart';
import '../payment/payment_web.dart';
import 'admin.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> images = [
    'https://cdn.shopify.com/s/files/1/0538/6915/0380/products/CSF-7057-1_1600x.jpg?v=1613732724',
    'https://www.fabspeed.com/product_images/uploaded_images/untitled-10.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    Server server = Server();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Row(
          children: [
            // Drawer - - - - - - //
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              width: (size.width > 1000) ? 280 : 210,
              color: Colors.white,
              child: Column(
                children: [
                  const SizedBox(height: 25),
                  InkWell(
                    onTap: () {},
                    child: const Text(
                      "Piezas Universal",
                      style: TextStyle(
                        color: Colors.black45,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Divider(
                      color: Colors.black.withOpacity(0.05),
                    ),
                  ),
                  ListTile(
                    focusColor: Colors.black,
                    title: Text(
                      "Admin",
                      style: TextStyle(
                        color: Colors.black45,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    leading: Icon(
                      Icons.person_rounded,
                      color: Colors.black45,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (c, a1, a2) => Admin(),
                          transitionsBuilder: (c, anim, a2, child) =>
                              FadeTransition(opacity: anim, child: child),
                          transitionDuration: Duration(milliseconds: 500),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            // Divider - - - - - - //
            const RotatedBox(
              quarterTurns: 1,
              child: Divider(
                color: Colors.black12,
              ),
            ),
            SizedBox(width: 30),
            // Body - - - - - - - //
            Expanded(
              child: Container(
                height: size.height,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Scrollbar(
                  child: ListView(
                    children: [
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            flex: 2,
                            child: Container(
                              height: 50,
                              alignment: Alignment.center,
                              margin: EdgeInsets.symmetric(
                                  horizontal: (size.width > 1100)
                                      ? size.width / 8
                                      : size.width / 20),
                              decoration: BoxDecoration(
                                // color: Colors.black.withOpacity(0.02),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Text(
                                "Search",
                                style: TextStyle(
                                  color: Colors.black26,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          AnimatedSwitcher(
                            duration: Duration(milliseconds: 500),
                            child: (size.width > 750)
                                ? Container(
                                    width: 210,
                                    // color: Colors.amber,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        InkWell(
                                          onTap: () {},
                                          child: Container(
                                            height: 45,
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 10,
                                            ),
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: Colors.black
                                                  .withOpacity(0.02),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Text(
                                              "Sing Up",
                                              style: TextStyle(
                                                color: Colors.lightBlue
                                                    .withOpacity(0.7),
                                                fontSize: 21,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {},
                                          child: Container(
                                            height: 45,
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 10,
                                            ),
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: Colors.black
                                                  .withOpacity(0.02),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Text(
                                              "Sing In",
                                              style: TextStyle(
                                                color: Colors.black45,
                                                fontSize: 21,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : SizedBox(),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Container(
                        height: size.height / 3.1,
                        child: Container(
                          height: size.height,
                          width: size.width,
                          clipBehavior: Clip.antiAlias,
                          margin: EdgeInsets.symmetric(
                            horizontal: (size.width > 1600) ? 20 : 10,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.blueGrey,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 10.0,
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 0.0,
                                offset: Offset(0.0, 0.0),
                              ),
                            ],
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                top: -200,
                                right: -50,
                                child: Transform.rotate(
                                  angle: 0.4,
                                  child: Container(
                                    height: size.height,
                                    width: size.width / 2.3,
                                    color: Colors.red.withOpacity(0.5),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 20,
                                left: 20,
                                child: Text(
                                  "Comprar",
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.9),
                                    fontSize: 60,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 20,
                                right: 20,
                                child: Text(
                                  "Vender",
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.9),
                                    fontSize: 60,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 20,
                                left: 20,
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 10,
                                    ),
                                    backgroundColor:
                                        Color.fromARGB(255, 65, 195, 255),
                                  ),
                                  onPressed: () {},
                                  child: const Text(
                                    "Comenzar!",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: const [
                          SizedBox(width: 15),
                          Text(
                            "Products",
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Container(
                        height: size.height / 1.5,
                        child: FutureBuilder(
                          future: server.getProducts(),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {
                              if (snapshot.data.length == 0) {
                                return Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(
                                        Icons.window_rounded,
                                        size: 40,
                                        color: Colors.black12,
                                      ),
                                      SizedBox(height: 20),
                                      Text(
                                        "No hay productos",
                                        style: TextStyle(
                                          color: Colors.black26,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              } else {
                                return GridView.count(
                                  crossAxisCount: (size.width > 1200) ? 4 : 2,
                                  children: [
                                    for (var product in snapshot.data)
                                      InkWell(
                                        onTap: () {},
                                        child: Container(
                                          clipBehavior: Clip.antiAlias,
                                          margin: const EdgeInsets.all(15),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 10.0,
                                                color: Colors.black
                                                    .withOpacity(0.1),
                                                spreadRadius: 0.0,
                                                offset: Offset(0.0, 0.0),
                                              ),
                                            ],
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  decoration: BoxDecoration(),
                                                  child: Image.network(
                                                    images[1],
                                                    key: UniqueKey(),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 10),
                                              Row(
                                                children: [
                                                  const SizedBox(width: 10),
                                                  Text(
                                                    product.name,
                                                    style: TextStyle(
                                                      color: Colors.black45,
                                                      fontSize: 23,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 10),
                                                  Text(
                                                    "\$${product.price}",
                                                    style: TextStyle(
                                                      color: Colors.black38,
                                                      fontSize: 21,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 10),
                                            ],
                                          ),
                                        ),
                                      ),
                                  ],
                                );
                              }
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          },
                        ),
                      ),
                      Container(
                        height: 600,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(width: 30),
          ],
        ),
      ),
    );
  }
}
