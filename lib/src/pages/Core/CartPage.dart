import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          icon:Icon(Icons.arrow_back)),
        title: Text("Mon Panier ( 5 articles )"),
        actions: <Widget>[],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "images/background/vegetablePattern.jpg",
              ),
              fit: BoxFit.cover),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: ListView(
                children: <Widget>[
                  elementCart("ananas.jpg", "Ananas", 17, 0.5),
                  elementCart("orange.jpg", "Orange", 8, 3),
                  elementCart("banane.jpg", "Banane", 9, 1),


                ],
              ),
            ),
             Padding(
               padding: const EdgeInsets.symmetric(horizontal:16.0),
               child: Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5.0,
                  ),
                ],
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text("Total : ",style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                    Text("156 Dhs",style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                ),
                  ],
                )
            ),
             ),
            Container(
              padding: EdgeInsets.all(16.0),
              color: Colors.orange,
              child: Text(
                "Valider ma commande",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 21),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget elementCart(String img, String title, double price, double qte) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: <Widget>[
          Container(
            height: 150,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Container(
                    color: Colors.blue,
                    child: Image.asset("images/fruits/" + img),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Container(
                    width: 1,
                    height: double.infinity,
                    color: Colors.black,
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Text(
                          title,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 21.0,
                          ),
                        ),
                        Text(
                          price.toString() +" Dhs/kg",
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  color: Colors.red,
                                  child:
                                      Icon(Icons.remove, color: Colors.white),
                                ),
                              ),
                              Text(
                                qte.toString() + " kg",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  color: Colors.green,
                                  child: Icon(Icons.add, color: Colors.white),
                                ),
                              )
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Total: ",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                            ),
                            Text(
                               (qte * price).toString() + " Dhs",
                              style: TextStyle(
                                color: Colors.orange,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5.0,
                  ),
                ]),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration:
                  BoxDecoration(color: Colors.red, shape: BoxShape.circle),
              height: 20,
              width: 20,
              child: Center(
                  child: Icon(
                Icons.close,
                color: Colors.white,
                size: 20,
              )),
            ),
          ),
        ],
      ),
    );
  }
}
