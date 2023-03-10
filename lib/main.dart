import 'package:add_member_ui/model/account.dart';
import 'package:add_member_ui/page/accounts_page.dart';
import 'package:add_member_ui/page/add_member_page.dart';
import 'package:flutter/material.dart';
import 'sidebar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainScreen extends StatefulWidget {
  late List<Account> accounts = List.empty(growable: true);
  int pageIndex = 0;

  MainScreen({super.key, pageIndex}) {
    for (int i = 0; i < 5; i++) {
      var account = Account(username: 'user_${i}', password: "pass_${i}");
      if (i % 2 == 0) {
        account.isLogin = true;
      }
      accounts.add(account);
    }
  }

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Row(
        children: [
          SizedBox(
            width: width * 0.2,
            height: height,
            child: SideBar(selectPage),
          ),
          Expanded(
            child: getPage(),
          ),
        ],
      ),
    );
  }

  Widget getPage() {
    switch (widget.pageIndex) {
      case 0:
        return AccountsPage(widget.accounts);
      case 1:
        return AddMemberPage(stateIndex: 1);
      default:
        return AccountsPage(widget.accounts);
    }
  }

  selectPage(index) {
    setState(() {
      widget.pageIndex = index;
    });
  }
}
