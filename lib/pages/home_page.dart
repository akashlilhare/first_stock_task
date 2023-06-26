


import 'package:flutter/material.dart';

import '../helper/data_helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> dataList = [];

  @override
  void initState() {
    loadData();
    super.initState();
  }

  loadData() async {
    dataList = await DataHelper().loadData();
  }

  @override
  Widget build(BuildContext context) {
    buildVerticalLine() {
      return Container(
        height: 100,
        width: 1,
        color: Colors.black,
      );
    }

    buildWhiteVerticalLine() {
      return Container(
        height: 50,
        width: 1,
        color: Colors.white,
      );
    }

    buildHorizontalLine() {
      return Container(
        height: 1,
        width: double.infinity,
        color: Colors.black,
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Table View"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Container(
              color: Colors.black,
              child: Row(
                children: [
                  Expanded(
                      child: Center(
                        child: Text(
                          "ID",
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                  buildWhiteVerticalLine(),
                  Expanded(
                      child: Center(
                        child: Text(
                          "Type",
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                  buildWhiteVerticalLine(),
                  Expanded(
                      child: Center(
                        child: Text(
                          "Name",
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                  buildWhiteVerticalLine(),
                  Expanded(
                      child: Center(
                        child: Text(
                          "ppu",
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                  buildWhiteVerticalLine(),
                  Expanded(
                      flex: 2,
                      child: Center(
                        child: Text(
                          "Batter",
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                  buildWhiteVerticalLine(),
                  Expanded(
                      flex: 2,
                      child: Center(
                        child: Text(
                          "Topping",
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                ],
              ),
            ),
            ...dataList.map((data) {
              Map<String, dynamic> batters = data["batters"];
              List<dynamic> batterList = batters["batter"];
              return Column(
                children: [
                  ...batterList.map((batter) {
                    List<dynamic> toppings = data["topping"];
                    String topping = toppings.map((e) => e["type"]).toString();
                    return Column(
                      children: [
                        Row(
                          children: [
                            buildVerticalLine(),
                            Expanded(child: Center(child: Text(data["id"]))),
                            buildVerticalLine(),
                            Expanded(child: Center(child: Text(data["type"]))),
                            buildVerticalLine(),
                            Expanded(child: Center(child: Text(data["name"]))),
                            buildVerticalLine(),
                            Expanded(
                                child: Center(
                                    child: Text(data["ppu"].toString()))),
                            buildVerticalLine(),
                            Expanded(
                                flex: 2,
                                child: Center(child: Text(batter['type']))),
                            buildVerticalLine(),
                            Expanded(
                                flex: 2,
                                child: Center(
                                  child: Text(
                                      topping.substring(1, topping.length - 1)),
                                )),
                            buildVerticalLine(), // Expanded(
                          ],
                        ),
                        buildHorizontalLine()
                      ],
                    );
                  }).toList()
                ],
              );
            })
          ],
        ),
      ),
    );
  }
}
