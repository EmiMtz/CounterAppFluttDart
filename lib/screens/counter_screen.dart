

import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({ Key? key }) : super(key: key);

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {

  int counter = 0;

  void increase() {
    counter ++;
    setState(() {});
  }

  void decrease() {
    counter --;
    setState(() {});
  }
  
  void reset() {
    counter = 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    const fontSize30 = TextStyle(fontSize: 30);

    return Scaffold(
      appBar: AppBar(
        title: const Text("CounterScreen"),
        elevation: 10,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Contador de clicks", style: fontSize30,),
            Text("$counter", style: fontSize30,),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CustomFloatingActions(increaseFn: increase, decreaseFn: decrease, resetFn: reset),
    );
  } 
}

class CustomFloatingActions extends StatelessWidget {

  final Function increaseFn;
  final Function decreaseFn;
  final Function resetFn;

  const CustomFloatingActions({
    super.key, required this.increaseFn, required this.decreaseFn, required this.resetFn,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FloatingActionButton(
          onPressed: () => decreaseFn(),
          child: const Icon(Icons.exposure_minus_1_outlined),
          ),
        FloatingActionButton(
          onPressed: () => resetFn(),
          child: const Icon(Icons.restore_from_trash_outlined),
          ),
        FloatingActionButton(
          onPressed: () => increaseFn(),
          child: const Icon(Icons.exposure_plus_1_outlined),
          ),
      ],
    );
  }
}