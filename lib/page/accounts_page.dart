import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import '../model/account.dart';
import './accounts/account_item.dart';

class AccountsPage extends StatefulWidget {
  List<Account> accounts = List.empty();

  AccountsPage(List<Account> accounts) {
    this.accounts = accounts;
  }

  @override
  State<AccountsPage> createState() => _AccountsPageState();
}

class _AccountsPageState extends State<AccountsPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Container(
          child: TextField(
            decoration: InputDecoration(
              labelText: "App ID",
              border: OutlineInputBorder(),
            ),
          ),
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.all(8.0),
        ),
        Container(
          child: TextField(
            decoration: InputDecoration(
              labelText: "App Hash",
              border: OutlineInputBorder(),
            ),
          ),
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.all(8.0),
        ),
        Container(
          child: TextButton(
            child: Text("Add Account"),
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
            ),
            onPressed: () {
              _showAddAccountDialog(context);
            },
          ),
          height: 0.1 * height,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.all(8.0),
        ),
        Expanded(
          child: Container(
            child: ListView(
              children: widget.accounts
                  .map((account) => AccountItem(account: account))
                  .toList(),
            ),
            width: width,
          ),
        ),
      ],
    );
  }

  Future<void> _showAddAccountDialog(BuildContext context) {
    double widthDialog = MediaQuery.of(context).size.width / 4;
    double heightDialog = MediaQuery.of(context).size.height / 4;
    late TextEditingController usernameController = TextEditingController();
    late TextEditingController passwordController = TextEditingController();

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) => Dialog(
        child: Container(
          height: heightDialog,
          width: widthDialog,
          child: Column(
            children: [
              Container(
                child: TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Username',
                  ),
                ),
                padding: EdgeInsets.all(8),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(8, 0, 8, 8),
                child: TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
              ),
              Container(
                child: OutlinedButton(
                  onPressed: () {
                    var username = usernameController.text;
                    var password = passwordController.text;
                    if (username == "" || password == "") {
                      _showFailDialog(context);
                      return;
                    }

                    var newAccount = Account(
                      username: usernameController.text,
                      password: passwordController.text,
                    );
                    newAccount.isLogin = true;

                    setState(() {
                      widget.accounts.add(newAccount);
                    });
                    usernameController.dispose();
                    passwordController.dispose();
                    Navigator.of(context).pop();
                  },
                  child: Text("Add"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showFailDialog(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) => Dialog(
        child: Text("username or password is wrong!"),
      ),
    );
  }
}
