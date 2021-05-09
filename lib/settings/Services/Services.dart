//

import 'package:covid_app/settings/Services/model/cases.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'model/country.dart';
import 'model/cases.dart';

class Services {
  static Future<List<CountryData>> getCountires() async {
    final apiUri = Uri.parse("https://api.covid19api.com/countries");
    try {
      final response = await http.get(apiUri);
      if (response.statusCode == 200) {
        final List<CountryData> countries = countryFromJson(response.body);
        return countries;
      } else {
        print("Failed, ${response.statusCode}");
      }
    } catch (e) {}
  }

  static Future<List<Cases>> getCases(String slug) async {
    final apiUri = Uri.parse("https://api.covid19api.com/dayone/country/$slug");
    try {
      final response = await http.get(apiUri);
      if (response.statusCode == 200) {
        final List<Cases> data = casesFromJson(response.body);
        return data;
      } else {
        print("Failed, ${response.statusCode}");
      }
    } catch (e) {}
  }

  static Future<void> makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
