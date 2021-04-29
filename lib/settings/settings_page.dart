//

import 'package:covid_app/settings/Services/Services.dart';
import 'package:covid_app/settings/Services/model/country.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Services/model/SharedPreferences.dart';

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
                        "${_countries[index].iso2}, ${_countries[index].country}"),
                  );
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
      child: Column(
        children: [
          Container(
            height: 150,
            child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    CupertinoButton(
                        child: Icon(CupertinoIcons.arrow_left),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                    Text(
                      'Settings',
                      style:
                          TextStyle(fontSize: 30, color: CupertinoColors.black),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            color: CupertinoColors.systemGrey6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Country stats'),
                Spacer(),
                CupertinoButton(
                  child: Text(_selectedSlug ?? "poland"),
                  onPressed: () {
                    showPicker();
                  },
                )
              ],
            ),
          ),
          Container(
            color: CupertinoColors.systemGrey6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Notifications'),
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
        ],
      ),
    );
  }
}
