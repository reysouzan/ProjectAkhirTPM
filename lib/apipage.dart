import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AlcoholPage extends StatefulWidget {
  @override
  _AlcoholPageState createState() => _AlcoholPageState();
}

class _AlcoholPageState extends State<AlcoholPage> {
  List<dynamic> drinks = [];
  List<dynamic> filteredDrinks = [];

  @override
  void initState() {
    super.initState();
    fetchAlcoholicDrinks();
  }

  Future<void> fetchAlcoholicDrinks() async {
    final response = await http.get(
        Uri.parse('https://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Alcoholic'));

    if (response.statusCode == 200) {
      setState(() {
        final data = json.decode(response.body);
        drinks = data['drinks'];
        filteredDrinks = drinks;
      });
    } else {
      throw Exception('Failed to load alcoholic drinks');
    }
  }

  void searchDrinks(String query) {
    setState(() {
      filteredDrinks = drinks
          .where((drink) =>
          drink['strDrink'].toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alcoholic Drinks'),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: searchDrinks,
              decoration: InputDecoration(
                labelText: 'Search by Name',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: filteredDrinks.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, index) {
                final drink = filteredDrinks[index];
                return GridTile(
                  child: GestureDetector(
                    onTap: () {
                    },
                    child: Image.network(drink['strDrinkThumb'],
                        fit: BoxFit.cover),
                  ),
                  footer: GridTileBar(
                    backgroundColor: Colors.black45,
                    title: Text(
                      drink['strDrink'],
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
