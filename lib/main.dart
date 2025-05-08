import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WeatherScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class DashLine extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    double dashWidth = 15.0;
    double dashSpace = 8.0;
    double startX = (size.width - (dashWidth * 10 + dashSpace * 9)) / 2; 
    double endX = startX + dashWidth * 10 + dashSpace * 9;

    while (startX < endX) {
      canvas.drawLine(
        Offset(startX, 0),
        Offset(startX + dashWidth, 0),
        paint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class WeatherScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    
    return Scaffold(    
      backgroundColor: Colors.blue[50], // Latar belakang langit biru muda
      body: Center(
        child: Container(
          width: screenWidth,
          height: screenHeight,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/img/3d-cartoon-night-sky.jpg'), // Gambar latar belakang
              fit: BoxFit.cover,
            ),
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              AnimatedOpacity(
                opacity: 1.0,
                duration: Duration(seconds: 2),
                child: Text(
                  'Pamulang',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 10),
              
              Text(
                'Selasa, 8 Mei, 2025',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.grey[200],
                ),
              ),
              SizedBox(height: 30),
              

              AnimatedContainer(
                duration: Duration(seconds: 1),
                child: Text(
                  '25°C',
                  style: TextStyle(
                    fontSize: 120,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: CustomPaint(
                  size: Size(double.infinity, 10), // Ukuran garis
                  painter: DashLine(),
                ),
              ),
              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.cloud, color: Colors.white, size: 40),
                  SizedBox(width: 10),
                  Text(
                    'Berawan',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[200],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              

              Text(
                '25°c / 32°c',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 30),

            ],
          ),
        ),
      ),
    );
  }
}
