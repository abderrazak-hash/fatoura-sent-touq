
class Branch {
  Branch({
    required this.id,
    required this.name,
    required this.activityId,
    required this.companyId,
    required this.adresse,
    required this.taxNumber,
    required this.taxValue,
    required this.commercialNumber,
    required this.status,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  int activityId;
  int companyId;
  dynamic adresse;
  String taxNumber;
  String taxValue;
  String commercialNumber;
  String status;
  String role;
  DateTime createdAt;
  DateTime updatedAt;

  factory Branch.fromJson(Map<String, dynamic> json) =>
      Branch(
        id: json["id"],
        name: json["name"],
        activityId: json["activity_id"],
        companyId: json["company_id"],
        adresse: json["adresse"],
        taxNumber: json["tax_number"],
        taxValue: json["tax_value"],
        commercialNumber: json["commercial_number"],
        status: json["status"],
        role: json["role"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

}