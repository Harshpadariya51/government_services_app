import 'package:flutter/material.dart';
import 'package:government_services_app/modules/provider/gov_ser_provider.dart';
import 'package:provider/provider.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({super.key});

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  @override
  Widget build(BuildContext context) {
    Provider.of<GovSerProvider>(context).getData();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Government Services",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            childAspectRatio: 5 / 5,
            mainAxisSpacing: 8,
          ),
          children: Provider.of<GovSerProvider>(context).govSerlist.map(
            (e) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('DetailPage', arguments: e);
                },
                child: Card(
                  shadowColor: Colors.brown,
                  elevation: 7,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset(e.img),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            e.name,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ).toList()),
    );
  }
}
