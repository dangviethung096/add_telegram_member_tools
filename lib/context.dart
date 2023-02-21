import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:add_member_ui/page/accounts_page.dart';
import 'package:add_member_ui/page/add_member_page.dart';

class Context extends StatefulWidget {
  int pageIndex = 0;

  Context({super.key, required int pageIndex}) {
    this.pageIndex = pageIndex;
  }

  @override
  State<Context> createState() => _ContextState();

  changePage() {}
}

class _ContextState extends State<Context> {
  @override
  Widget build(BuildContext context) {
    switch (widget.pageIndex) {
      case 0:
        return AccountsPage(List.empty());
      case 1:
        return AddMemberPage();
      default:
        return AccountsPage(List.empty());
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
