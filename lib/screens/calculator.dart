import 'package:flutter/material.dart';

import '../styles/styles.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String? value1 = "";
  String methodType = "";
  String calculatorDisplay = "Please Subscribe to PikiDelivery";
  String? value2 = "";
  bool isOn = true;
  var value1array = [];
  var value2array = [];
  bool isResult = false;
  double totalValues = 0;

  addingNumberToDisplay({required value, required type}) {
    switch (type) {
      case "function":
        if (value == 'on') {
          setState(() {
            isOn = !isOn;
          });
        } else {
          setState(() {
            value1array = [];
            value2array = [];
            value1 = "";
            value2 = "0";
            isResult = false;
            totalValues = 0;
            methodType = "";
            calculatorDisplay = "0";
          });
        }
        break;
      case "button":
        if (methodType.toString() != "") {
          setState(() {
            value1array.add(value);
            value2 = value1array.join("").toString();
          });
        } else {
          setState(() {
            value2array.add(value);
            value1 = value2array.join("").toString();
          });
        }
        break;
      case "method":
        setState(() {
          methodType = value;
        });
        break;
      case "result":
        setState(() {
          isResult = true;
        });
        if (methodType == "/") {
          setState(() {
            totalValues = double.parse(value1.toString()) /
                double.parse(value2.toString());
          });
        } else if (methodType == "x") {
          setState(() {
            totalValues = double.parse(value1.toString()) *
                double.parse(value2.toString());
          });
        } else if (methodType == "+") {
          setState(() {
            totalValues = double.parse(value1.toString()) +
                double.parse(value2.toString());
          });
        } else if (methodType == "-") {
          setState(() {
            totalValues = double.parse(value1.toString()) -
                double.parse(value2.toString());
          });
        }

        setState(() {
          methodType = value;
          calculatorDisplay = totalValues.toString();
        });
        break;
    }
    setState(() {
      if (isResult) {
        calculatorDisplay = '$totalValues';
      } else {
        calculatorDisplay = '$value1 $methodType $value2';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: getBody(size: size),
    );
  }

  Widget getBody({required size}) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: MediaQuery.of(context).size.height / 1.2,
                width: size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 3, color: Colors.black)),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: size.width / 1.3,
                          height: 70,
                          decoration: const BoxDecoration(color: Colors.grey),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                isOn
                                    ? Text(
                                        calculatorDisplay.toString(),
                                        style: calculatordisplay,
                                      )
                                    : const Text(''),
                              ]),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                              onTap: () {
                                addingNumberToDisplay(
                                    type: 'function', value: 'cancel');
                              },
                              child: calculatorBtn(
                                  text: "C", type: "button", width: 70)),
                          const SizedBox(
                            width: 10,
                          ),
                          // InkWell(
                          //   onTap: addingNumberToDisplay(
                          //       type: 'value', value: 'On'),
                          InkWell(
                            onTap: () {
                              addingNumberToDisplay(
                                  type: 'function', value: 'on');
                            },
                            child: calculatorBtn(
                              text: "On / Off",
                              width: 90,
                              type: "button",
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              addingNumberToDisplay(type: 'button', value: '7');
                            },
                            child: calculatorBtn(
                              text: "7",
                              type: "button",
                              width: 70,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {
                              addingNumberToDisplay(type: 'button', value: '8');
                            },
                            child: calculatorBtn(
                              text: "8",
                              width: 70,
                              type: "button",
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {
                              addingNumberToDisplay(type: 'button', value: '9');
                            },
                            child: calculatorBtn(
                              text: "9",
                              width: 70,
                              type: "button",
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {
                              addingNumberToDisplay(type: 'method', value: '/');
                            },
                            child: calculatorBtn(
                              text: "/",
                              width: 70,
                              type: "divide",
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              addingNumberToDisplay(type: 'button', value: '4');
                            },
                            child: calculatorBtn(
                              text: "4",
                              type: "button",
                              width: 70,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {
                              addingNumberToDisplay(type: 'button', value: '5');
                            },
                            child: calculatorBtn(
                              text: "5",
                              width: 70,
                              type: "button",
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {
                              addingNumberToDisplay(type: 'button', value: '6');
                            },
                            child: calculatorBtn(
                              text: "6",
                              width: 70,
                              type: "button",
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {
                              addingNumberToDisplay(type: 'method', value: 'x');
                            },
                            child: calculatorBtn(
                              text: "X",
                              width: 70,
                              type: "multiply",
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              addingNumberToDisplay(type: 'button', value: '1');
                            },
                            child: calculatorBtn(
                              text: "1",
                              type: "button",
                              width: 70,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {
                              addingNumberToDisplay(type: 'button', value: '2');
                            },
                            child: calculatorBtn(
                              text: "2",
                              width: 70,
                              type: "button",
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {
                              addingNumberToDisplay(type: 'button', value: '3');
                            },
                            child: calculatorBtn(
                              text: "3",
                              width: 70,
                              type: "button",
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {
                              addingNumberToDisplay(type: 'method', value: '+');
                            },
                            child: calculatorBtn(
                              text: "+",
                              width: 70,
                              type: "add",
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              addingNumberToDisplay(type: 'button', value: '0');
                            },
                            child: calculatorBtn(
                              text: "0",
                              type: "button",
                              width: 70,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {
                              addingNumberToDisplay(type: 'button', value: '.');
                            },
                            child: calculatorBtn(
                              text: ".",
                              width: 70,
                              type: "value",
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {
                              addingNumberToDisplay(
                                  type: 'result', value: 'Show Results');
                            },
                            child: calculatorBtn(
                              text: "=",
                              width: 70,
                              type: "result",
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {
                              addingNumberToDisplay(type: 'method', value: '-');
                            },
                            child: calculatorBtn(
                              text: "-",
                              width: 70,
                              type: "subtract",
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Center(
                      child: Text(
                          'Thank you Guys For Watching Please Subscribe yours friend Gene Piki!!!!!!!!!'),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget calculatorBtn(
      {required String text, required String type, required double width}) {
    return Container(
      height: 35,
      width: width,
      decoration:
          BoxDecoration(border: Border.all(width: 5, color: Colors.black)),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              text,
              style: calculatorButtonsStyle,
            ),
          ),
        ],
      ),
    );
  }
}
