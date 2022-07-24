class TransactionModel {
  String? type;
  int? amount;
  int? balance;
  String? phoneNumber;
  String? created;

  TransactionModel({
    this.type,
    this.amount,
    this.balance,
    this.phoneNumber,
    this.created,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      TransactionModel(
          type: json['type'] as String?,
          amount: json['amount'] as int?,
          balance: json['balance'] as int?,
          phoneNumber: json['phoneNumber'] as String?,
          created: json['created'] as String?);
}
