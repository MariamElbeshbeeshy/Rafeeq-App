class UserDataModel {
  final String id;
  final String firstName;
  final String lastName;
  final String birthDate;
  final String? gender;
  final String nationalityId;
  final String? image;
  final int level;
  final int points;
  final String token;

  UserDataModel(
    {required this.id, 
    required this.firstName,
    required this.lastName,
    required this.birthDate,
    this.gender,
    required this.nationalityId,
    this.image,
    required this.level,
    required this.token, required this.points}
    );

    factory UserDataModel.fromJson(Map<String , dynamic>json){
      return UserDataModel(
      id: json['id'],
      firstName: json['firstName'], 
      lastName: json['lastName'],
      birthDate: json['birthDate'],
      gender: json['gender'] ?? 0,
      nationalityId: json['nationalityId'],
      image: json['image'] ?? '',
      level: json['level'],
      token: json['token'], 
      points: json['points'],

      );
    }
  

}