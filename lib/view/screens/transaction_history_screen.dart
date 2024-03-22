import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/text_theme.dart' as th;
import '../widgets/transaction_card.dart';
import '../../model/transaction_model.dart';
import '../../control/transaction_handler.dart';
import '../../model/account_model.dart';

class TransactionHistoryScreen extends StatelessWidget {
  const TransactionHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Transaction History"),
          actions: [
            Container(
                margin: const EdgeInsets.only(top: 10, right: 10),
                child: const Icon(Icons.home_outlined))
          ],
          backgroundColor: secondaryColor,
        ),
        //using futurebuilder to get data
        body: FutureBuilder(
            //     //future to read data
            future: TransactionHandler.setAllTransactions(
                AccountModel.currentAccount.accountId),
            builder: (context, snapshot) {
              //loading
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }

              //not found
              if (snapshot.hasError) {
                return const Center(
                  child: Text(
                    "Error",
                    style: TextStyle(fontSize: 100),
                  ),
                );
              }

              //after successful login
              else {
                return Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    decoration: BoxDecoration(color: primaryColor),
                    child: ListView.builder(
                      itemCount: TransactionModel.accountTransactions
                          .length, // Specify the number of items in the list
                      itemBuilder: (context, index) {
                        // Define the itemBuilder function to build each item in the list
                        var list = TransactionModel.accountTransactions;
                        return TransactionCard(
                            amount: list[index].amount,
                            bank: list[index].bank ?? "none",
                            name: list[index].name);
                      },
                    ));
              }
            }),
      ),
    );
  }
}





// Container(
//             width: double.infinity,
//             padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
//             decoration: BoxDecoration(color: primaryColor),

//             child: ListView.builder(
//               itemCount: TransactionModel.accountTransactions.length, // Specify the number of items in the list
//               itemBuilder: (context, index) {
//                 // Define the itemBuilder function to build each item in the list
//                 var list=TransactionModel.accountTransactions;
//                 return TransactionCard(amount: list[index].amount, bank: list[index].bank??"none", name: list[index].name);
//               },
//             )),