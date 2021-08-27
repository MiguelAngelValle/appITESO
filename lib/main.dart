import 'package:flutter/material.dart';

void main() => runApp(MyAppIteso());

class MyAppIteso extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

int count = 0;

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  void increment() {
    setState(() {
      count++;
    });
  }

  void decrement() {
    setState(() {
      count--;
    });
  }

  final _scaffkey = GlobalKey<ScaffoldState>(); //////////////////////////

  void snackbarMail() {
    SnackBar snackbarM = SnackBar(content: Text('Correo: admision@iteso.mx'));
    ScaffoldMessenger.of(context).showSnackBar(snackbarM);
  }

  void snackbarPhone() {
    SnackBar snackbarP = SnackBar(content: Text('Telefono: (33) 3669 3434'));
    ScaffoldMessenger.of(context).showSnackBar(snackbarP);
  }

  void snackbarDirection() {
    SnackBar snackbarD = SnackBar(content: Text('Direccion: Periférico Sur Manuel Gómez Morín #8585'));
    ScaffoldMessenger.of(context).showSnackBar(snackbarD);
  }

bool mailClick = false;
bool phoneClick = false;
bool directionClick = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffkey, //////////////////////////////////////////////////
      appBar: AppBar(
        title: Text('App Iteso'),
      ),
      body: ListView(
        children: [
          
          //imagen
          Image.network(
            "https://cruce.iteso.mx/wp-content/uploads/sites/123/2018/04/Portada-2-e1525031912445.jpg",
          ),
         
          Container(
            height: 40,
          ),
         
          //titulo y likes
          Row(
            children: [  

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "ITESO, Universidad Jesuita de Guadajara",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "San Pedro Tlaquepaque",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),

              IconButton(
                onPressed: () {
                  increment();
                },
                icon: Icon(Icons.thumb_up),
                color: Colors.indigo,
              ),

              IconButton(
                onPressed: () {
                  decrement();
                },
                icon: Icon(Icons.thumb_down),
                color: Colors.indigo
              ), 

              Text('$count')
            
            ],
          ),
      
          Container(
            height: 40,
          ),
          
          //iconos
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.mail,
                      color: mailClick ? Colors.indigo : Colors.black,
                    ),
                    iconSize: 50,
                    onPressed: () {
                      //snackbar
                      snackbarMail();
                      setState(() {});
                      mailClick = !mailClick;
                    }  
                  ),
                  Text('Mail', style: TextStyle(fontWeight: FontWeight.bold))
                ],
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.add_ic_call,
                      color: phoneClick ? Colors.indigo : Colors.black,
                    ),
                    iconSize: 50,
                    onPressed: () {
                      //snackbar
                      snackbarPhone();
                      setState(() {});
                      phoneClick = !phoneClick;
                    }  
                  ),
                  Text('Llamada', style: TextStyle(fontWeight: FontWeight.bold))
                ],
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.directions,
                      color: directionClick ? Colors.indigo : Colors.black,
                    ),
                    iconSize: 50,
                    onPressed: () {
                      //snackbar
                      snackbarDirection();
                      setState(() {});
                      directionClick = !directionClick;
                    }  
                  ),
                  Text('Ruta', style: TextStyle(fontWeight: FontWeight.bold))
                ],
              )
            ],
          ),

          Container(
            height: 40,
          ),

          Text(
            "El ITESO, Universidad Jesuita de Guadalajara (Instituto Tecnológico y de Estudios Superiores de Occidente), es una universidad privada ubicada en la Zona Metropolitana de Guadalajara, Jalisco, México, fundada en el año 1957. La institución forma parte del Sistema Universitario Jesuita (SUJ) que integra a ocho universidades en México. La universidad es nombrada como la Universidad Jesuita de Guadalajara.",
            textAlign: TextAlign.justify,
          )
        ],
      ),
    );
  }
}