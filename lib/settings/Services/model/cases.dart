// To parse this JSON data, do
//
//     final cases = casesFromJson(jsonString);

import 'dart:convert';

List<Cases> casesFromJson(String str) =>
    List<Cases>.from(json.decode(str).map((x) => Cases.fromJson(x)));

String casesToJson(List<Cases> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Cases {
  Cases({
    this.countryCode,
    this.confirmed,
    this.deaths,
    this.recovered,
    this.active,
    this.date,
  });

  CountryCode countryCode;
  int confirmed;
  int deaths;
  int recovered;
  int active;
  DateTime date;

  factory Cases.fromJson(Map<String, dynamic> json) => Cases(
        countryCode: countryCodeValues.map[json["CountryCode"]],
        confirmed: json["Confirmed"],
        deaths: json["Deaths"],
        recovered: json["Recovered"],
        active: json["Active"],
        date: DateTime.parse(json["Date"]),
      );

  Map<String, dynamic> toJson() => {
        "CountryCode": countryCodeValues.reverse[countryCode],
        "Confirmed": confirmed,
        "Deaths": deaths,
        "Recovered": recovered,
        "Active": active,
        "Date": date.toIso8601String(),
      };
}

enum Country { SOUTH_AFRICA }

final countryValues = EnumValues({"South Africa": Country.SOUTH_AFRICA});

enum CountryCode { ZA }

final countryCodeValues = EnumValues({"ZA": CountryCode.ZA});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
