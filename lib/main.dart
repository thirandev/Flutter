import 'package:flutter/material.dart';
import 'package:foodoapp/checkoutWidget.dart';
import 'package:foodoapp/storeData.dart';
import 'package:badges/badges.dart';

void main() => runApp(MainScreen());

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: AppBarTheme(color: Colors.white, elevation: 0),
          scaffoldBackgroundColor: Colors.white),
      home: FoodMainWdidgetState(),
    );
  }
}

class FoodMainWdidgetState extends StatefulWidget {
  @override
  _FoodMainWdidgetStateState createState() => _FoodMainWdidgetStateState();
}

class _FoodMainWdidgetStateState extends State<FoodMainWdidgetState> {
  @override
  void initState() {
    super.initState();
  }

  StoreData storeData = StoreData();
  int _cartBadge = 0;

  void addToCart(String foodName, int foodPrice){
    storeData.storeFoodDetails(foodName, foodPrice);
    setState(() {
      ++_cartBadge;
    });
  }

  void removeFromCart(String foodName){
    storeData.removeFoodDetails(foodName);
    setState(() {
      if(_cartBadge>0){
        --_cartBadge;
      }
    });
  }

  List<String> _foodName = ['Pasta', 'Pizza', 'Burger'];
  List<String> _foodImage = [
    'https://images.unsplash.com/photo-1555949258-eb67b1ef0ceb?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80',
    'https://images.unsplash.com/photo-1607290817806-e93c813ff329?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80',
    'https://images.unsplash.com/photo-1513185158878-8d8c2a2a3da3?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80',
  ];
  List<int> _foodPrice = [800, 1600, 750];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          titleSpacing: 30,
          title: Text(
              'FoodOff',
              style:TextStyle(
                color:Colors.grey[900],
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          actions: [
              Padding(
                padding: const EdgeInsets.all(0),
                child: Badge(
                  position: BadgePosition.topEnd(top: 3, end: 5),
                  badgeColor:Colors.lime,
                  badgeContent: Text(_cartBadge.toString()),
                  animationDuration:Duration(milliseconds: 100),
                  animationType: BadgeAnimationType.fade,
                  showBadge:_cartBadge==0?false:true,
                  child: IconButton(
                    icon: Icon(                     
                      Icons.shopping_bag_outlined,
                      color: Colors.grey[800],
                      size:25
                    ),
                    onPressed: () {
                         Navigator.push(
                          context,
                          MaterialPageRoute(builder:(context) => CheckoutWidget())
                        );  
                    },
                  ),
                ),
              ),
          ],
        ),
        body: Center(
          child: ListView.separated(
              padding: EdgeInsets.fromLTRB(30, 10, 30, 30),
              itemCount: _foodName.length,
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(
                    height: 20.0,
                  ),
              itemBuilder: (BuildContext context, int count) {
                return Card(
                  elevation: 5.0,
                  color: Colors.white70,
                  child: Column(
                    children: [
                      Image.network(_foodImage[count]),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _foodName[count],
                                  style: TextStyle(
                                  fontSize: 30.0, fontWeight: FontWeight.w600),
                                  textAlign: TextAlign.left,
                                ),
                                  SizedBox(
                              height: 5,
                            ),
                            Text(
                              "LKR " + _foodPrice[count].toString(),
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                              textAlign: TextAlign.left,
                            ),
                              ],
                            ),
                            SizedBox(width: 100,),
                            TextButton(
                                onPressed: () {
                                  addToCart(_foodName[count], _foodPrice[count]);
                                },
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                  minimumSize: Size(50, 30),
                                ),
                                child: Icon(
                                  Icons.add_circle,
                                  size: 40,
                                  color: Colors.grey[800],
                                )),
                            TextButton(
                                onPressed: () {
                                  removeFromCart(_foodName[count]);
                                },
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  minimumSize: Size(50, 30),
                                ),
                                child: Icon(
                                  Icons.remove_circle,
                                  size: 40,
                                  color: Colors.grey[800],
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
