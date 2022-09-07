import 'package:api_sample/specific.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:api_sample/countries.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:ffi';
// import 'dart:html';
import 'package:api_sample/countries.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
// import 'package:api_sample/list_item.dart';
import 'countries.dart';
import 'specific.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: MyHomePage(
        title: 'Corona Tracker',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Countries> _CountryList = [];
  List<Countries> _foundusers = [];

  var myMenuItems = <String>['Alpha- Asce', 'Cases -Asce', 'Cases-Desce'];

  void onSelect(item) {
    switch (item) {
      case 'Alpha- Asce':
        setState(() {
          sortAlpha();
        });

        break;
      case 'Cases -Asce':
        setState(() {
          sortNum();
        });
        break;
      case 'Cases-Desce':
        setState(() {
          sortNumDes();
        });
        break;
    }
  }

  void getData() async {
    http.Response response = await http.get(
        "https://corona-virus-world-and-india-data.p.rapidapi.com/api",
        headers: {
          'x-rapidapi-host': 'corona-virus-world-and-india-data.p.rapidapi.com',
          'x-rapidapi-key':
              '6b43206931mshf9b4796cc4700afp139455jsned3f9fd23fa0',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        });
    // print(response.body);

    setState(() {
      _CountryList = Corona.fromJson(json.decode(response.body)).countries_stat;
      print(_CountryList[0].country_name);
      _foundusers = _CountryList;
      print(_foundusers[0].country_name);
    });
  }

  @override
  initState() {
    _foundusers = _CountryList;
    super.initState();
    getData();
  }

  void sortAlpha() {
    _CountryList.sort((a, b) =>
        a.country_name.toLowerCase().compareTo(b.country_name.toLowerCase()));
    for (int i = 0; i < _CountryList.length; i++) {
      print(_CountryList[i].country_name);
    }
  }

  void sortNum() {
    for (int i = 0; i < _CountryList.length; i++) {
      int f = int.parse(_CountryList[i].cases.replaceAll(',', ''));
      print(_CountryList[i].cases);
    }
    _CountryList.sort((a, b) => a.cases.compareTo(b.cases));
  }

  void sortNumDes() {
    for (int i = 0; i < _CountryList.length; i++) {
      int f = int.parse(_CountryList[i].cases.replaceAll(',', ''));
      print(_CountryList[i].cases);
    }
    _CountryList.sort((a, b) => b.cases.compareTo(a.cases));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Corona Tracker'),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(
                    context: context,
                    delegate: CustomSearch(CountryList: _CountryList));
              },
              icon: const Icon(Icons.search)),
          PopupMenuButton<String>(
              onSelected: onSelect,
              itemBuilder: (BuildContext context) {
                return myMenuItems.map((String choice) {
                  return PopupMenuItem<String>(
                    child: Text(choice),
                    value: choice,
                  );
                }).toList();
              })
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 5,
            ),
            Expanded(
              child: _foundusers.isNotEmpty
                  ? ListView.builder(
                      itemCount: _foundusers.length,
                      itemBuilder: (context, index) => ListTile(
                        leading: Padding(
                          padding: const EdgeInsets.only(right: 50.0),
                          child: GestureDetector(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      Specifics(_CountryList[index]),
                                )),
                            child: Container(
                              height: 60,
                              width: 80,
                              child: Text(
                                _foundusers[index].country_name.toString(),
                                style: const TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                        title: Text('Total Cases: ' + _foundusers[index].cases),
                        subtitle: Text('Total deaths: ' +
                            '${_foundusers[index].deaths.toString()}'),
                      ),
                    )
                  : const Text(
                      'No results found',
                      style: TextStyle(fontSize: 24),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomSearch extends SearchDelegate {
  List<Countries>? CountryList;

  CustomSearch({required this.CountryList});

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Countries>? cl = CountryList;
    List<Countries> filteredCountries = [];

    for (var items in cl!) {
      if (items.country_name.toLowerCase().contains(query.toLowerCase())) {
        filteredCountries.add(items);
      }
    }

    return ListView.builder(
      itemBuilder: (context, index) {
        var result = filteredCountries[index];
        return ListTile(
          title: Text(result.toString()),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Countries>? cl = this.CountryList;
    List<Countries> filteredCountries = [];

    for (var items in cl!) {
      if (items.country_name.toLowerCase().contains(query.toLowerCase())) {
        filteredCountries.add(items);
      }
    }

    return ListView.builder(
      itemCount: filteredCountries.length,
      itemBuilder: (context, index) {
        var result = filteredCountries[index].country_name;
        return ListTile(
          title: Text(result.toString()),
        );
      },
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }
}
