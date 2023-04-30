import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'Pages.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({Key? key}) : super(key: key);

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  int pageIndex = 0;

  final pages = [
    const BottomPage1(),
    const Page2(),
    const Page3(),
    const Page4(),
    const Page5(),
    const Page6(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width*0.17,
                color: Colors.black,
                child: Stack(
                  fit: StackFit.expand,
                  clipBehavior: Clip.none,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width*0.13,
                          color: Colors.blueGrey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(Icons.list_sharp, color: Colors.white.withOpacity(0.8)),
                              Icon(Icons.search_outlined,color: Colors.white.withOpacity(0.8)),
                             tabbarwidget(0, "Rum"),
                             tabbarwidget(1, "Vodka"),
                             tabbarwidget(2, "Whiskey"),
                             tabbarwidget(3, "Brandy"),
                             tabbarwidget(4, "Wine"),
                             tabbarwidget(5, "Beer"),

                              // RotatedBox(
                              //     quarterTurns: 3,
                              //     child: Text("Rum", style: TextStyle(color: Colors.white.withOpacity(0.8)), )),
                              // RotatedBox(
                              //   quarterTurns: 3,
                              //     child: Text("Vodka", style: TextStyle(color: Colors.white.withOpacity(0.8)), )),
                              // RotatedBox(
                              //     quarterTurns: 3,
                              //     child: Text("Whiskey", style: TextStyle(color: Colors.white.withOpacity(0.8)), )),
                              // RotatedBox(
                              //     quarterTurns: 3,
                              //     child: Text("Brandy", style: TextStyle(color: Colors.white.withOpacity(0.8)), )),
                              // RotatedBox(
                              //     quarterTurns: 3,
                              //     child: Text("Wine", style: TextStyle(color: Colors.white.withOpacity(0.8)), )),
                              // RotatedBox(
                              //     quarterTurns: 3,
                              //     child: Text("Beer", style: TextStyle(color: Colors.white.withOpacity(0.8)), )),
                              Icon(Icons.filter_list_sharp, color: Colors.white.withOpacity(0.8)),
                              Icon(Icons.location_on_outlined,color: Colors.white.withOpacity(0.8)),
                            ],
                          ),
                        ),

                        Center(child: Icon(Icons.circle, size: 5, color: Colors.white,))
                      ],
                    ),
                  ],
                ),
              ),

              Container(
                width: MediaQuery.of(context).size.width*0.8,
               // color:Colors.red,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    pages[pageIndex],
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

 Widget tabbarwidget(int index, String text){
    return GestureDetector(
      onTap: (){
        setState(() {
          pageIndex = index;
        });
      },
      child: Container(
        height: 80,
        decoration: index == pageIndex ? BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.only(topRight: Radius.circular(100),
          bottomRight: Radius.circular(100))
        ): BoxDecoration(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RotatedBox(
                quarterTurns: 3,
                child: Center(
                  child: Text(text,
                    style: TextStyle(color: index == pageIndex? Colors.white : Colors.white.withOpacity(0.6)),
                  ),
                ),
            ),
            if(index == pageIndex)
              Center(child: Icon(Icons.circle, size: 5, color: Colors.white,))
          ],
        ),
      ),
    );
  }

}

