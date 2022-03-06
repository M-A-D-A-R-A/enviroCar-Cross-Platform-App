import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../widgets/dashboardWidgets/statsWidget.dart';

class UserDataScreen extends StatefulWidget {
  @override
  State<UserDataScreen> createState() => _UserDataScreenState();
}

class _UserDataScreenState extends State<UserDataScreen> {

  //TODO: To show all the possible data in app on this screen 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kGreyColor,
        elevation: 0,
      ),
      body: StatsWidget(),
    );
  }
}
