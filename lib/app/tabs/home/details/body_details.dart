import 'package:flutter/material.dart';
import 'package:food_bit_app/app/components/custom_header.dart';

Widget iconBadge({@required IconData icon, @required Color iconColor}) {
  return Container(
    padding: const EdgeInsets.all(4.0),
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 4.0,
          offset: Offset(3.0, 3.0),
        )
      ],
      shape: BoxShape.circle,
      color: Colors.white,
    ),
    child: Icon(
      icon,
      size: 20.0,
      color: iconColor,
    ),
  );
}

Widget detailsTab() {
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
          child: Text(
            'Пилешка пържола с много хрупкава коричка, поднесена с гарнитура от домати, краставици и зелена салата.',
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 20.0),
          color: Color.fromRGBO(250, 250, 250, 1.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Icon(
                    Icons.history,
                    color: Colors.blue[900],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Text('Време за приготвяне: 18 мин.'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget renderCardReview() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            CircleAvatar(
              child: Icon(Icons.person),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Георги Иванов',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    'Януари, 2023 г.',
                    style: TextStyle(
                      color: Colors.grey[400],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        Container(
          margin: const EdgeInsets.only(
            left: 50.0,
            top: 2.0,
          ),
          child: Text(
            ' Много добра кухня. Отлично обслужване!',
            style: TextStyle(
              fontSize: 13.0,
            ),
          ),
        )
      ],
    ),
  );
}

Widget reviewTab() {
  return SingleChildScrollView(
    child: Container(
      child: Column(
        children: <Widget>[
          renderCardReview(),
          renderCardReview(),
          renderCardReview(),
          renderCardReview(),
        ],
      ),
    ),
  );
}

class BodyDetails extends StatefulWidget {
  @override
  _BodyDetailsState createState() => _BodyDetailsState();
}

class _BodyDetailsState extends State<BodyDetails>
    with TickerProviderStateMixin {
  int quantity = 0;
  int screenTab = 0;
  TabController _tabController;

  @override
  void initState() {
    this._tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Map screenArguments = ModalRoute.of(context).settings.arguments;
    Map product = screenArguments['product'];
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          CustomHeader(
            title: '',
            quantity: this.quantity,
            internalScreen: true,
          ),
          Container(
            margin: EdgeInsets.only(
              top: size.width * 0.55,
              left: 50.0,
              right: 50.0,
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            margin: const EdgeInsets.only(right: 65.0, bottom: 10.0),
            child: iconBadge(
              icon: Icons.favorite,
              iconColor: theme.primaryColor,
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 50.0),
              padding: const EdgeInsets.only(
                top: 10.0,
              ),
              width: size.width - 100.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                children: <Widget>[
                  
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Container(
                      margin: const EdgeInsets.only(
                        top: 15.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            product['name'],
                            style: TextStyle(fontSize: 18.0),
                          ),
                          Text(
                            '\ ${product['price']} лв.',
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          'от',
                          style: TextStyle(
                            color: Colors.grey[500],
                          ),
                        ),
                        Text(' Хотел ресторант'),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 20.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            if (this.quantity > 0) {
                              setState(() {
                                this.quantity--;
                              });
                            }
                          },
                          child: Icon(
                            Icons.remove,
                            size: 30.0,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30.0,
                            vertical: 8.0,
                          ),
                          margin: const EdgeInsets.symmetric(
                            horizontal: 20.0,
                          ),
                          decoration: BoxDecoration(
                            color: theme.primaryColor,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Text(
                            'Поръчай',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              this.quantity++;
                            });
                          },
                          child: Icon(
                            Icons.add,
                            size: 30.0,
                            color: theme.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: TabBar(
                      controller: this._tabController,
                      labelColor: theme.primaryColor,
                      labelPadding: EdgeInsets.all(0),
                      indicatorColor: Colors.white,
                      labelStyle: TextStyle(
                        fontSize: 18.0,
                      ),
                      tabs: [
                        Container(
                          height: 25.0,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Описание',
                          ),
                        ),
                        Container(
                          height: 25.0,
                          alignment: Alignment.centerRight,
                          child: Text(
                            'Отзиви',
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: this._tabController,
                      children: [
                        detailsTab(),
                        reviewTab(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
