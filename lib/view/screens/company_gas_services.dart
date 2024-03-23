import 'package:flutter/material.dart';

import '../widgets/custom_drop_down.dart';
import '../widgets/custom_texfield.dart';
import '../utils/colors.dart';
import '../../control/transaction_handler.dart';
import '../../model/account_model.dart';

class CompanyGasScreen extends StatefulWidget {
  CompanyGasScreen({Key? key}) : super(key: key);

  @override
  State<CompanyGasScreen> createState() => _CompanyGasScreenState();
}

class _CompanyGasScreenState extends State<CompanyGasScreen> {
  final TextEditingController _companyController = TextEditingController();
  final TextEditingController consumerNoController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TransactionHandler _tHandler=TransactionHandler();

  final String _selectedCompany="SSGC";

  @override
  void dispose() {
    // TODO: implement dispose
    _companyController.dispose();
    consumerNoController.dispose();
    amountController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Gas Bill"),
          actions: [
            Container(
                margin: const EdgeInsets.only(top: 10, right: 10),
                child: const Icon(Icons.gas_meter_sharp))
          ],
          backgroundColor: secondaryColor,
        ),
        backgroundColor: primaryColor,
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            color: primaryColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.07,
                      vertical: MediaQuery.of(context).size.height * 0.1,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(50.0),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.05,
                        horizontal: MediaQuery.of(context).size.width * 0.03,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Company',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: CustomDropdownMenu(
                              options: [
                                'SSGC',
                                "SNGPL"
                              ],
                              selectedOption: _selectedCompany,
                              hint: 'Select an option', // Add a hint
                              onChanged: (newValue) {
                                print(newValue);
                              },
                            ),
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height * 0.03),
                          Text(
                            'Consumer No',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          buildTextField(consumerNoController),
                          SizedBox(
                              height: MediaQuery.of(context).size.height * 0.03),
                          Text(
                            'Amount',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          buildTextField(amountController),
                        ],
                      ),
                    ),
                  ),
                Container(
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.07,
                      right: MediaQuery.of(context).size.width * 0.07,
                      bottom: MediaQuery.of(context).size.width * 0.05),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.06,
                  child: ElevatedButton(
                    onPressed: () async {
                  bool success = false;
                  int amount=int.parse(amountController.text);
      
                    //adding transaction
                    success=await _tHandler.addTransaction(
                      accountId: AccountModel.currentAccount.accountId,
                      recieverId: consumerNoController.text,
                      amount: amount,
                      bank: _selectedCompany,
                      name: consumerNoController.text,
                    );
                    
                  if (success) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Succesful sended the money')));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Something wrong')));
                  }
                },
                    child: Text(
                      'Pay',
                      style: TextStyle(
                          color: Color(0XFF39a8ed),
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
