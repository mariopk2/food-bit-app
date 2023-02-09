import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';


class Information extends StatefulWidget {
  @override
  _InformationState createState() => _InformationState();
}



class _InformationState extends State<Information> with TickerProviderStateMixin {
  TabController _tabController;
  bool switchValue = true;
  

  @override
  void initState() {
    this._tabController = TabController(
      length: 1,
      initialIndex: 0,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 5.0,
              horizontal: 5.0,
            ),
          ),
          Container(
            color: Colors.white,
            child: TabBar(
              controller: this._tabController,
              indicatorColor: theme.primaryColor,
              indicatorSize: TabBarIndicatorSize.label,
              labelColor: theme.primaryColor,
              labelStyle: TextStyle(fontSize: 20.0),
              unselectedLabelColor: Colors.black,
              tabs: <Widget>[
                Tab(text: 'Информация'),
                
              ],
            ),
          ),
          Expanded(
              child: TabBarView(
            controller: this._tabController,
            children: <Widget>[
              
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                padding: const EdgeInsets.symmetric(
                  vertical: 15.0,
                  horizontal: 20.0,
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15.0,
                      ),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                        color: Colors.grey[300],
                      ))),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.wifi,
                            size: 25.0,
                            color: theme.primaryColor,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15.0,
                            ),
                            child: Text(
                              'Мрежа за интернет: Hotel Vertical',
                              style: TextStyle(fontSize: 18.0),
                            )
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15.0,
                      ),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                        color: Colors.grey[300],
                      ))),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.wifi_password,
                            size: 25.0,
                            color: theme.primaryColor,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15.0,
                            ),
                            child: Text(
                              'Парола за интернет: hotelapp1874637',
                              style: TextStyle(fontSize: 18.0),
                            )
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15.0,
                      ),
                      
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 90,
                            ),
                            child: Text("Директна връзка с интернет"),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15.0,
                      ),
                      
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                        color: Colors.grey[300],
                      ))),
                      
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 90,
                            ),
                            child: QrImage(
                              data: "WIFI:S:hotelapp1874637;",
                              version: QrVersions.auto,
                              size: 200.0,
                            ),
                          )
                        ],
                      ),
                    ),
                    
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                      ),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                        color: Colors.grey[300],
                      ))),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.phone_callback,
                            size: 25.0,
                            color: theme.primaryColor,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15.0,
                            ),
                            child: Text(
                              'Тел. регистратура: +359879944399',
                              style: TextStyle(fontSize: 18.0),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                      ),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.grey[300],
                          ),
                        ),
                      ),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.confirmation_num,
                            size: 25.0,
                            color: theme.primaryColor,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15.0,
                            ),
                            child: Text(
                              'Настаняване: след 14:00',
                              style: TextStyle(fontSize: 18.0),
                            ),
                          )
                        ],
                      ),
                      
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                      ),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.grey[300],
                          ),
                        ),
                      ),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.backpack,
                            size: 25.0,
                            color: theme.primaryColor,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15.0,
                            ),
                            child: Text(
                              'Напускане: до 12:00',
                              style: TextStyle(fontSize: 18.0),
                            ),
                          )
                        ],
                      ),
                      
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                      ),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.grey[300],
                          ),
                        ),
                      ),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.spa_outlined,
                            size: 25.0,
                            color: theme.primaryColor,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15.0,
                            ),
                            child: Text(
                              'СПА Център: от 10:00 до 20:30',
                              style: TextStyle(fontSize: 18.0),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
