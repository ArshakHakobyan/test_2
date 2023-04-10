import 'package:flutter/material.dart';

enum CardTypes { mastrcard, visa }

enum CardColors { red, green, blue }

class CreditCards extends StatelessWidget {
  final CardTypes type;
  final String bankName;
  final int cardNumber;
  final int year;
  final int month;
  final String cardHolder;
  final CardColors color;

  const CreditCards({
    super.key,
    required this.type,
    required this.bankName,
    required this.cardNumber,
    required this.year,
    required this.month,
    required this.cardHolder,
    required this.color,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25, left: 10),
      child: Container(
          width: 280,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: color == CardColors.red
                  ? Colors.red
                  : color == CardColors.blue
                      ? const Color.fromRGBO(29, 147, 210, 1)
                      : const Color.fromRGBO(73, 146, 0, 1)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    bankName,
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Text(
                    type.toString().substring(10).toUpperCase(),
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(cardNumber.toString(),
                  style: const TextStyle(color: Colors.white, fontSize: 18)),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 150,
                  ),
                  Text('$month/$year',
                      style:
                          const TextStyle(color: Colors.white, fontSize: 15)),
                ],
              ),
              const SizedBox(height: 10),
              Text(cardHolder,
                  style: const TextStyle(color: Colors.white, fontSize: 18)),
            ],
          )),
    );
  }
}
