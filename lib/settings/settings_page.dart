//

import 'package:covid_app/settings/Services/Services.dart';
import 'package:covid_app/settings/Services/model/SharedPreferences.dart';
import 'package:covid_app/settings/Services/model/country.dart';
import 'package:covid_app/theme/palette.dart';
import 'package:covid_app/theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  List<CountryData> _countries;
  String _selectedSlug;
  bool _notificationsEnabled = true;

  showPicker() {
    _countries.sort((a, b) => a.country.compareTo(b.country));
    showCupertinoModalPopup(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 300,
            width: 1000,
            child: CupertinoPicker(
                magnification: 1.25,
                backgroundColor: Colors.white,
                onSelectedItemChanged: (value) {
                  SharedPrefsSettings()
                      .setCurSlug(_countries[value].slug)
                      .then((value) {
                    setState(() {
                      _selectedSlug = value;
                    });
                  });
                },
                itemExtent: 32.0,
                children: new List<Widget>.generate(_countries.length, (index) {
                  return new Center(
                      child: Text(
                          "${_countries[index].iso2}, ${_countries[index].country}",
                          style: TextStyle(
                            fontFamily: Fonts.sf_regular,
                          )));
                })),
          );
        });
  }

  @override
  void initState() {
    super.initState();
    Services.getCountires().then((countries) {
      setState(() {
        _countries = countries;
      });
    });
    SharedPrefsSettings().getBoolFromSharedPref().then((value) {
      setState(() {
        _notificationsEnabled = value;
      });
    });
    SharedPrefsSettings().getCurrentSlug().then((value) {
      setState(() {
        _selectedSlug = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        backgroundColor: Palette.primaryColor,
        child: NestedScrollView(
          // Sliver App bar part
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return <Widget>[
              CupertinoSliverNavigationBar(
                // Disables annoying back arrow PogU
                automaticallyImplyLeading: false,
                backgroundColor: Colors.black.withOpacity(0.4),
                largeTitle:
                    Text('Settings', style: TextStyle(color: Colors.white)),
              )
            ];
          },

          // Page body part

          body: Column(children: [
            Container(
              color: CupertinoColors.systemGrey6,
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Text('Country stats',
                    style: TextStyle(
                      fontFamily: Fonts.sf_regular,
                    )),
                Spacer(),
                CupertinoButton(
                  child: Text(_selectedSlug ?? "poland",
                      style: TextStyle(
                        fontFamily: Fonts.sf_regular,
                      )),
                  onPressed: () {
                    showPicker();
                  },
                )
              ]),
            ),
            Container(
              color: CupertinoColors.systemGrey6,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Notifications',
                      style: TextStyle(
                        fontFamily: Fonts.sf_regular,
                      )),
                  Spacer(),
                  CupertinoSwitch(
                      value: _notificationsEnabled,
                      onChanged: (bool newValue) {
                        setState(() {
                          SharedPrefsSettings()
                              .setBoolFromSharedPref(newValue)
                              .then((value) {
                            setState(() {
                              _notificationsEnabled = value;
                            });
                          });
                        });
                      })
                ],
              ),
            )
          ]),
        ));
  }
}
