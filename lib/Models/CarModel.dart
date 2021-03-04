import 'dart:convert' as casts;
//Carmodels welcomeFromJson(String str) => Carmodels.fromJson(json.decode(str));

//String welcomeToJson(Carmodels data) => json.encode(data.toJson());

class Carmodels {
  Carmodels({
    this.id,
    this.avatar,
    this.fullName,
    this.createdAt,
    this.gender,
    this.colors,
    this.countries,
  });

  final String id;
  final String avatar;
  final String fullName;
  final String createdAt;
  final String gender;
  final List<String> colors;
  final List<String> countries;

  factory Carmodels.fromJson(Map<String, dynamic> json) {
    var streetsFromservers = json["colors"] as List;
    var streetsFromserver = json["countries"] as List;
    List<String> colorsList = streetsFromservers.cast<String>();
    List<String> countryList = streetsFromserver.cast<String>();
    return Carmodels(
      id: json["id"],
      avatar: json["avatar"],
      fullName: json["fullName"],
      createdAt: json["createdAt"],
      gender: json["gender"],
      colors: colorsList,
      countries: countryList,
    );
  }

  // Map<String, dynamic> toJson() => {
  //       "id": id,
  //       "avatar": avatar,
  //       "fullName": fullName,
  //       "createdAt": createdAt,
  //       "gender": gender,
  //       "colors": List<dynamic>.from(colors.map((x) => x)),
  //       "countries": List<dynamic>.from(countries.map((x) => x)),
  //     };
  static List<String> Passstrings(jsasonstring) {
    List<String> stringdata = new List<String>.from(jsasonstring);
    return stringdata;
  }
}
