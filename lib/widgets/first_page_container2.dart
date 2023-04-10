import 'package:flutter/material.dart';

class WalletContainer extends StatelessWidget {
  final Image image;
  const WalletContainer({key, required this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
          color: Color.fromRGBO(255, 253, 253, 1),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      width: 107,
      height: 107,
      child: image,
    );
  }
}
