import 'package:flutter/material.dart';

import 'package:cash_flow/view/utils/colors.dart';

class SendingMoneyScreen extends StatefulWidget {
  const SendingMoneyScreen({super.key});

  @override
  State<SendingMoneyScreen> createState() => _SendingMoneyScreenState();
}

class _SendingMoneyScreenState extends State<SendingMoneyScreen> {
  final TextEditingController _senderAccountControler = TextEditingController();
  final TextEditingController _recieverAccountControler =
      TextEditingController();

  @override
  void initState() {
    _senderAccountControler.text = "0239212";
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      width: double.infinity,
      color: primaryColor,
      child: Column(
        children: <Widget>[
          //textfield for sender account number

          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
                color: secondaryColor, borderRadius: BorderRadius.circular(15)),
            child: TextField(
              controller: _senderAccountControler,
              maxLength: 10,
              maxLines: 1,
              decoration: const InputDecoration(
                  hintText: "PKRCFXXXXX", labelText: "Sender"),
              readOnly: true,
            ),
          ),

          //textfield for reciever account number

          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
                color: secondaryColor, borderRadius: BorderRadius.circular(15)),
            child: TextField(
              controller: _recieverAccountControler,
              maxLength: 10,
              maxLines: 1,
              decoration: const InputDecoration(
                  hintText: "PKRCFXXXXX", labelText: "Reciever"),
            ),
          ),

          //seding button
          Container(
            margin: const EdgeInsets.only(top: 15),
            child: ElevatedButton(
              onPressed: () {},
              child: const Text("Send"),
            ),
          )
        ],
      ),
    );
  }
}
