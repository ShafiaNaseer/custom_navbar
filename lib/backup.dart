import 'package:custom_navbar/sidebar.dart';
import 'package:flutter/material.dart';

import 'Pages.dart';


class sidebarBackup extends StatefulWidget {
  const sidebarBackup({super.key});

  @override
  State<sidebarBackup> createState() => _sidebarBackupState();
}

class _sidebarBackupState extends State<sidebarBackup> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> offset;

  int _selectedIndex = 0;
  double lengthOfText = 50;
  final pages = [
    const Page1(),
    const Page2(),
    const Page3(),
    const Page4(),
    const Page5(),
    const Page6(),
  ];
  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    offset = Tween<Offset>(begin: Offset(0.0, 1.0), end: Offset.zero )
        .animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    List<NavigationRailDestination> destinations = [
      NavigationRailDestination(
        selectedIcon: SelectedSemiCircle(
          text: '', lengthOfText: 60, offset: offset ,
        ),
        icon: Icon(null),
        label: RotatedBox(
            quarterTurns: 3,
            child: Text(
              'Rum',
              textAlign: TextAlign.center,
            )),
      ),

      NavigationRailDestination(
          selectedIcon: SelectedSemiCircle(
            text: '',
            lengthOfText: lengthOfText, offset: offset,
          ),
          icon: Icon(null),
          label: RotatedBox(
              quarterTurns: 3,
              child: Text(
                'Vodka',
                textAlign: TextAlign.center,
              ))),
      NavigationRailDestination(
          selectedIcon: SelectedSemiCircle(
            text: '',
            lengthOfText: lengthOfText, offset: offset,
          ),
          icon: Icon(null),
          label: RotatedBox(quarterTurns: 3, child: Text('Wiskey'))),
       NavigationRailDestination(
          selectedIcon: SelectedSemiCircle(
            text: '',
            lengthOfText: 60, offset: offset,
          ),
          icon: Icon(null),
          label: RotatedBox(quarterTurns: 3, child: Text('Brandy'))),
       NavigationRailDestination(
          selectedIcon: SelectedSemiCircle(
            text: '',
            lengthOfText: 60, offset: offset,
          ),
          icon: Icon(null),
          label: RotatedBox(quarterTurns: 3, child: Text('Wine'))),
      NavigationRailDestination(
          selectedIcon: SelectedSemiCircle(
            text: '',
            lengthOfText: 50, offset: offset,
          ),
          icon: SizedBox.shrink(),
          label: RotatedBox(quarterTurns: 3, child: Text('Beer'))),

    ];
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          NavigationRail(
            backgroundColor: Color(0xff424242),
            labelType: NavigationRailLabelType.all,
            minWidth: MediaQuery.of(context).size.width*0.09,
            selectedLabelTextStyle: const TextStyle(
                fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
            unselectedLabelTextStyle: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
            leading: Column(
              children: [
                IconButton(
                  icon: const Icon(Icons.menu_outlined, color:Colors.grey ,),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.search, color:Colors.grey),
                  onPressed: () {},
                ),
              ],
            ),
            trailing: IconButton(
              icon: const Icon(Icons.location_on_outlined, color:Colors.grey ,),
              onPressed: () {},
            ),
            // labelType: NavigationRailLabelType.all,
            destinations: destinations,
            selectedIndex: _selectedIndex,
            onDestinationSelected: (currentIndex) {
              setState(() {
                _selectedIndex = currentIndex;
                lengthOfText = 70;
                switch (controller.status) {
                  case AnimationStatus.completed:
                    controller.reverse();
                    break;
                  case AnimationStatus.dismissed:
                    controller.forward();
                    break;
                  default:
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
   SelectedSemiCircle({Key? key, required this.text, required this.lengthOfText, required this.offset}) : super(key: key);
  final String text;
  final double lengthOfText;
  Animation<Offset> offset;
  
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
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
        Positioned(
          right: -30,
          bottom: -60,
          child: Container(
            height: lengthOfText,
            width: lengthOfText/2,
            decoration: const BoxDecoration(
              color: Color(0xff424242),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(120),
                bottomRight: Radius.circular(120),
              ),
            ),
            child: Align(
              alignment: Alignment.center,
              child: SlideTransition(
               // position: offset,
                position: offset,
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
        )
      ],
    );
  }
}
