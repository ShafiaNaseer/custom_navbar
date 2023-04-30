import 'package:custom_navbar/sidebar.dart';
import 'package:flutter/material.dart';
import 'Pages.dart';
import 'package:animated_widgets/animated_widgets.dart';

import 'SemiCircle.dart';

class PageTransition extends StatefulWidget {
  const PageTransition({super.key});

  @override
  State<PageTransition> createState() => _PageTransitionState();
}

class _PageTransitionState extends State<PageTransition>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  bool enabled = true;
  double lengthOfText = 50;
  final pages = [
    const Page1(),
    const Page2(),
    const Page3(),
    const Page4(),
    const Page5(),
    const Page6(),
    // ];
    // final bottompages = [
    const BottomPage1(),
    const BottomPage2(),
    const BottomPage3(),
    const BottomPage4(),
  ];
  @override
  Widget build(BuildContext context) {
    List<NavigationRailDestination> destinations = [
      NavigationRailDestination(
        selectedIcon: SelectedSemiCircle(
          text: '',
          lengthOfText: 50,
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
            lengthOfText: 60,
          ),
          icon: Icon(null),
          label: RotatedBox(
              quarterTurns: 3,
              child: Text(
                'Home',
                textAlign: TextAlign.center,
              ))),
      NavigationRailDestination(
          selectedIcon: SelectedSemiCircle(
            text: '',
            lengthOfText: 57,
          ),
          icon: Icon(null),
          label: RotatedBox(quarterTurns: 3, child: Text('Home'))),
      NavigationRailDestination(
          selectedIcon: SelectedSemiCircle(
            text: '',
            lengthOfText: 60,
          ),
          icon: Icon(null),
          label: RotatedBox(quarterTurns: 3, child: Text('Home'))),
      NavigationRailDestination(
          selectedIcon: SelectedSemiCircle(
            text: '',
            lengthOfText: 48,
          ),
          icon: Icon(null),
          label: RotatedBox(quarterTurns: 3, child: Text('Home'))),
      NavigationRailDestination(
          selectedIcon: SelectedSemiCircle(
            text: '',
            lengthOfText: 50,
          ),
          icon: SizedBox.shrink(),
          label: RotatedBox(quarterTurns: 3, child: Text('Home'))),
    ];
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          NavigationRail(
            backgroundColor: Colors.deepOrange,
            labelType: NavigationRailLabelType.all,
            minWidth: MediaQuery.of(context).size.width * 0.09,
            selectedLabelTextStyle: const TextStyle(
                fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
            unselectedLabelTextStyle: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
            leading: Column(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.menu_outlined,
                    size: 20,
                    color: Colors.grey,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.search, size: 20, color: Colors.grey),
                  onPressed: () {},
                ),
              ],
            ),
            trailing: IconButton(
              icon: const Icon(
                Icons.location_on_outlined,
                color: Colors.grey,
              ),
              onPressed: () {},
            ),
            destinations: destinations,
            selectedIndex: _selectedIndex <6 ? _selectedIndex:null ,
            onDestinationSelected: (currentIndex) {
              setState(() {
                _selectedIndex = currentIndex;
                lengthOfText = 60;
              });
            },
          ),
          Container(
              width: MediaQuery.of(context).size.width * 0.82,
              child: Stack(
                children: [
                  TranslationAnimatedWidget.tween(
                      enabled: enabled,
                      translationDisabled: Offset(0, 10),
                      translationEnabled: Offset(0, 100),
                      child: pages[_selectedIndex]),

                  Positioned(
                    bottom: 0,
                    child: Row(
                      children: [
                        buildMyNavBar(6, Icons.home),
                        buildMyNavBar(7, Icons.search),
                        buildMyNavBar(8, Icons.favorite_border),
                        buildMyNavBar(9, Icons.access_time),
                      ],
                    ),
                  )
                ],
              )),
        ],
      ),

    );
  }

  Widget buildMyNavBar(int index, IconData icon) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width * 0.82 / 4,
        decoration: index == _selectedIndex
            ? BoxDecoration(
                color: Colors.white,
                // border: Border(
                //     bottom: BorderSide(width: 4, color: Theme.of(context).primaryColor)
                // )
              )
            : BoxDecoration(color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: index == _selectedIndex ? Colors.green : Colors.grey,
            ),
            if (index == _selectedIndex)
              Icon(
                Icons.circle,
                size: 5,
                color: index == _selectedIndex ? Colors.green : Colors.grey,
              ),
          ],
        ),
      ),
    );
  }
}
