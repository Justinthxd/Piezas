import 'package:flutter/material.dart';

import '../payment/payment.dart';

class Admin extends StatefulWidget {
  Admin({Key? key}) : super(key: key);

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  final List<TextEditingController> _controllers = [
    for (int i = 0; i < 7; i++) TextEditingController(),
  ];

  final List<String> fields = [
    'Description',
    'Quantity',
  ];

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    Server server = Server();
    return Scaffold(
      backgroundColor: const Color.fromRGBO(60, 60, 60, 1),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Row(
          children: [
            // Drawer - - - - - - //
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              width: (size.width > 1000) ? 280 : 210,
              color: const Color.fromRGBO(70, 70, 70, 1),
              child: Column(
                children: [
                  const SizedBox(height: 25),
                  InkWell(
                    onTap: () {},
                    child: const Text(
                      "Piezas Universal",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: Divider(
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    child: Row(
                      children: [
                        SizedBox(width: 13),
                        const Text(
                          "Product",
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 20,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            child: Divider(
                              color: Colors.black.withOpacity(0.1),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  ListTile(
                    focusColor: Colors.black,
                    leading: const Icon(
                      Icons.window_rounded,
                      color: Colors.white54,
                    ),
                    title: const Text(
                      "Products",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    onTap: () {
                      _pageController.animateToPage(
                        0,
                        duration: Duration(milliseconds: 1000),
                        curve: Curves.fastOutSlowIn,
                      );
                    },
                  ),
                  ListTile(
                    focusColor: Colors.black,
                    leading: const Icon(
                      Icons.add,
                      color: Colors.white54,
                    ),
                    title: const Text(
                      "Add Product",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    onTap: () {
                      _pageController.animateToPage(
                        1,
                        duration: Duration(milliseconds: 1000),
                        curve: Curves.fastOutSlowIn,
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
                color: Colors.black54,
              ),
            ),
            const SizedBox(width: 30),
            // Body - - - - - - - //
            Expanded(
              child: PageView(
                controller: _pageController,
                children: [
                  Column(
                    children: [
                      SizedBox(height: size.height * 0.02),
                      const Text(
                        'Products',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 30,
                        ),
                      ),
                      SizedBox(height: size.height * 0.02),
                      Expanded(
                        child: Container(
                          child: FutureBuilder(
                            future: server.getProducts(),
                            builder: (context, AsyncSnapshot snapshot) {
                              if (snapshot.hasData) {
                                if (snapshot.data.length == 0) {
                                  return Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Icon(
                                          Icons.window_rounded,
                                          size: 40,
                                          color: Colors.white10,
                                        ),
                                        SizedBox(height: 20),
                                        Text(
                                          "No hay productos",
                                          style: TextStyle(
                                            color: Colors.white24,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                } else {
                                  return ListView.builder(
                                    itemCount: snapshot.data.length,
                                    itemBuilder: (context, index) {
                                      final product = snapshot.data[index];
                                      return ListTile(
                                        title: Text(product.name),
                                        subtitle: Text(product.description),
                                        trailing: Text(product.price),
                                      );
                                    },
                                  );
                                }
                              } else {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: size.height,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(60, 60, 60, 1),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: size.height * 0.1),
                        const Text(
                          'Add Product',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 30,
                          ),
                        ),
                        SizedBox(height: size.height * 0.02),
                        Container(
                          width: 600,
                          height: 100,
                          margin: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  child: TextField(
                                    controller: _controllers[0],
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white12,
                                      hintText: "Name",
                                      hintStyle: const TextStyle(
                                        color: Colors.white38,
                                        fontSize: 20,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                          color: Colors.white,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                          color: Colors.white30,
                                        ),
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                          color: Colors.white10,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: Container(
                                  child: TextField(
                                    controller: _controllers[1],
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white12,
                                      hintText: "Price",
                                      hintStyle: const TextStyle(
                                        color: Colors.white38,
                                        fontSize: 20,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                          color: Colors.white,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                          color: Colors.white30,
                                        ),
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                          color: Colors.white10,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        for (int i = 2; i < 4; i++)
                          Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 15,
                            ),
                            width: 600,
                            child: TextField(
                              controller: _controllers[i],
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white12,
                                hintText: fields[i - 2],
                                hintStyle: const TextStyle(
                                  color: Colors.white38,
                                  fontSize: 20,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Colors.white30,
                                  ),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Colors.white10,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        SizedBox(height: size.height * 0.03),
                        ElevatedButton(
                          child: const Text(
                            "Add Product",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 17),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          onPressed: () {
                            server.addProduct(
                              _controllers[0].text.isEmpty
                                  ? "No Name"
                                  : _controllers[0].text,
                              _controllers[1].text.isEmpty
                                  ? '0'
                                  : _controllers[1].text,
                              _controllers[2].text.isEmpty
                                  ? '-'
                                  : _controllers[2].text,
                            );
                            for (int i = 0; i < 3; i++) {
                              _controllers[i].clear();
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 30),
          ],
        ),
      ),
    );
  }
}
