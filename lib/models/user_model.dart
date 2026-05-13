enum UserRole { admin, treasurer, agent, contributor }

class UserModel {
  final String id;
  final String name;
  final String phone;
  final UserRole role;
  final double balance;
  final String? agentId;
  final String? grantedBy;

  UserModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.role,
    required this.balance,
    this.agentId,
    this.grantedBy,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'role': role.name,
      'balance': balance,
      'agentId': agentId,
      'grantedBy': grantedBy,
    };
  }

  factory UserModel.fromMap(String id, Map<String, dynamic> map) {
    return UserModel(
      id: id,
      name: map['name'],
      phone: map['phone'],
      role: UserRole.values.firstWhere((e) => e.name == map['role']),
      balance: (map['balance'] ?? 0).toDouble(),
      agentId: map['agentId'],
      grantedBy: map['grantedBy'],
    );
  }
}
