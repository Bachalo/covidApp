//

import 'package:covid_app/settings/Services/Services.dart';
import 'package:covid_app/theme/palette.dart';
import 'package:covid_app/stats/UI/components/EmergencyButton.dart';
import 'package:covid_app/theme/fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlarmPage extends StatefulWidget {
  @override
  _AlarmPageState createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  @override
  Widget build(BuildContext context) {
    //

    var screenSize = MediaQuery.of(context).size;
    var telNum = "214324234";
    double radiusAppBar = 30;
    return Scaffold(
      backgroundColor: Palette.primaryColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: screenSize.height * 0.39,
              width: screenSize.width,
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                  boxShadow: [Palette().kDefaultShadow],
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(radiusAppBar),
                      bottomRight: Radius.circular(radiusAppBar))),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 20.0),
                          child: Text(
                            "COVID-19 symptoms",
                            style: TextStyle(
                                fontFamily: Fonts.sf_regular,
                                color: Colors.white,
                                fontSize: 30),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Are you feeling sick?",
                              style: TextStyle(
                                  fontFamily: Fonts.sf_regular,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "If you fell sick with any of COVID-19 symptoms please call or SMS immediately for help.",
                              style: TextStyle(
                                  fontFamily: Fonts.sf_regular,
                                  color: Colors.white,
                                  fontSize: 17),
                            ),
                          ),
                          Row(
                            children: [
                              EmergencyButton(
                                screenSize: screenSize,
                                text: "Call Now",
                                buttonColor: Colors.red,
                                textIconColor: Colors.white,
                                icon: CupertinoIcons.phone_fill,
                                onPressed: () {
                                  Services.makePhoneCall('tel:9876543210');
                                },
                              ),
                              Spacer(),
                              EmergencyButton(
                                screenSize: screenSize,
                                text: "Send SMS Now",
                                buttonColor: Colors.lightBlue,
                                textIconColor: Colors.white,
                                icon: CupertinoIcons.chat_bubble_2_fill,
                                onPressed: () {
                                  Services.makePhoneCall('sms:9876543210');
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Prevention",
                style: TextStyle(
                    fontFamily: Fonts.sf_regular,
                    color: Colors.white,
                    fontSize: 30),
              ),
            ),
            Text(
              "Remember to keep distance",
              style: TextStyle(
                  fontFamily: Fonts.sf_regular,
                  color: Colors.white,
                  fontSize: 20),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: ScrollPhysics(),
              child: Row(
                children: [
                  Icon(
                    CupertinoIcons.add,
                    size: 60,
                    color: Colors.white,
                  ),
                  Icon(
                    CupertinoIcons.add,
                    size: 60,
                    color: Colors.white,
                  ),
                  Icon(
                    CupertinoIcons.add,
                    size: 60,
                    color: Colors.white,
                  ),
                  Icon(
                    CupertinoIcons.add,
                    size: 60,
                    color: Colors.white,
                  ),
                  Icon(
                    CupertinoIcons.add,
                    size: 60,
                    color: Colors.white,
                  ),
                  Icon(
                    CupertinoIcons.add,
                    size: 60,
                    color: Colors.white,
                  ),
                  Icon(
                    CupertinoIcons.add,
                    size: 60,
                    color: Colors.white,
                  ),
                  Icon(
                    CupertinoIcons.add,
                    size: 60,
                    color: Colors.white,
                  ),
                  Icon(
                    CupertinoIcons.add,
                    size: 60,
                    color: Colors.white,
                  ),
                  Icon(
                    CupertinoIcons.add,
                    size: 60,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: screenSize.height,
            )
          ],
        ),
      ),
    );
  }
}
