class EmployeeDetailsModel {
  int? id;
  String? name;
  String? username;
  String? email;
  String? profileImage;
  Address? address;
  String? phone;
  String? website;
  Company? company;

  EmployeeDetailsModel(
      {this.id,
      this.name,
      this.username,
      this.email,
      this.profileImage,
      this.address,
      this.phone,
      this.website,
      this.company});

  EmployeeDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    profileImage = json['profile_image'];
    address =
        json['address'] != null ? Address.fromJson(json['address']) : null;
    phone = json['phone'];
    website = json['website'];
    company =
        json['company'] != null ? Company.fromJson(json['company']) : null;
  }
}

class Address {
  String? street;
  String? suite;
  String? city;
  String? zipcode;
  Geo? geo;

  Address({this.street, this.suite, this.city, this.zipcode, this.geo});

  Address.fromJson(Map<String, dynamic> json) {
    street = json['street'];
    suite = json['suite'];
    city = json['city'];
    zipcode = json['zipcode'];
    geo = json['geo'] != null ? Geo.fromJson(json['geo']) : null;
  }
}

class Geo {
  String? lat;
  String? lng;

  Geo({this.lat, this.lng});

  Geo.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lng = json['lng'];
  }
}

class Company {
  String? name;
  String? catchPhrase;
  String? bs;

  Company({this.name, this.catchPhrase, this.bs});

  Company.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    catchPhrase = json['catchPhrase'];
    bs = json['bs'];
  }
}
