import 'package:flutter/material.dart';

import 'package:telcell_copy/widgets/balance_visibility.dart';
import 'package:telcell_copy/widgets/credit_card.dart';
import '../widgets/db.dart';
import '../widgets/icon_images.dart';
import 'add_credit_card.dart';

class CardsPage extends StatefulWidget {
  const CardsPage({super.key});
  @override
  State<StatefulWidget> createState() {
    return CardsPageState();
  }
}

class CardsPageState extends State<CardsPage> {
  @override
  void initState() {
    super.initState();
    getDataFromDatabase();
    //
  }

  List<CreditCards> creditCards = [];
// get data from data base and call addCard to render cards
  void getDataFromDatabase() async {
    final List<Map> cards =
        await DatabaseHelper.instance.readDataFromDatabase();
    for (Map item in cards) {
      addCard(
        cardNumber: item['card_number'],
        cardHolder: item['card_holder'],
        expirationDate: item['expiration_date'],
      );
    }
    setState(() {});
  }

  //add card
  void addCard({
    required int cardNumber,
    required String cardHolder,
    required int expirationDate,
  }) {
    creditCards.add(CreditCards(
      cardHolder: cardHolder, //Name of Cardholder
      cardNumber: cardNumber, //Card Number
      color: CardColors.blue,
      type: CardTypes.visa,
      bankName: "ID Bank",
      year: int.tryParse(expirationDate.toString().substring(0, 4))!,
      month: int.tryParse(expirationDate.toString().substring(4))!,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(240, 242, 244, 1),
        appBar: AppBar(
            backgroundColor: const Color.fromRGBO(238, 111, 50, 1),
            title: const BalanceVisibility()),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 15, top: 10, bottom: 10),
                width: MediaQuery.of(context).size.width,
                child: const Text(
                  "Cards",
                  style: TextStyle(
                      color: Color.fromRGBO(176, 190, 198, 1), fontSize: 20),
                ),
              ),
              //Cards
              creditCards.isEmpty
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height * 0.66,
                      child: Center(
                          child: Image(
                        image: IconImages().bodyImage,
                      )),
                    )
                  : Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.24,
                          child: ListView.builder(
                            itemCount: creditCards.length,
                            itemBuilder: (BuildContext context, int index) {
                              return creditCards[index];
                            },
                            scrollDirection: Axis.horizontal,
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.43),
                      ],
                    ),

              ElevatedButton(
                onPressed: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddCard(),
                    ),
                  );
                  getDataFromDatabase();
                  setState(() {});
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.33,
                    vertical: MediaQuery.of(context).size.height * 0.015,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                  backgroundColor: const Color.fromRGBO(238, 111, 50, 1),
                ),
                child: const Text('Bind a Card'),
              )
            ],
          ),
        ));
  }
}
