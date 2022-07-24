import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:veegil_media/pages/history/history.dart';
import 'package:veegil_media/providers/history_provider.dart';
import 'package:veegil_media/utils/utils.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<HistoryProvider>().getHistory();
    });
  }

  @override
  Widget build(BuildContext context) {
    final historyProvider = context.watch<HistoryProvider>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: InkWell(
          onTap: () => context.back(),
          child: const Icon(
            Icons.arrow_back,
            size: 30,
            color: Constants.primaryColor,
          ),
        ),
        title: Text(
          'Transaction History',
          style: GoogleFonts.ubuntu(
            fontSize: 23,
            fontWeight: FontWeight.w500,
            color: Constants.primaryColor,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: historyProvider.loading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : historyProvider.history.isEmpty
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
                            final transaction = historyProvider.history[index];
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
                          itemCount: historyProvider.history.length,
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
