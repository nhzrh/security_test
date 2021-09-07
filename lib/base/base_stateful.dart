import 'dart:async';

import 'package:flutter/material.dart';
import 'package:security_test/common/utils/custom_colors.dart';

abstract class BaseStateful<T extends StatefulWidget> extends State<T> {
  String getAppTitle();
  List<Widget> getAction();
  Widget getChildView();
  Widget getBottomNavigation();
  Widget getDrawer();
  Widget getFloatingActionButton();
  bool isImageHeader = false;

  Future<bool> _onWillPop() async {
    return backTap(context) ?? false;
  }

  bool backTap(BuildContext context) {
    Navigator.pop(context);
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: isImageHeader,
          toolbarHeight: 70,
          flexibleSpace: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: buildHeader(),
                ),
                SizedBox(
                  child: Container(color: Theme.of(context).accentColor),
                  height: 8,
                )
              ],
            ),
          ),
          actions: getAction(),
        ),
        drawer: getDrawer(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(12.0),
                child: Text(
                  getAppTitle() ?? '',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Theme.of(context).accentColor,
                  ),
                ),
              ),
              getChildView(),
            ],
          ),
        ),
        backgroundColor: CustomColors.background,
        bottomNavigationBar: getBottomNavigation(),
        floatingActionButton: getFloatingActionButton(),
      ),
    );
  }

  Widget buildHeader() {
    return Image.asset(
      'assets/logo.png',
      height: 45.0,
    );
  }
}
