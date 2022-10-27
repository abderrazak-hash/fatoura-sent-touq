class Shfit {
  Shfit({
    required this.id,
    required this.numberDeviceUser,
    required this.brancheId,
    required this.deviceId,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.usedBy,
    required this.status,
  });

  int id;
  String numberDeviceUser;
  int brancheId;
  int deviceId;
  int userId;
  DateTime createdAt;
  DateTime updatedAt;
  String name;
  String usedBy;
  String status;

  factory Shfit.fromJson(Map<String, dynamic> json) => Shfit(
        id: json["id"],
        numberDeviceUser: json["number_DeviceUser"],
        brancheId: json["branche_id"],
        deviceId: json["device_id"],
        userId: json["user_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        name: json["name"],
        usedBy: json["usedBy"],
        status: json["status"],
      );
}
