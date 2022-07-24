import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:veegil_media/app/app_routes.dart';
import 'package:veegil_media/providers/auth_provider.dart';
import 'package:veegil_media/providers/home_provider.dart';
import 'package:veegil_media/utils/utils.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeProvider = context.watch<HomeProvider>();
    final authProvider = context.watch<AuthProvider>();
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Constants.primaryColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          SizedBox(
            height: MediaQuery.of(context).padding.top,
          ),
          Row(
            children: [
              Text(
                'Welcome Back 🤚🏾,',
                style: GoogleFonts.ubuntu(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              const Spacer(),
              InkResponse(
                onTap: () {
                  authProvider.logout();
                  context.push(VeegilBankPage.login);
                },
                child: const Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Text(
                'Balance',
                style: GoogleFonts.ubuntu(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              InkResponse(
                onTap: () =>
                    homeProvider.isShowAccount = !homeProvider.isShowAccount,
                child: homeProvider.isShowAccount
                    ? const Icon(
                        Icons.visibility_outlined,
                        size: 20,
                        color: Colors.white,
                      )
                    : const Icon(
                        Icons.visibility_off_outlined,
                        size: 20,
                        color: Colors.white,
                      ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            homeProvider.balanceLoading || !homeProvider.isShowAccount
                ? '******'
                : '₦${homeProvider.user.balance}.00',
            style: GoogleFonts.ubuntu(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HomeTile(
                text: 'Deposit',
                icon: LineIcons.wallet,
                onTap: () => context.push(VeegilBankPage.deposit),
              ),
              HomeTile(
                text: 'Transfer',
                icon: Icons.call_made,
                onTap: () => context.push(VeegilBankPage.transfer),
              ),
              HomeTile(
                text: 'History',
                icon: LineIcons.history,
                onTap: () => context.push(VeegilBankPage.history),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class HomeTile extends StatelessWidget {
  const HomeTile({
    Key? key,
    required this.text,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  final String text;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Icon(
              icon,
              size: 30,
              color: Constants.primaryColor,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            text,
            style: GoogleFonts.ubuntu(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
