import 'dart:convert';
import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'package:food_bit_app/app/components/food_card.dart';
import 'package:http/http.dart' as http;

void main() async {

  final urlPopularProducts = await http.get(Uri.parse("https://ebilling.dev/test.json"));
  //print(response.body);
  var getPopularProducts = json.decode(utf8.decode(urlPopularProducts.bodyBytes));
  var popularProductsArray = getPopularProducts;
  print(popularProductsArray);
  
}

class Home extends StatelessWidget {
 

//List<dynamic> popularFood = jsonDecode("your json string");

  final List<Map<String, String>> popularFood = [
    {
      'name': 'Пиле Терияки',
      'price': '96.00',
      'rate': '4.9',
      'clients': '200',
      'image': 'images/plate-001.png'
    },
    {
      'name': 'Риба тон',
      'price': '40.50',
      'rate': '4.5',
      'clients': '168',
      'image': 'images/plate-002.png'
    },
    {
      'name': 'Свинско с ориз',
      'price': '130.00',
      'rate': '4.8',
      'clients': '150',
      'image': 'images/plate-003.png'
    },
    {
      'name': 'Вегетерианска порция',
      'price': '400.00',
      'rate': '4.2',
      'clients': '150',
      'image': 'images/plate-007.png'
    },
    {
      'name': 'Сач на двама',
      'price': '1000.00',
      'rate': '4.6',
      'clients': '10',
      'image': 'images/plate-006.png'
    }
  ];

  final List<Map<String, String>> foodOptions = [
    {
      'name': 'Салати',
      'image': 'images/Icon-004.png',
    },
    {
      'name': 'Предястия',
      'image': 'images/Icon-003.png',
    },
    {
      'name': 'Месни ястия',
      'image': 'images/Icon-001.png',
    },
    {
      'name': 'Бургери',
      'image': 'images/Icon-002.png',
    }
  ];

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                top: 20.0,
                left: 20.0,
                right: 20.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Какво Ви се хапва днес?',
                    style: TextStyle(fontSize: 21.0),
                  ),
                  Icon(Icons.notifications_none, size: 28.0),
                  Icon(Icons.logout, size: 28.0)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 25.0,
                left: 20.0,
                right: 20.0,
              ),
              child: TextField(
                keyboardType: TextInputType.text,
                autocorrect: true,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[300], width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: theme.primaryColor, width: 1.0),
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    size: 28.0,
                    color: theme.primaryColor,
                  ),
                  suffixIcon: Icon(
                    Icons.filter_list,
                    size: 28.0,
                    color: theme.primaryColor,
                  ),
                  hintText: 'Търсене на ястия',
                  hintStyle: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 19.0,
                  ),
                ),
              ),
            ),
            Container(
              height: 105,
              margin: const EdgeInsets.only(
                top: 20.0,
                bottom: 25.0,
              ),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(
                    left: 20.0,
                  ),
                  itemCount: this.foodOptions.length,
                  itemBuilder: (context, index) {
                    Map<String, String> option = this.foodOptions[index];
                    return Container(
                      margin: const EdgeInsets.only(right: 35.0),
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: 70,
                            height: 70,
                            margin: const EdgeInsets.only(bottom: 10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5.0),
                              ),
                              image: DecorationImage(
                                image: AssetImage(
                                  option['image'],
                                ),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 10.0,
                                  color: Colors.grey[300],
                                  offset: Offset(6.0, 6.0),
                                )
                              ],
                            ),
                          ),
                          Text(
                            option['name'],
                            style: TextStyle(fontSize: 17.0),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, bottom: 10.0),
              child: Text(
                'Популярни ястия',
                style: TextStyle(fontSize: 21.0),
              ),
            ),
            Container(
              height: 220.0,
              child: ListView.builder(
                padding: const EdgeInsets.only(left: 10.0),
                scrollDirection: Axis.horizontal,
                itemCount: this.popularFood.length,
                itemBuilder: (context, index) {
                  Map<String, String> product = this.popularFood[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        'details',
                        arguments: {
                          'product': product,
                          'index': index,
                        },
                      );
                    },
                    child: Hero(
                      tag: 'detail_food$index',
                      child: FoodCard(
                        width: size.width / 2 - 30.0,
                        primaryColor: theme.primaryColor,
                        productName: product['name'],
                        productPrice: product['price'],
                        productUrl: product['image'],
                        productClients: product['clients'],
                        productRate: product['rate'],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                bottom: 10.0,
                top: 35.0,
              ),
              child: Text(
                'Специално предложение',
                style: TextStyle(fontSize: 21.0),
              ),
            ),
            GestureDetector(
              onTap: () {
                Map<String, String> localProduct = {
                  'name': 'Тортила по гръцки',
                  'price': '26.00',
                  'rate': '5.0',
                  'clients': '150',
                  'image': 'images/plate-005.jpg'
                };
                Navigator.pushNamed(context, 'details', arguments: {
                  'product': localProduct,
                  'index': this.popularFood.length
                });
              },
              child: Hero(
                tag: 'detail_food${this.popularFood.length}',
                child: Container(
                  width: size.width - 40,
                  color: Colors.white,
                  padding: const EdgeInsets.only(bottom: 10.0),
                  margin: const EdgeInsets.only(
                    left: 20.0,
                    right: 20.0,
                    bottom: 15.0,
                  ),
                  child: Column(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Container(
                            height: size.width - 40,
                            width: size.width - 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5.0),
                              ),
                              image: DecorationImage(
                                image: AssetImage('images/plate-005.jpg'),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.topRight,
                            margin: const EdgeInsets.all(10.0),
                            child: Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: Icon(
                                Icons.favorite,
                                size: 25.0,
                                color: theme.primaryColor,
                              ),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 10.0,
                          bottom: 4.0,
                          left: 10.0,
                          right: 10.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Тортила по гръцки',
                              style: TextStyle(
                                fontSize: 18.0,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(4.0),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey[300],
                                      blurRadius: 4.0,
                                      offset: Offset(3.0, 3.0),
                                    )
                                  ]),
                              child: Icon(
                                Icons.near_me,
                                size: 22.0,
                                color: theme.primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 5.0,
                          left: 10.0,
                          right: 10.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              '5.0 \(150\)',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.grey[400],
                              ),
                            ),
                            Text(
                              '\ 26.00 лв.',
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class UserModel {
  static fromJson(data) {}
}
