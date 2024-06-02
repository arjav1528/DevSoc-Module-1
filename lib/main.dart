
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  runApp( const MaterialApp(
    home: Calculator(),
  ));
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}
class Calculator extends StatefulWidget {
  const Calculator({super.key});
  @override
  State<Calculator> createState() => _CalculatorState();
}
class _CalculatorState extends State<Calculator> {
  final TextEditingController firstController  = TextEditingController();
  final TextEditingController secondController  = TextEditingController();
  double result = 0;
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title:  const Text('Welcome to the Calculator'),
          backgroundColor: Colors.grey[600],
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 15, 8, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: firstController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50)
                      ),
                      hintText: 'First Number'
          
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    FilteringTextInputFormatter.digitsOnly
                  ],
                ),
                const SizedBox(height: 30),
                TextField(
                  controller: secondController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50)
                      ),
                      hintText: 'Second Number'
          
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    FilteringTextInputFormatter.digitsOnly
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () {
                        double n1 = double.parse(firstController.text);
                        double n2 = double.parse(secondController.text);
                        setState(() {
                          result = n1 + n2 ;
                          isVisible = !(isVisible);
          
                        });
                      },
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(Colors.grey[700]),
                        shape: WidgetStateProperty.all(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)
                            )
                        ),
                      ),
                      child: const Text('   +   ',
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white
                        ),),
                    ),
                    const SizedBox(width: 2),
                    TextButton(
                      onPressed: () {
                        double n1 = double.parse(firstController.text);
                        double n2 = double.parse(secondController.text);
                        setState(() {
                          result = n1 - n2 ;
                          isVisible = !(isVisible);
          
                        });
                      },
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(Colors.grey[700]),
                        shape: WidgetStateProperty.all(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)
                            )
                        ),
                      ),
                      child: const Text('   -   ',
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white
                        ),),
                    ),
                    const SizedBox(width: 2),
                    TextButton(
                      onPressed: () {
                        double n1 = double.parse(firstController.text);
                        double n2 = double.parse(secondController.text);
                        setState(() {
                          result = n1 * n2 ;
                          isVisible = !(isVisible);
                        });
                      },
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(Colors.grey[700]),
                        shape: WidgetStateProperty.all(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)
                            )
                        ),
                      ),
                      child: const Text('   x   ',
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white
                        ),),
                    ),
                    const SizedBox(width: 2),
                    TextButton(
                      onPressed: () {
                        double n1 = double.parse(firstController.text);
                        double n2 = double.parse(secondController.text);
                        setState(() {
                          result = n1 / n2 ;
                          isVisible = !(isVisible);
                        });
                      },
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(Colors.grey[700]),
                        shape: WidgetStateProperty.all(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)
                            )
                        ),
                      ),
                      child: const Text('   /   ',
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white
                        ),),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Center(
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        isVisible = !(isVisible);
                      });
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.grey[700]),
                      shape: WidgetStateProperty.all(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)
                          )
                      ),
                    ),
                    child: const Text('   =   ',
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white
                      ),),
                  ),
                ),
          
                const SizedBox(height: 40),
                Center(
                  child: Visibility(
                    visible: isVisible,
                    maintainAnimation: true,
                    maintainSize: true,
                    maintainState: true,
                    child: Text('$result',
                      style: const TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold
                      ),),
                  ),
                )
              ],
            ),
          ),
        )

    );
  }
}
