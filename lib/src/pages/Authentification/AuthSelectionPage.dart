import 'package:ecommerce_app/src/pages/Authentification/LogInPage.dart';
import 'package:ecommerce_app/src/pages/Authentification/RegisterPage.dart';
import 'package:ecommerce_app/src/widgets/logoWidget.dart';
import 'package:flutter/material.dart';

class AuthSelectionPage extends StatefulWidget {
  @override
  _AuthSelectionPageState createState() => _AuthSelectionPageState();
}

class _AuthSelectionPageState extends State<AuthSelectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fitHeight,
                    image:
                        AssetImage("images/background/vegetablePattern.jpg")),
              ),
              child: CustomPaint(
                painter: CurvePainter(),
              )),
          Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    LogoWidget(),
                    /*Text("App title", style: TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                
                ),),*/
                  ],
                ),
                Column(
                  children: <Widget>[
      
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: RaisedButton(
                          color: Color(0xffdd4b39),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal:48.0, vertical: 12.0),
                            child: Text(
                              "S'INSCRIRE",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => RegisterPage()));
                          },
                        ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
  
                    SizedBox(
                      height: 25,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => LogInPage()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Déjà inscrit ? ",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "S'identifier",
                            style: TextStyle(
                              color: Colors.orange,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Text(
                  "En continuant, vous avez lu et accepté nos Termes et Conditions et notre Politiques de confidentialité.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.green[800];

    paint.color = Colors.green[800];
    paint.style = PaintingStyle.fill; // Change this to fill

    var path = Path();

    path.moveTo(0, size.height * 0.33);
    path.quadraticBezierTo(
        size.width / 2, size.height / 5, size.width, size.height * 0.33);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
