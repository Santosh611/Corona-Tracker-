import 'package:api_sample/specific.dart';
import 'package:flutter/material.dart';
import 'package:api_sample/countries.dart';

class ListItem extends StatelessWidget {
  final Countries countries;

  const ListItem(this.countries);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Specifics(countries)),
          );

          print("Test Working");
        },
        child: Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        countries.country_name,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        maxLines: 2,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Text(
                        "Deaths:" + countries.deaths.toString(),
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        maxLines: 2,
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 10),
                      ),
                      Text(
                        "Cases:" + countries.cases.toString(),
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        maxLines: 2,
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 10),
                      ),
                      Text(
                        "Total Recovered:" +
                            countries.total_recovered.toString(),
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        maxLines: 2,
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 10),
                      ),
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
