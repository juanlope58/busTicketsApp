class Company {
  int id;
  String companyName;

  Company({
    required this.id,
    required this.companyName,
  });

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      id: json['id'],
      companyName: json['company_name'],
    );
  }
}