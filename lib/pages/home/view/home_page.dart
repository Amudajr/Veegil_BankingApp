import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:veegil_media/pages/history/history.dart';
import 'package:veegil_media/pages/home/widgets/widgets.dart';
import 'package:veegil_media/providers/home_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<HomeProvider>().getTransactions();
      context.read<HomeProvider>().getUserBalance();
    });
  }

  @override
  Widget build(BuildContext context) {
    final homeProvider = context.watch<HomeProvider>();
    return Scaffold(
      body: Column(
        children: [
          const HomeCard(),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: homeProvider.transactionLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : homeProvider.transactions.isEmpty
                    ? Center(
                        child: Text(
                          'No transaction available',
                          style: GoogleFonts.ubuntu(
                            fontSize: 20,
                          ),
                        ),
                      )
                    : ListView.separated(
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                          final transaction = homeProvider.transactions[index];
                          return HistoryCard(
                            type: transaction.type?.toLowerCase() == 'debit'
                                ? TransactionType.debit
                                : TransactionType.credit,
                            phoneNumber: transaction.phoneNumber ?? '',
                            date: transaction.created!,
                            amount: transaction.amount.toString(),
                          );
                        },
                        separatorBuilder: (_, __) => const SizedBox(
                          height: 10,
                        ),
                        itemCount: homeProvider.transactions.length < 5
                            ? homeProvider.transactions.length
                            : 5,
                      ),
          )
        ],
      ),
    );
  }
}
