import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

int num1 = 1;
int num2 = 1;
int num3 = 1;
String num = 'Status';
int dice1=1;
int dice2=1;

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        centerTitle: true,
        title: const Text('Chance Machine'),
      ),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                num,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),

              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    splashColor: Colors.pink,
                    borderRadius: BorderRadius.circular(15),
                    onTap: () {
                      setState(() {
                        num1 = chance();
                        num = condition();
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Image(
                        image: AssetImage('assets/fruits/pic-$num1.png'),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.blueGrey,
                        ),
                      ),
                      height: 100,
                      width: 100,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    splashColor: Colors.pink,
                    borderRadius: BorderRadius.circular(15),
                    onTap: () {
                      setState(() {
                        num2 = chance();
                        num = condition();
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Image(
                        image: AssetImage('assets/fruits/pic-$num2.png'),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.blueGrey,
                        ),
                      ),
                      height: 100,
                      width: 100,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    splashColor: Colors.pink,
                    borderRadius: BorderRadius.circular(15),
                    onTap: () {
                      setState(() {
                        num3 = chance();
                        num = condition();
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Image(
                        image: AssetImage('assets/fruits/pic-$num3.png'),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.blueGrey,
                        ),
                      ),
                      height: 100,
                      width: 100,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 70,
              ),
              ElevatedButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.pink,
                  primary: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    num1 = chance();
                    num2 = chance();
                    num3 = chance();
                    num = condition();
                  });
                },
                child: const Text('Random'),
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                       dice1 = chancedice();
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child:  Image(
                        color: Colors.pink,
                        image: AssetImage('assets/dice-images/dice$dice1.png'),
                      ),
                      height: 100,
                      width: 100,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        dice2 = chancedice();

                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child:  Image(
                        color: Colors.pink,
                        image: AssetImage('assets/dice-images/dice$dice2.png'),
                      ),
                      height: 100,
                      width: 100,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 70,
              ),
              ElevatedButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.pink,
                  primary: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    dice1 = 1;
                    dice2 = 1;
                  });
                },
                child: const Text('Reset'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

int chance() {
  Random random = Random();
  //0-4
  return random.nextInt(5) + 1; //1-5
}

int chancedice() {
  Random random = Random();
  //0-5
  return random.nextInt(6) + 1; //1-6
}

String condition() {
  if (num1 == num2 && num2 == num3) return 'Winner (: $num1';
  return 'Loser ):';
}
