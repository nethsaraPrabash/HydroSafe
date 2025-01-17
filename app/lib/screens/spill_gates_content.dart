import 'package:flutter/material.dart';

class SpillGatesContent extends StatefulWidget {
  const SpillGatesContent({super.key});

  @override
  State<SpillGatesContent> createState() => _SpillGatesContentState();
}

class _SpillGatesContentState extends State<SpillGatesContent> {
  bool spillGate1 = false;
  bool spillGate2 = false;

  void _onSpillgate1Opened(bool value) {
    setState(() {
      spillGate1 = value;
    });
  }

  // Method to handle the state change for Spill Gate 02
  void _onSpillGate2Opened(bool value) {
    setState(() {
      spillGate2 = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: boxData(
        spillGate1: spillGate1,
        spillGate2: spillGate2,
        onSpillGate1Opened: _onSpillgate1Opened,
        onSpillGate2Opened: _onSpillGate2Opened,
      ),
    );
  }
}

// boxData widget
Widget boxData({
  required bool spillGate1,
  required bool spillGate2,
  required ValueChanged<bool> onSpillGate1Opened,
  required ValueChanged<bool> onSpillGate2Opened,
}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            const Text(
              "Spill Gate 01",
              style: TextStyle(
                fontFamily: 'Poppins-SemiBold',
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            Switch(
              value: spillGate1,
              onChanged: onSpillGate1Opened,
            ),
          ],
        ),
      ),
      Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            const Text(
              "Spill Gate 02",
              style: TextStyle(
                fontFamily: 'Poppins-SemiBold',
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            Switch(
              value: spillGate2,
              onChanged: onSpillGate2Opened,
            ),
          ],
        ),
      ),
    ],
  );
}
