import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:veegil_media/providers/transaction_provider.dart';
import 'package:veegil_media/utils/utils.dart';

class TransferPage extends StatelessWidget {
  TransferPage({Key? key}) : super(key: key);

  TextEditingController accountNumberController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
          'Transfer',
          style: GoogleFonts.ubuntu(
            fontSize: 23,
            fontWeight: FontWeight.w500,
            color: Constants.primaryColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextBox(
                controller: accountNumberController,
                labelText: 'Account Number',
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(11)
                ],
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Acount Number is required';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextBox(
                controller: amountController,
                labelText: 'Amount',
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Amount is required';
                  }
                  return null;
                },
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.showLoadingDialog();
                    context
                        .read<TransactionProvider>()
                        .transfer(
                          accountNumber: accountNumberController.text,
                          amount: amountController.text,
                        )
                        .then((value) {
                      context.back();
                      if (value.status == 'error') {
                        context.showErrorMessage(value.message ?? '');
                      } else {
                        context.showSuccessMessage(value.message ?? '');
                        Future.delayed(const Duration(milliseconds: 1550),
                            () => context.back());
                      }
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Constants.primaryColor,
                  fixedSize: const Size(
                    350,
                    50,
                  ),
                ),
                child: const Text(
                  "Transfer",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
