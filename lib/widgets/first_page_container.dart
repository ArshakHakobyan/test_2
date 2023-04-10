import 'package:flutter/material.dart';

class FirstPageContainer extends StatelessWidget {
  final Image image;

  const FirstPageContainer({key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
          color: Color.fromRGBO(8, 0, 0, 0.2),
          borderRadius: BorderRadius.all(Radius.circular(8))),
      width: 113,
      height: 135,
      child: image,
    );
  }
}
