class UserModel {
  final String uid;
  final String name;
  final String username;
  final String role; // 'faculty' | 'trainee' | 'admin'

  const UserModel({
    required this.uid,
    required this.name,
    required this.username,
    required this.role,
  });

  factory UserModel.fromMap(String uid, Map<String, dynamic> map) {
    return UserModel(
      uid: uid,
      name: map['name'] as String? ?? '',
      username: map['username'] as String? ?? '',
      role: map['role'] as String? ?? 'trainee',
    );
  }

  Map<String, dynamic> toMap() => {
        'name': name,
        'username': username,
        'role': role,
      };
}
