import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import '../model/account.dart';
import './accounts/account_item.dart';

class AccountsPage extends StatelessWidget {
  List<Account> accounts = List.empty();

  AccountsPage(List<Account> accounts) {
    this.accounts = accounts;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Container(
          child: TextButton(
            child: Text("Add Account"),
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
            ),
            onPressed: () {
              // showAddAccountDialog(context);
            },
          ),
          height: 0.1 * height,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.all(8.0),
        ),
        Expanded(
          child: Container(
            child: ListView(
              children: accounts
                  .map((account) => AccountItem(account: account))
                  .toList(),
            ),
            width: width,
          ),
        ),
      ],
    );
  }
}
