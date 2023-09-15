import 'package:flutter/material.dart';
import 'package:flutter_app_islami_c9_fri/home/hadeth/hadeth_tab.dart';
import 'package:flutter_app_islami_c9_fri/home/hadeth/item_hadeth_details.dart';
import 'package:flutter_app_islami_c9_fri/my_theme.dart';

class HadethDetailsScreen extends StatefulWidget {
  static const String routeName = 'hadeth-details';

  @override
  State<HadethDetailsScreen> createState() => _HadethDetailsScreenState();
}

class _HadethDetailsScreenState extends State<HadethDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Hadeth;
    return Stack(children: [
      Image.asset(
        'assets/images/main_background.png',
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill,
      ),
      Scaffold(
        appBar: AppBar(
          title: Text(
            '${args.title}',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.06,
              horizontal: MediaQuery.of(context).size.width * 0.05),
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: MyTheme.whiteColor,
              borderRadius: BorderRadius.circular(24)),
          child: ListView.builder(
            itemBuilder: ((context, index) {
              return ItemHadethDetails(content: args.content[index]);
            }),
            itemCount: args.content.length,
          ),
        ),
      ),
    ]);
  }
}
