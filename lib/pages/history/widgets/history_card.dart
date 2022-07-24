import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard({
    Key? key,
    required this.date,
    required this.amount,
    required this.phoneNumber,
    required this.type,
  }) : super(key: key);

  final String date;
  final String amount;
  final String phoneNumber;
  final TransactionType type;

  @override
  Widget build(BuildContext context) {
    final isDebit = type == TransactionType.debit;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.grey[300],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  phoneNumber,
                  style: GoogleFonts.ubuntu(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                Text(
                  date,
                  style: GoogleFonts.ubuntu(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Column(
              children: [
                isDebit
                    ? Icon(
                        Icons.arrow_downward,
                        color: isDebit ? Colors.red : Colors.green,
                      )
                    : Icon(
                        Icons.arrow_upward,
                        color: isDebit ? Colors.red : Colors.green,
                      ),
                Text(
                  '${isDebit ? '-' : '+'}$amount',
                  style: GoogleFonts.ubuntu(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: isDebit ? Colors.red : Colors.green,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

enum TransactionType {
  debit,
  credit,
}
