import 'package:flutter/material.dart';
import 'package:foodoapp/storeData.dart';

class CheckoutWidget extends StatefulWidget {
  @override
  _CheckoutWidgetState createState() => _CheckoutWidgetState();
}

class _CheckoutWidgetState extends State<CheckoutWidget> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  int total = 0;
  void updateTotal(){
    Map<String,int> foodDetails = storeData.retrieveFoodDetails();

    setState(() {
      foodDetails.forEach((k, v)=>total= total+v);
    });
  }

  StoreData storeData = StoreData();

  @override
  Widget build(BuildContext context) {
  
    Map<String,int> _foodNamePrice = storeData.retrieveFoodDetails();
    updateTotal();

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.grey[900],),
      body:Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
                  child: ListView.builder(
                      itemCount: _foodNamePrice.keys.length,
                      itemBuilder: (BuildContext context, int count)
                      {
                        String key = _foodNamePrice.keys.elementAt(count);
                        return Card(
                          child: Column(
                              children:[
                                Text("Item Name: "+key, style: TextStyle(color: Colors.deepOrangeAccent, fontSize: 21.0),),
                                Text("Price: "+_foodNamePrice[key].toString()+"\$", style: TextStyle(color: Colors.deepOrangeAccent, fontSize: 21.0))
                              ]
                          ),
                        );
                      }),
                ),
                ListTile(
                  title: Text("Total Price"),
                  subtitle: Text(total.toString()+"\$"),
                )
          ],
        ),
      )
    );
  }
}