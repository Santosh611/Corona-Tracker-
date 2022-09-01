import 'dart:convert';
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:api_sample/list_item.dart';
import 'news.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Corona Trackers'),
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
  List _foundusers = [];

  void getData() async {
    print("object");
    http.Response response = await http.get(
        "https://corona-virus-world-and-india-data.p.rapidapi.com/api",
        headers: {
          'x-rapidapi-host': 'corona-virus-world-and-india-data.p.rapidapi.com',
          'x-rapidapi-key':
              '6b43206931mshf9b4796cc4700afp139455jsned3f9fd23fa0',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        });
    print(response.body);

    setState(() {
      _foundusers = _CountryList;

      _CountryList = Corona.fromJson(json.decode(response.body)).countries_stat;
    });
  }

  @override
  initState() {
    _foundusers = _CountryList;
    super.initState();
    getData();
  }

  void _runFilter(String enteredKeyword) {
    // List<Countries> results = [];

    if (enteredKeyword.isEmpty) {
      setState(() => _foundusers = _CountryList);
    } else {
      final List<String> filteredCountries = [];
      _CountryList.map((Countries) {
        if (Countries.country_name
            .contains(enteredKeyword.toString().toUpperCase())) {
          filteredCountries.add(Countries.country_name);
        }
      }).toList();
      setState(() {
        _foundusers = filteredCountries;
        //  filteredCountries = _foundusers;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: TextField(
                onChanged: (value) => _runFilter(value),
                decoration: const InputDecoration(
                    labelText: 'Search', suffixIcon: Icon(Icons.search)),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: _foundusers.isNotEmpty
                  ? ListView.builder(
                      itemCount: _foundusers.length,
                      itemBuilder: (context, index) => ListTile(
                        leading: Text(
                          _foundusers[index]["country_name"].toString(),
                          style: const TextStyle(fontSize: 24),
                        ),
                        title: Text(_foundusers[index]['cases']),
                        subtitle:
                            Text('${_foundusers[index]["deaths"].toString()}'),
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
