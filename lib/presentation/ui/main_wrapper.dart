import 'package:cryptoapp/logic/provider/crypto_data_provider.dart';
import 'package:cryptoapp/presentation/ui/home_page.dart';
import 'package:cryptoapp/presentation/ui/market_view_page.dart';
import 'package:cryptoapp/presentation/ui/profile_page.dart';
import 'package:cryptoapp/presentation/ui/ui_helper/bottom_nav.dart';
import 'package:cryptoapp/presentation/ui/watch_list_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  final PageController _myPage = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {},
        child: Icon(Icons.compare_arrows_outlined),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNav(controller: _myPage),
      body: PageView(
        controller: _myPage,
        children: [
          ChangeNotifierProvider<CryptoDataProvider>(
            create: (_) => CryptoDataProvider(),
            child: HomePage(),
          ),
          MarketViewPage(),
          ProfilePage(),
          WatchListPage(),
        ],
      ),
    );
  }
}
