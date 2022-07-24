class User {
  User({
    this.phoneNumber,
    this.balance,
    this.created,
  });

  final String? phoneNumber;
  final int? balance;
  final String? created;

  factory User.fromJson(Map<String, dynamic> json) => User(
        phoneNumber: json['phoneNumber'] as String?,
        balance: json['balance'] as int?,
        created: json['created'] as String?,
      );
}
