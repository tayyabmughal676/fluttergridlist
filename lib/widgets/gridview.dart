import 'package:flutter/material.dart';
import 'package:fluttergridlist/model/city.dart';


class MyGridView extends StatelessWidget {
  final List<City> allCities;
  MyGridView({Key key, this.allCities}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      padding: EdgeInsets.all(10.0),
      childAspectRatio: 5.0 / 9.0, // 8.0/9.0
      children: _getGridViewItems(context),
    );
  }
//  _getGridViewItems_1(BuildContext context){
//    List<Widget> allWidgets = new List<Widget>();
//    for (int i = 0; i < allCities.length; i++) {
//      var widget = new Text(allCities[i].name);
//      allWidgets.add(widget);
//    };
//    return allWidgets;
//  }

  _getGridViewItems(BuildContext context) {
    List<Widget> allWidgets = new List<Widget>();
    for (int i = 0; i < allCities.length; i++) {
      var widget = _getGridItemUI(context, allCities[i]);
      allWidgets.add(widget);
    };
    return allWidgets;
  }

  // Create individual item
  _getGridItemUI(BuildContext context, City item) {
    return new InkWell(
        onTap: () {
          _showSnackBar(context, item);
        },
        child: new Card(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Image.asset(
                "assets/" + item.image,
                fit: BoxFit.fill,
                //height:100.0,
              ),
              new Expanded(
                  child: new Center(
                      child: new Column(
                        children: <Widget>[
                          new SizedBox(height: 8.0),
                          new Text(
                            item.name,
                            style: new TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          new Text(item.country),
                          new Text('Population \n ${item.population}' , textAlign: TextAlign.center,)
                        ],
                      )))
            ],
          ),
          elevation: 2.0,
          margin: EdgeInsets.all(5.0),
        ));
  }

  /// This will show snackbar at bottom when user tap on Grid item
  _showSnackBar(BuildContext context, City item) {
    final SnackBar objSnackbar = new SnackBar(
      content: new Text("${item.name} is a city in ${item.country}"),
      backgroundColor: Colors.black,
    );

    Scaffold.of(context).showSnackBar(objSnackbar);
  }
}
