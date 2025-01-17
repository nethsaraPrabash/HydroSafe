import 'package:app/screens/home_content.dart';
import 'package:app/screens/spill_gates_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Colors.white,
      body: loadContent(_selectedIndex),
      bottomNavigationBar: bottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}

AppBar appBar() {
  return AppBar(
    title: const Text(
      'HydroSafe',
      style: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
    backgroundColor: Colors.white,
    elevation: 0.0,
    centerTitle: true,
    leading: GestureDetector(
      onTap: () {
        debugPrint('Back button pressed');
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: const Color(0xffF7F8F8),
          borderRadius: BorderRadius.circular(10),
        ),
        child: SvgPicture.asset(
          'assets/icons/Arrow - Left 2.svg',
          height: 20,
          width: 20,
        ),
      ),
    ),
    actions: [
      GestureDetector(
        onTap: () {
          debugPrint('Action button pressed');
        },
        child: Container(
          margin: const EdgeInsets.all(10),
          alignment: Alignment.center,
          width: 37,
          decoration: BoxDecoration(
            color: const Color(0xffF7F8F8),
            borderRadius: BorderRadius.circular(10),
          ),
          child: SvgPicture.asset(
            'assets/icons/dots.svg',
            height: 5,
            width: 5,
          ),
        ),
      ),
    ],
  );
}

Widget bottomNavigationBar({
  required int selectedIndex,
  required ValueChanged<int> onItemTapped,
}) {
  return BottomNavigationBar(
    items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.door_back_door),
        label: 'Spill Gates',
      ),
    ],
    currentIndex: selectedIndex,
    selectedItemColor: Colors.amber[800],
    onTap: onItemTapped,
  );
}

Widget loadContent(int selectedIndex) {
  switch (selectedIndex) {
    case 0:
      return homeContent();
    case 1:
      return spillGatesContent();
    default:
      return const Center(
        child: Text(
          'Invalid Index',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      );
  }
}

Widget homeContent() {
  return const Center(
    child: HomeContent()
  );
}

Widget spillGatesContent() {
  return const Center(
    child: SpillGatesContent()
  );
}
