
import 'package:custom_navbar/sidebarr.dart';
import 'package:flutter/material.dart';

import 'PageTransition.dart';
import 'backup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bottom NavBar Demo',
      theme: ThemeData(
        primaryColor: const Color(0xff2F8D46),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
      ),
      debugShowCheckedModeBanner: false,
      home: PageTransition(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;

  final bottompages = [
    const Page1(),
    const Page2(),
    const Page3(),
    const Page4(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffC4DFCB),
      appBar: AppBar(
        leading: Icon(
          Icons.menu,
          color: Theme.of(context).primaryColor,
        ),
        title: Text(
          "Custom Navigation Bar",
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: bottompages[pageIndex],
      bottomNavigationBar: Row(
        children: [
          buildMyNavBar(0, Icons.home),
          buildMyNavBar(1, Icons.search),
          buildMyNavBar(2, Icons.favorite_border),
          buildMyNavBar(3, Icons.access_time),
        ],
      )
    );
  }

  Widget buildMyNavBar(int index, IconData icon) {
    return GestureDetector(
      onTap: (){
        setState(() {
          pageIndex = index;
        });
      },
      child: Container(
              height: 60,
              width: MediaQuery.of(context).size.width / 4,
              decoration: index == pageIndex ? BoxDecoration(
                  color: Colors.white,
                  // border: Border(
                  //     bottom: BorderSide(width: 4, color: Theme.of(context).primaryColor)
                  // )
              ) : BoxDecoration(
                color: Colors.white
              ),
              child: Column( crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon, color: index== pageIndex ? Colors.green : Colors.grey ,),
                  if(index == pageIndex)
                  Icon(Icons.circle, size: 5,color: index==pageIndex ? Colors.green : Colors.grey,),

                ],
              ),
            ),
    );


          // IconButton(
          //   enableFeedback: false,
          //   onPressed: () {
          //     setState(() {
          //       pageIndex = 0;
          //     });
          //   },
          //   icon: pageIndex == 0
          //       ? const Icon(
          //     Icons.home_filled,
          //     color: Colors.white,
          //     size: 35,
          //   )
          //       : const Icon(
          //     Icons.home_outlined,
          //     color: Colors.white,
          //     size: 35,
          //   ),
          // ),
          // IconButton(
          //   enableFeedback: false,
          //   onPressed: () {
          //     setState(() {
          //       pageIndex = 1;
          //     });
          //   },
          //   icon: pageIndex == 1
          //       ? const Icon(
          //     Icons.work_rounded,
          //     color: Colors.white,
          //     size: 35,
          //   )
          //       : const Icon(
          //     Icons.work_outline_outlined,
          //     color: Colors.white,
          //     size: 35,
          //   ),
          // ),
          // IconButton(
          //   enableFeedback: false,
          //   onPressed: () {
          //     setState(() {
          //       pageIndex = 2;
          //     });
          //   },
          //   icon: pageIndex == 2
          //       ? const Icon(
          //     Icons.widgets_rounded,
          //     color: Colors.white,
          //     size: 35,
          //   )
          //       : const Icon(
          //     Icons.widgets_outlined,
          //     color: Colors.white,
          //     size: 35,
          //   ),
          // ),
          // IconButton(
          //   enableFeedback: false,
          //   onPressed: () {
          //     setState(() {
          //       pageIndex = 3;
          //     });
          //   },
          //   icon: pageIndex == 3
          //       ? const Icon(
          //     Icons.person,
          //     color: Colors.white,
          //     size: 35,
          //   )
          //       : const Icon(
          //     Icons.person_outline,
          //     color: Colors.white,
          //     size: 35,
          //   ),
          // ),


  }
}

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffC4DFCB),
      child: Center(
        child: Text(
          "Page Number 1",
          style: TextStyle(
            color: Colors.green[900],
            fontSize: 45,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffC4DFCB),
      child: Center(
        child: Text(
          "Page Number 2",
          style: TextStyle(
            color: Colors.green[900],
            fontSize: 45,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffC4DFCB),
      child: Center(
        child: Text(
          "Page Number 3",
          style: TextStyle(
            color: Colors.green[900],
            fontSize: 45,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class Page4 extends StatelessWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffC4DFCB),
      child: Center(
        child: Text(
          "Page Number 4",
          style: TextStyle(
            color: Colors.green[900],
            fontSize: 45,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
