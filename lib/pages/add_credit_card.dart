import 'package:flutter/material.dart';
import 'package:telcell_copy/widgets/balance_visibility.dart';
import '../widgets/db.dart';

class AddCard extends StatefulWidget {
  const AddCard({super.key});
  @override
  State<AddCard> createState() {
    return AddCardState();
  }
}

class AddCardState extends State<AddCard> {
  ////////////////////////////////////////
  final _formKey = GlobalKey<FormState>();
  bool _isActive = false; // for submit button toggle
  final FocusNode _focusNode = FocusNode();
  ////////////////////////////////////////
  //function luhnAlgorithm
  bool luhnAlgorithm(String cardNumber) {
    List<int> digits = cardNumber
        .split('')
        .map(int.parse)
        .toList(); // convert the card number to a list of numbers

    int checksum = 0;
    bool isSecondDigit =
        false; // flag indicating are the current digit is the second

    for (int i = digits.length - 1; i >= 0; i--) {
      int digit = digits[i];

      if (isSecondDigit) {
        digit *= 2;
        if (digit > 9) {
          digit -= 9;
        }
      }
      checksum += digit;
      isSecondDigit = !isSecondDigit;
    }
    return (checksum % 10 ==
        0); // valid card number if the checksum is a multiple of 10
  }

  //final card
  final cardNumberController = TextEditingController();
  final nameController = TextEditingController();
  final expirationDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(238, 111, 50, 1),
        title: const BalanceVisibility(),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: const Color.fromRGBO(240, 242, 244, 1),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                width: MediaQuery.of(context).size.width,
                height: 55,
                child: const Text(
                  'Bank Card',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(176, 190, 198, 1),
                  ),
                ),
              ),
              // Credit Card Form
              Form(
                /////////////
                key: _formKey,
                /////////////
                //for submit button activation/deactivation
                onChanged: () {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      _isActive = true;
                      _focusNode.unfocus();
                    });
                  } else if (_isActive =
                      true && !_formKey.currentState!.validate()) {
                    _isActive = false;
                  }
                },

                autovalidateMode: AutovalidateMode.always,
                child: Container(
                  width: MediaQuery.of(context).size.width - 20,
                  height: MediaQuery.of(context).size.height / 2.1,
                  color: Colors.white,
                  child: Column(
                    children: [
                      //card Number field
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                          controller: cardNumberController,
                          cursorColor: Colors.grey,
                          decoration: const InputDecoration(
                            labelText: 'Card Number',
                            labelStyle: TextStyle(
                              fontSize: 20,
                              color: Color.fromRGBO(176, 190, 198, 1),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          //////////////////////////////////////////////////
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Type Card Number';
                            } else if (value.length < 16 || value.length > 16) {
                              return 'Card number must contain 16 digits';
                            } else {
                              if (!luhnAlgorithm(value.toString())) {
                                return 'Invalid Card';
                              }
                            }
                            return null;
                          },
                          ////////////////////////////////////////////////
                        ),
                      ),

                      // cardholder name surname field
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                          controller: nameController,
                          cursorColor: Colors.grey,
                          decoration: const InputDecoration(
                            labelText: 'Name and Surname',
                            labelStyle: TextStyle(
                              fontSize: 20,
                              color: Color.fromRGBO(176, 190, 198, 1),
                            ),
                          ),
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name and surname';
                            } else if (!RegExp(r'^[a-zA-Z]+\s[a-zA-Z]+$')
                                .hasMatch(value)) {
                              return 'Please enter a valid name and surname';
                            }
                            return null;
                          },
                        ),
                      ),

                      // Expiration Date field
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                          focusNode: _focusNode,
                          controller: expirationDateController,
                          cursorColor: Colors.grey,
                          decoration: const InputDecoration(
                            labelText: 'Expiration date',
                            hintText: 'YYYY/MM',
                            labelStyle: TextStyle(
                              fontSize: 20,
                              color: Color.fromRGBO(176, 190, 198, 1),
                            ),
                          ),
                          keyboardType: TextInputType.datetime,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter card expiration date';
                            } else if (value.length < 7 || value.length > 7) {
                              return 'Wrong format of date';
                            } else if (!RegExp(r'^\d{4}/\d{2}$')
                                .hasMatch(value)) {
                              return 'Please enter a valid date format (YYYY/MM) and make sure the card is valid for less than 10 years';
                            } else if (int.parse(value.split('/')[1]) > 12) {
                              return 'Please enter a valid month between 01 and 12';
                            } else if (int.parse(value.split('/')[0]) < 2023) {
                              return 'Card has expired';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(15),
                width: MediaQuery.of(context).size.width,
                height: 55,
                child: const Text(
                  'ATTENTION',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(15),
                width: MediaQuery.of(context).size.width,
                height: 110,
                child: const Text(
                  'There is a 1.5% commission if you\r\n replenish or make payments with cards of \r\n VTB (Armenia)',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    DatabaseHelper.instance.insertDataToDatabase(
                        id: DateTime.now().toString(), //Unique Id
                        cardNumber: int.tryParse(cardNumberController.text)!,
                        cardHolder: nameController.text,
                        expirationDate: int.tryParse(expirationDateController
                            .text
                            .replaceAll('/', ''))!);
                    Navigator.pop(context, 'Route');
                  } else {
                    null;
                  }
                },
                //Button Style
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.37,
                    vertical: MediaQuery.of(context).size.height * 0.015,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                  backgroundColor: _isActive == true
                      ? const Color.fromRGBO(238, 111, 50, 1)
                      : const Color.fromARGB(255, 124, 124, 124),
                ),
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
