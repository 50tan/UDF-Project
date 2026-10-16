import 'package:flutter/material.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const CalculatorScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  // Variables to store calculator state
  String display = '0';
  double firstNumber = 0;
  double secondNumber = 0;
  String operation = '';
  bool shouldResetDisplay = false;

  // Button press handler
  void onNumberPressed(String number) {
    setState(() {
      if (shouldResetDisplay) {
        display = number;
        shouldResetDisplay = false;
      } else {
        display = display == '0' ? number : display + number;
      }
    });
  }

  // Decimal point handler
  void onDecimalPressed() {
    setState(() {
      if (!display.contains('.')) {
        display = '$display.';
      }
    });
  }

  // Operation button handler
  void onOperationPressed(String op) {
    setState(() {
      firstNumber = double.parse(display);
      operation = op;
      shouldResetDisplay = true;
    });
  }

  // Equals button handler - performs calculation
  void onEqualsPressed() {
    setState(() {
      if (operation.isEmpty) return;

      secondNumber = double.parse(display);
      double result = 0;

      // Conditional logic to determine which operation to perform
      if (operation == '+') {
        result = firstNumber + secondNumber;
      } else if (operation == '−') {
        result = firstNumber - secondNumber;
      } else if (operation == '×') {
        result = firstNumber * secondNumber;
      } else if (operation == '÷') {
        // Error handling for division by zero
        if (secondNumber == 0) {
          display = 'Error: Div by 0';
          operation = '';
          shouldResetDisplay = true;
          return;
        }
        result = firstNumber / secondNumber;
      }

      // Display result
      display = result.toString();
      operation = '';
      shouldResetDisplay = true;
    });
  }

  // Clear button handler - resets calculator
  void onClearPressed() {
    setState(() {
      display = '0';
      firstNumber = 0;
      secondNumber = 0;
      operation = '';
      shouldResetDisplay = false;
    });
  }

  // Build calculator button widget
  Widget buildButton(
    String label,
    VoidCallback onPressed, {
    Color backgroundColor = Colors.blue,
    Color textColor = Colors.white,
    double fontSize = 24,
    bool isWide = false,
  }) {
    return Expanded(
      flex: isWide ? 2 : 1,
      child: Container(
        margin: const EdgeInsets.all(4),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            foregroundColor: textColor,
            padding: const EdgeInsets.symmetric(vertical: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: onPressed,
          child: Text(
            label,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Calculator'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        color: Colors.grey[100],
        child: Column(
          children: [
            // Display area
            Container(
              padding: const EdgeInsets.all(24),
              width: double.infinity,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    display,
                    style: const TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    operation.isEmpty ? 'Ready' : 'Operation: $operation',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Button grid
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  children: [
                    // Row 1: AC, Delete, /, ×
                    Row(
                      children: [
                        buildButton(
                          'AC',
                          onClearPressed,
                          backgroundColor: Colors.red,
                          fontSize: 20,
                        ),
                        buildButton(
                          '⌫',
                          () {
                            setState(() {
                              if (display.length > 1) {
                                display = display.substring(0, display.length - 1);
                              } else {
                                display = '0';
                              }
                            });
                          },
                          backgroundColor: Colors.orange,
                          fontSize: 20,
                        ),
                        buildButton(
                          '÷',
                          () => onOperationPressed('÷'),
                          backgroundColor: Colors.blue[700]!,
                        ),
                        buildButton(
                          '×',
                          () => onOperationPressed('×'),
                          backgroundColor: Colors.blue[700]!,
                        ),
                      ],
                    ),

                    // Row 2: 7, 8, 9, −
                    Row(
                      children: [
                        buildButton(
                          '7',
                          () => onNumberPressed('7'),
                          backgroundColor: Colors.grey[700]!,
                        ),
                        buildButton(
                          '8',
                          () => onNumberPressed('8'),
                          backgroundColor: Colors.grey[700]!,
                        ),
                        buildButton(
                          '9',
                          () => onNumberPressed('9'),
                          backgroundColor: Colors.grey[700]!,
                        ),
                        buildButton(
                          '−',
                          () => onOperationPressed('−'),
                          backgroundColor: Colors.blue[700]!,
                        ),
                      ],
                    ),

                    // Row 3: 4, 5, 6, +
                    Row(
                      children: [
                        buildButton(
                          '4',
                          () => onNumberPressed('4'),
                          backgroundColor: Colors.grey[700]!,
                        ),
                        buildButton(
                          '5',
                          () => onNumberPressed('5'),
                          backgroundColor: Colors.grey[700]!,
                        ),
                        buildButton(
                          '6',
                          () => onNumberPressed('6'),
                          backgroundColor: Colors.grey[700]!,
                        ),
                        buildButton(
                          '+',
                          () => onOperationPressed('+'),
                          backgroundColor: Colors.blue[700]!,
                        ),
                      ],
                    ),

                    // Row 4: 1, 2, 3, =
                    Row(
                      children: [
                        buildButton(
                          '1',
                          () => onNumberPressed('1'),
                          backgroundColor: Colors.grey[700]!,
                        ),
                        buildButton(
                          '2',
                          () => onNumberPressed('2'),
                          backgroundColor: Colors.grey[700]!,
                        ),
                        buildButton(
                          '3',
                          () => onNumberPressed('3'),
                          backgroundColor: Colors.grey[700]!,
                        ),
                        buildButton(
                          '=',
                          onEqualsPressed,
                          backgroundColor: Colors.green,
                          fontSize: 28,
                        ),
                      ],
                    ),

                    // Row 5: 0, ., Special
                    Row(
                      children: [
                        buildButton(
                          '0',
                          () => onNumberPressed('0'),
                          backgroundColor: Colors.grey[700]!,
                          isWide: true,
                        ),
                        buildButton(
                          '.',
                          onDecimalPressed,
                          backgroundColor: Colors.grey[700]!,
                        ),
                        buildButton(
                          '%',
                          () {
                            setState(() {
                              double value = double.parse(display);
                              display = (value / 100).toString();
                            });
                          },
                          backgroundColor: Colors.blue[700]!,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
