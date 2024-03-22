class TransactionModel{
  final String transactionId;
  final int amount;
  final String accountId;
  final String recieverId;
  final String name;
  String? bank;

  static List<TransactionModel> accountTransactions=[];

  TransactionModel({
    required this.transactionId,
    required this.amount,
    required this.accountId,
    required this.recieverId,
    required this.name,
    this.bank, // Nullable parameter with default value null
  });

   static convert(
    List<Map<String, dynamic>> transactionData,
  ) {
    // List<dynamic> list=[];
    // list.addAll(customerData[0].values);

    // return list;

    return transactionData[0];
  }

  //from map
  TransactionModel.fromMap(Map<String, dynamic> map)
      : transactionId = map['transactionId'],
        amount = map['amount'],
        accountId = map['accountId'],
        recieverId = map['recieverId'],
        name = map['name'],
        bank = map['bank'];

  //creating map
  static Map<String, dynamic> transactionMap({
    required String transactionId,
    required int amount,
    required String accountId,
    required String recieverId,
    required String name,
    String? bank, // Nullable parameter
  }) {
    return {
      'transactionId': transactionId,
      'amount': amount,
      'accountId': accountId,
      'recieverId': recieverId,
      'name': name,
      'bank': bank, // Include the nullable parameter in the map
    };
}

  static addToList(List<Map<String, dynamic>> allTransactions){
    allTransactions.forEach((transactionMap) {
    // Create a Transaction object from the map using the fromMap constructor
    TransactionModel transaction = TransactionModel.fromMap(transactionMap);
    // Add the Transaction object to the transactionList
    accountTransactions.add(transaction);
  });
  }

}