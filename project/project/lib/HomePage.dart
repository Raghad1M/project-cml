import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const NewWidget();
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    home: Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 18, 19, 102),
      ),  

      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
              },
              child: const Text('My Courses',),
            
          
            ),
             Container(//text
              width:500,
              height:50,
              color: const Color.fromARGB(255, 255, 255, 255),
              margin: const EdgeInsets.fromLTRB(10, 10, 200, 0),
              padding: const EdgeInsets.fromLTRB(1, 20, 0, 0),
              child:  const Text('Algorithms design'),
              
            ),
            Container(//img
              width:500 ,
              height: 200,
              color: const Color.fromARGB(255, 255, 255, 255),
              margin: const EdgeInsets.symmetric(vertical:0,horizontal:0),
              padding: const EdgeInsets.fromLTRB(1, 0, 0, 0),
              child: Image.asset('assets/images/course-img2.png',width:500,height:100,),
              
            ),

            Container(//text
              width:500,
              height:50,
              color: const Color.fromARGB(255, 255, 255, 255),
              margin: const EdgeInsets.fromLTRB(10, 20, 200, 0),
              padding: const EdgeInsets.fromLTRB(1, 30, 0, 0),
              child:  const Text('Web development'),
              
            ),
            Container(//img
              width:500 ,
              height: 200,
              color: const Color.fromARGB(255, 255, 255, 255),
               margin: const EdgeInsets.fromLTRB(5, 0, 20, 0),
              padding: const EdgeInsets.fromLTRB(1, 0, 0, 20),
              child: Image.asset('assets/images/course-img3.png',width:500,height:100,),
            ),

            
            ElevatedButton(
              onPressed: () {
              
              },
              child: const Text('Available courses'),
            ),


             Container(//text
              width:500,
              height:50,
              color: const Color.fromARGB(255, 255, 255, 255),
              margin: const EdgeInsets.fromLTRB(10, 10, 200, 0),
              padding: const EdgeInsets.fromLTRB(1, 30, 0, 0),
              child:  const Text('Networks'),
              
            ),
            Container(//img
              width:500 ,
              height: 200,
              color: const Color.fromARGB(255, 255, 255, 255),
              margin: const EdgeInsets.symmetric(vertical:5,horizontal:0),
              padding: const EdgeInsets.fromLTRB(1, 0, 0, 70),
              child: Image.asset('images/tt.jpeg',width:500,height:100,),
            ),

             Container(//text
              width:500,
              height:50,
              color: const Color.fromARGB(255, 255, 255, 255),
              margin: const EdgeInsets.fromLTRB(10, 20, 200, 0),
              padding: const EdgeInsets.fromLTRB(1, 30, 0, 0),
              child:  const Text('Software engineering'),
              
              
            ),
            Container(//img
              width:500 ,
              height: 200,
              color: const Color.fromARGB(255, 255, 255, 255),
              margin: const EdgeInsets.symmetric(vertical:0,horizontal:0),
              padding: const EdgeInsets.fromLTRB(1, 0, 0, 0),
              child: Image.asset('images/database.jpg',width:500,height:100,),
              
            ),

            Container(//text
              width:500,
              height:50,
              color: const Color.fromARGB(255, 255, 255, 255),
              margin: const EdgeInsets.fromLTRB(10, 20, 200, 0),
              padding: const EdgeInsets.fromLTRB(1, 30, 0, 0),
              child:  const Text('Data Base'),
              
            ),
            Container(//img
              width:500 ,
              height: 200,
              color: const Color.fromARGB(255, 255, 255, 255),
               margin: const EdgeInsets.fromLTRB(5, 0, 20, 0),
              padding: const EdgeInsets.fromLTRB(1, 0, 0, 20),
              child: Image.asset('images/net2.jpeg',width:500,height:100,),
            ),

            
          ],
        ),
      ),
    ),
    );
  }
}