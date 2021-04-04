import 'dart:async';

import 'package:driverapp/models/driver_model.dart';
import 'package:driverapp/utils/app_color.dart';
import 'package:driverapp/utils/app_storage.dart';
import 'package:driverapp/utils/translator-util.dart';
import 'package:driverapp/viewmodels/more_view_model.dart';
import 'package:driverapp/views/language/language_page.dart';
import 'package:driverapp/views/login/login_page.dart';
import 'package:driverapp/views/more/about.dart';
import 'package:driverapp/views/notification/notification_page.dart';
import 'package:driverapp/views/widgets/app_loading.dart';
import 'package:driverapp/views/widgets/cards/more_card.dart';
import 'package:driverapp/views/widgets/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MorePage extends StatefulWidget {
  MoreViewModel _viewModel;

  MorePage() {
    _viewModel = MoreViewModel();
    _viewModel.getDriver();
  }

  @override
  _MorePageState createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return AppLoading(
      isLoading: _isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: Text(TranslatorUtil.text('more')),
          backgroundColor: AppColor.MAIN_COLOR,
        ),
        body: Container(
          child: Column(
                children: <Widget>[
                  Expanded(
                      flex: 3,
                      child: Column(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.topCenter,
                            child: Image(
                              image: AssetImage('assets/1-1-2.png'),
                              height: 110.0,
                              width: 110.0,
                            ),
                          ),
                          FutureBuilder<DriverModel>(
                              future: widget._viewModel.driver,
                              builder: (context, driverSnap) {
                                if (driverSnap.connectionState ==
                                    ConnectionState.none &&
                                    driverSnap.hasData == null) {
                                  return Container(
                                    child: Text("No Driver Found"),
                                  );
                                }

                                if (driverSnap.data == null) {
                                  return Container();
                                }
                                return Column(
                                  children: [
                                    Text(driverSnap.data.phone),
                                    Text(driverSnap.data.username)
                                  ],
                                );
                              }
                          ),

                        ]
                      ),
                  ),
                  Expanded(
                    flex: 7,
                    child: Container(
                      alignment: Alignment.center,
                      child: Column(
                        children: <Widget>[
                          MoreCard(
                            title: TranslatorUtil.text('notification'),
                            icon: Icons.notifications,
                            onClick: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NotificationPage())),
                          ),
                          MoreCard(
                            title: TranslatorUtil.text('about'),
                            icon: Icons.verified_user,
                            onClick: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AboutPage())),
                          ),
                          MoreCard(
                            title: TranslatorUtil.text('setting'),
                            icon: Icons.settings,
                            onClick: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LanguagePage())),
                          ),
                          MoreCard(
                            title: TranslatorUtil.text('signOut'),
                            icon: Icons.exit_to_app,
                            onClick: () {
                              setState(() {
                                _isLoading = true;
                              });
                              AppStorage.clearLogin();
                              Timer(
                                  Duration(seconds: 2),
                                      () => setState(() {
                                    _isLoading = false;
                                    Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(
                                            builder: (context) => LoginPage()),
                                            (route) => false);
                                  }));
                            },
                          ),
                        ],
                      ),
                    ),
                  )
                ],
          ),
        ),
      ),
    );
  }
}


