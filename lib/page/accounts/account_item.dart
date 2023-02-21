import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import '../../model/account.dart';

class AccountItem extends StatefulWidget {
  Account account = Account(username: "username", password: "");

  AccountItem({super.key, required Account account}) {
    this.account = account;
  }

  @override
  State<AccountItem> createState() => _AccountItemState();
}

class _AccountItemState extends State<AccountItem> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      child: Row(
        children: [
          Container(
            child: Text(
              widget.account.username,
              style: TextStyle(color: Colors.white),
            ),
            width: width * 0.6,
            padding: EdgeInsets.all(8.0),
          ),
          Expanded(
            child:
                widget.account.isLogin ? getLoginAccount() : getLogoutAccount(),
          ),
        ],
      ),
      margin: EdgeInsets.all(8.0),
      color: widget.account.isLogin ? Colors.green : Colors.red,
      height: 50,
    );
  }

  Widget getLoginAccount() {
    return Container(
      child: TextButton(
        child: Text(
          "Logout",
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          setState(() {
            widget.account.isLogin = false;
          });
        },
      ),
      width: 50,
      alignment: Alignment.centerRight,
      padding: EdgeInsets.all(8),
    );
  }

  Widget getLogoutAccount() {
    return Container(
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          TextButton(
            child: Text(
              "Login",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              setState(() {
                widget.account.isLogin = true;
              });
            },
          ),
          TextButton(
            child: Text(
              "Edit",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {},
          ),
        ],
      ),
      alignment: Alignment.centerRight,
      padding: EdgeInsets.all(8),
    );
  }
}
