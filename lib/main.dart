import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AsalSayac(),
    );
  }
}

class AsalSayac extends StatefulWidget {
  @override
  _AsalSayacState createState() => _AsalSayacState();
}

class _AsalSayacState extends State<AsalSayac> {
  int sayi = 1;

  bool isPrime(int n) {
    if (n < 2) return false;
    for (int i = 2; i * i <= n; i++) {
      if (n % i == 0) return false;
    }
    return true;
  }

  int sonrakiAsal(int n) {
    int x = n + 1;
    while (!isPrime(x)) {
      x++;
    }
    return x;
  }

  int oncekiAsal(int n) {
    int x = n - 1;
    while (x >= 2 && !isPrime(x)) {
      x--;
    }
    return x < 2 ? 2 : x; // asaldan önce en küçük asal 2
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Asal Sayaç"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Sayı: $sayi",
              style: TextStyle(fontSize: 30),
            ),

            SizedBox(height: 20),

            Text(
              isPrime(sayi) ? "ASAL" : "ASAL DEĞİL",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: isPrime(sayi) ? Colors.green : Colors.red,
              ),
            ),

            SizedBox(height: 40),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      sayi = oncekiAsal(sayi);
                    });
                  },
                  child: Text("Önceki Asal"),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      sayi = sonrakiAsal(sayi);
                    });
                  },
                  child: Text("Sonraki Asal"),
                ),
              ],
            ),

            SizedBox(height: 40),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  sayi++;
                });
              },
              child: Text("Sayaç +1"),
            ),
          ],
        ),
      ),
    );
  }
}
