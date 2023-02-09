import 'package:flutter/material.dart';
import 'package:food_bit_app/app/tabs/account/account.dart';
import 'package:food_bit_app/app/tabs/cart/cart.dart';
import 'package:food_bit_app/app/tabs/home/home.dart';
import 'package:food_bit_app/app/tabs/near_by/near_by.dart';
import 'package:food_bit_app/app/tabs/information/information.dart';
import 'package:http/http.dart' as http;

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    //print('Widget Build Start');
  
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        body: TabBarView(
          children: <Widget>[
            Home(),
            Information(),
            NearBy(),
            Cart(),
            Account(),
          ],
        ),
        bottomNavigationBar: Material(
          color: Colors.white,
          child: TabBar(
            labelPadding: const EdgeInsets.only(bottom: 10),
            labelStyle: TextStyle(fontSize: 16.0),
            indicatorColor: Colors.transparent,
            labelColor: theme.primaryColor,
            unselectedLabelColor: Colors.black54,
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.home, size: 23),
                //text: 'Начало',
                child: Text(
                  "Начало",
                  style: TextStyle(fontSize: 15, color: Colors.black),
                ),  
              ),
              Tab(
                icon: Icon(Icons.info_rounded, size: 23),
                //text: 'Информация',
                child: Text(
                  "Информация",
                  style: TextStyle(fontSize: 13, color: Colors.black),
                ),
              ),
              Tab(
                icon: Icon(Icons.restaurant_menu, size: 23),
                //text: 'Меню',
                child: Text(
                  "Меню",
                  style: TextStyle(fontSize: 15, color: Colors.black),
                ),
              ),
              Tab(
                icon: Icon(Icons.card_travel, size: 23),
                //text: 'Поръчка',
                child: Text(
                  "Поръчка",
                  style: TextStyle(fontSize: 15, color: Colors.black),
                ),
              ),
              Tab(
                icon: Icon(Icons.person_outline, size: 23),
                //text: 'Стая',
                child: Text(
                  "Стая",
                  style: TextStyle(fontSize: 15, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
