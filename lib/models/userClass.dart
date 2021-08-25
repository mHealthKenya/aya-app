class User {
    User({
        this.indexNo,
        this.name,
        this.idNumber,
        this.passportNumber,
        this.birthCertNo,
    });

    String indexNo;
    String name;
    String idNumber;
    String passportNumber;
    String birthCertNo;

    factory User.fromJson(Map<String, dynamic> json) => User(
      indexNo: json["IndexNo"],
      name: json["Name"],
      idNumber: json["IdNumber"],
      passportNumber: json["PassportNumber"],
      birthCertNo: json["BirthCertNo"],
    );

    Map<String, dynamic> toJson() => {
      "indexNo": indexNo,
      "Name": name,
      "IdNumber": idNumber,
      "PassportNumber": passportNumber,
      "BirthCertNo": birthCertNo,
    };

}