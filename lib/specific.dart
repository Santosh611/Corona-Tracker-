import 'package:flutter/material.dart';
import 'package:api_sample/news.dart';

class Specifics extends StatelessWidget {
  final Countries countries;

  const Specifics(this.countries);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: <Widget>[
        Container(
          height: 80,
          width: 100,
          child: Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(
                'https://www.un.org/sites/un2.un.org/files/field/image/1583952355.1997.jpg'),
          )),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(top: 100),
            child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    countries.country_name,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    maxLines: 2,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(
                    "Deaths:" + countries.deaths.toString(),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    maxLines: 2,
                    style: TextStyle(fontStyle: FontStyle.italic, fontSize: 10),
                  ),
                  Text(
                    "Cases:" + countries.cases.toString(),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    maxLines: 2,
                    style: TextStyle(fontStyle: FontStyle.italic, fontSize: 10),
                  ),
                  Text(
                    "Total Recovered:" + countries.total_recovered.toString(),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    maxLines: 2,
                    style: TextStyle(fontStyle: FontStyle.italic, fontSize: 10),
                  ),
                  Text(
                    "New Deaths" + countries.new_deaths.toString(),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    maxLines: 2,
                    style: TextStyle(fontStyle: FontStyle.italic, fontSize: 10),
                  ),
                  Text(
                    "New cases:" + countries.new_cases.toString(),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    maxLines: 2,
                    style: TextStyle(fontStyle: FontStyle.italic, fontSize: 10),
                  ),
                  Text(
                    "Serious Critical:" + countries.serious_critical.toString(),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    maxLines: 2,
                    style: TextStyle(fontStyle: FontStyle.italic, fontSize: 10),
                  ),
                  Text(
                    "Active Cases:" + countries.active_cases.toString(),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    maxLines: 2,
                    style: TextStyle(fontStyle: FontStyle.italic, fontSize: 10),
                  ),
                  Text(
                    "Total Cases per 1M Population:" +
                        countries.total_cases_per_1m_population.toString(),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    maxLines: 2,
                    style: TextStyle(fontStyle: FontStyle.italic, fontSize: 10),
                  ),
                  Text(
                    "Deaths Per 1M Population:" +
                        countries.deaths_per_1m_population.toString(),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    maxLines: 2,
                    style: TextStyle(fontStyle: FontStyle.italic, fontSize: 10),
                  ),
                  Text(
                    "Total Tests:" + countries.total_tests.toString(),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    maxLines: 2,
                    style: TextStyle(fontStyle: FontStyle.italic, fontSize: 10),
                  ),
                  Text(
                    "Total per 1M population :" +
                        countries.tests_per_1m_population.toString(),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    maxLines: 2,
                    style: TextStyle(fontStyle: FontStyle.italic, fontSize: 10),
                  ),
                ]),
          ),
        )
      ],
    ));
  }
}
