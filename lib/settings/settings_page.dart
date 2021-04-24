//

import 'package:flutter/cupertino.dart';

class Settings extends StatefulWidget {
  var notificationsEnabled = false;
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
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
                  child: Text('PL 🇵🇱️'),
                  onPressed: () {},
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
                    value: widget.notificationsEnabled,
                    onChanged: (bool newValue) {
                      setState(() {
                        widget.notificationsEnabled = newValue;
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
