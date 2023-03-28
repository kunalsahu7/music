import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/srech_providerui.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  SearchScreenProvider? searchScreenProviderfalse;
  SearchScreenProvider? searchScreenProvidertrue;

  @override
  Widget build(BuildContext context) {
    searchScreenProviderfalse =
        Provider.of<SearchScreenProvider>(context, listen: false);
    searchScreenProvidertrue =
        Provider.of<SearchScreenProvider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Search",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30),
              Container(
                width: double.infinity,
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    Icon(
                      Icons.search,
                      color: Colors.black54,
                      size: 30,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "What do you want to listen to?",
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Text(
                "Browse all",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.3,
                    mainAxisExtent: 120,
                  ),
                  itemCount: searchScreenProviderfalse!.Language.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(5),
                      child: Container(
                        height: 150,
                        width: 200,
                        decoration: BoxDecoration(
                          color: searchScreenProviderfalse!.colors[index],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "${searchScreenProviderfalse!.Language[index]}",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}