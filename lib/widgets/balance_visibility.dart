import 'package:flutter/material.dart';

class BalanceVisibility extends StatefulWidget {
  const BalanceVisibility({key}) : super(key: key);
  @override
  State createState() => BalanceVisibilityState();
}

class BalanceVisibilityState extends State<BalanceVisibility> {
  bool isVisible = true;
  void toggle() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        isVisible
            ? ShowMoneyField(onPressed: toggle)
            : HiddenMoneyField(onPressed: toggle),
      ],
    );
  }
}

class ShowMoneyField extends StatelessWidget {
  final void Function() onPressed;
  const ShowMoneyField({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: const [
            Padding(
              padding: EdgeInsets.only(top: 5, right: 15),
              child: Text(
                '0.00',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontFamily: AutofillHints.addressCityAndState),
              ),
            ),
            Positioned(
                right: 0,
                top: 0,
                child: Text(
                  "Դ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                )),
          ],
        ),
        IconButton(
          iconSize: 28,
          onPressed: () {
            onPressed();
          },
          icon: const InkWell(child: Icon(Icons.visibility_off)),
          color: Colors.white,
        ) //flex: 1,
      ],
    );
  }
}

class HiddenMoneyField extends StatelessWidget {
  final void Function() onPressed;
  const HiddenMoneyField({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.wallet,
          size: 30,
          color: Colors.white,
        ),
        const SizedBox(width: 9),
        const Text(
          '• • • • •',
          style: TextStyle(
              height: 1,
              fontSize: 35,
              color: Colors.white,
              fontFamily: AutofillHints.addressCityAndState),
        ),
        IconButton(
          iconSize: 28,
          onPressed: () {
            onPressed();
          },
          icon: const Icon(Icons.visibility),
          //padding: const EdgeInsets.only(),
          color: Colors.white,
        ),
      ],
    );
  }
}
