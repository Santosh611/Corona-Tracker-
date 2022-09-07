import 'package:flutter/material.dart';
import 'package:api_sample/countries.dart';

class Specifics extends StatelessWidget {
  final Countries countries;

  Specifics(this.countries);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 70, right: 30),
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, bottom: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      countries.country_name,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      maxLines: 2,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Deaths:${countries.deaths}",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      maxLines: 2,
                      style: const TextStyle(
                          fontStyle: FontStyle.italic, fontSize: 15),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Cases:${countries.cases}",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      maxLines: 2,
                      style: const TextStyle(
                          fontStyle: FontStyle.italic, fontSize: 15),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Total Recovered:${countries.total_recovered}",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      maxLines: 2,
                      style: const TextStyle(
                          fontStyle: FontStyle.italic, fontSize: 15),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "New Deaths${countries.new_deaths}",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      maxLines: 2,
                      style: const TextStyle(
                          fontStyle: FontStyle.italic, fontSize: 15),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "New cases:${countries.new_cases}",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      maxLines: 2,
                      style: const TextStyle(
                          fontStyle: FontStyle.italic, fontSize: 15),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Serious Critical:${countries.serious_critical}",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      maxLines: 2,
                      style: const TextStyle(
                          fontStyle: FontStyle.italic, fontSize: 15),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Active Cases:${countries.active_cases}",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      maxLines: 2,
                      style: const TextStyle(
                          fontStyle: FontStyle.italic, fontSize: 15),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Total Cases per 1M Population:${countries.total_cases_per_1m_population}",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      maxLines: 2,
                      style: const TextStyle(
                          fontStyle: FontStyle.italic, fontSize: 15),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Deaths Per 1M Population:${countries.deaths_per_1m_population}",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      maxLines: 2,
                      style: const TextStyle(
                          fontStyle: FontStyle.italic, fontSize: 15),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Total Tests:${countries.total_tests}",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      maxLines: 2,
                      style: const TextStyle(
                          fontStyle: FontStyle.italic, fontSize: 15),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Total per 1M population :${countries.tests_per_1m_population}",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      maxLines: 2,
                      style: const TextStyle(
                          fontStyle: FontStyle.italic, fontSize: 15),
                    ),
                  ]),
            ),
          ),
        )
      ],
    ));
  }
}
