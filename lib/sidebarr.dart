import 'package:custom_navbar/sidebar.dart';
import 'package:flutter/material.dart';

import 'Pages.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  double heightOfContainer = 50;
  double bottomPosition = 50;
  final pages = [
    const Page1(),
    const Page2(),
    const Page3(),
    const Page4(),
    const Page5(),
    const Page6(),
  ];


  @override
  Widget build(BuildContext context) {
    List<NavigationRailDestination> destinations = [
       NavigationRailDestination(
        selectedIcon: SelectedSemiCircle(
          text: '', heightOfContainer: heightOfContainer, bottomPosition: bottomPosition ,
        ),
        icon: Icon(null),
        label: RotatedBox(
            quarterTurns: 3,
            child: Text(
              'Home',
              textAlign: TextAlign.center,
            )),
      ),

       NavigationRailDestination(
          selectedIcon: SelectedSemiCircle(
            text: '',
            heightOfContainer: heightOfContainer, bottomPosition: bottomPosition,
          ),
          icon: Icon(null),
          label: const RotatedBox(
              quarterTurns: 3,
              child: Text(
                'Favorite',
                textAlign: TextAlign.center,
              ))),
      NavigationRailDestination(
          selectedIcon: SelectedSemiCircle(
            text: '',
            heightOfContainer: heightOfContainer, bottomPosition: bottomPosition,
          ),
          icon: Icon(null),
          label: RotatedBox(quarterTurns: 3, child: Text('Settings'))),
       NavigationRailDestination(
          selectedIcon: SelectedSemiCircle(
            text: '',
            heightOfContainer: heightOfContainer, bottomPosition: bottomPosition,
          ),
          icon: Icon(null),
          label: RotatedBox(quarterTurns: 3, child: Text('Feedback'))),
       NavigationRailDestination(
          selectedIcon: SelectedSemiCircle(
            text: '',
            heightOfContainer: heightOfContainer, bottomPosition: bottomPosition,
          ),
          icon: Icon(null),
          label: RotatedBox(quarterTurns: 3, child: Text('FaceBook'))),
      NavigationRailDestination(
          selectedIcon: SelectedSemiCircle(
            text: '',
            heightOfContainer: heightOfContainer, bottomPosition: bottomPosition,
          ),
          icon: Icon(null),
          label: RotatedBox(quarterTurns: 3, child: Text('Popular'))),

    ];
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          NavigationRail(
            backgroundColor: Colors.deepOrange,
            labelType: NavigationRailLabelType.all,
            minWidth: MediaQuery.of(context).size.width*0.09,
            selectedLabelTextStyle: const TextStyle(
                fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
            unselectedLabelTextStyle: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),


            destinations: destinations,
            selectedIndex: _selectedIndex,
            onDestinationSelected: (currentIndex) {
              setState(() {
                _selectedIndex = currentIndex;
                if(_selectedIndex == 0){
                  heightOfContainer = 55;
                  bottomPosition=50;
                } else if (_selectedIndex == 1) {
                  heightOfContainer= 70;
                  bottomPosition= 68;
                } else if (_selectedIndex == 2) {
                  heightOfContainer= 70;
                  bottomPosition= 68;
                } else if (_selectedIndex == 3) {
                  heightOfContainer= 80;
                  bottomPosition = 78;
                } else if (_selectedIndex == 4) {
                  heightOfContainer= 90;
                  bottomPosition= 83;
                }else if (_selectedIndex == 5) {
                  heightOfContainer= 70;
                  bottomPosition= 65;
                }
              });
            },
          ),

          Container(
              width: MediaQuery.of(context).size.width*0.8,
              child: Center(child: pages[_selectedIndex])
          ),
        ],
      ),
    );
  }
}

class SelectedSemiCircle extends StatelessWidget {
  const SelectedSemiCircle({Key? key, required this.text, required this.heightOfContainer, required this.bottomPosition}) : super(key: key);
  final String text;
  final double heightOfContainer;
  final double bottomPosition;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          right: -30,
          bottom: -bottomPosition,
          child: Container(
            height: heightOfContainer,
            width: heightOfContainer/2.3,
            decoration: const BoxDecoration(
              color: Colors.deepOrange,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(120),
                bottomRight: Radius.circular(120),
              ),
            ),
            child: Align(
              alignment: Alignment.center,
              child: Container(
                height: 4,
                width: 4,
                constraints: const BoxConstraints(maxHeight: 8, maxWidth: 8),
                decoration: const BoxDecoration(
                    color: Colors.white, shape: BoxShape.circle),
              ),
            ),
          ),
        ),
        RotatedBox(
            quarterTurns: 3,
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            )),

      ],
    );
  }
}
