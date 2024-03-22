import 'package:flutter/material.dart';

import 'package:cash_flow/view/utils/colors.dart';
import '../../model/account_model.dart';
import 'package:cash_flow/view/widgets/custom_drop_down.dart';
import '../utils/utilities_values.dart';
import '../../control/transaction_handler.dart';

class SendingMoneyScreen extends StatefulWidget {
  const SendingMoneyScreen({super.key});

  @override
  State<SendingMoneyScreen> createState() => _SendingMoneyScreenState();
}

class _SendingMoneyScreenState extends State<SendingMoneyScreen> {
  final TextEditingController _senderAccountControler = TextEditingController();
  final TextEditingController _recieverAccountControler =
      TextEditingController();
  final TextEditingController _amountControler = TextEditingController();

  String selectedBank = "select a bank";

  TransactionHandler _tHandler = TransactionHandler();

  void changeBank(String newBank) {
    selectedBank = newBank;
  }

  @override
  void dispose() {
    _senderAccountControler.dispose();
    _recieverAccountControler.dispose();
    _amountControler.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _senderAccountControler.text = AccountModel.currentAccount.accountId;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(context) {
    return SingleChildScrollView(
      child: Container(
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
      
            //select banks
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                  color: secondaryColor, borderRadius: BorderRadius.circular(15)),
              child: CustomDropdownMenu(
                  options: banks,
                  selectedOption: selectedBank,
                  hint: "Bank",
                  onChanged: changeBank),
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
      
            //amount
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                  color: secondaryColor, borderRadius: BorderRadius.circular(15)),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: _amountControler,
                maxLength: 10,
                maxLines: 1,
                decoration:
                    const InputDecoration(hintText: "1111", labelText: "amount"),
              ),
            ),
      
            //seding button
            Container(
              margin: const EdgeInsets.only(top: 15),
              child: ElevatedButton(
                onPressed: () async {
                  bool success = false;
                  int amount=int.parse(_amountControler.text);
      
                    //adding transaction
                    success=await _tHandler.addTransaction(
                      accountId: _senderAccountControler.text,
                      recieverId: _recieverAccountControler.text,
                      amount: int.parse(_amountControler.text),
                      bank: selectedBank,
                    );
                    
                  if (success) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Succesful sended the money')));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Something wrong')));
                  }
                },
                child: const Text("Send"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
