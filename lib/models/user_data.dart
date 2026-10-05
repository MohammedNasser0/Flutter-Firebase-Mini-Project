class UserData {
  final String id;
  final String name;
  final int age;
  final String favouriteHobby;

  const UserData({
    required this.id,
    required this.name,
    required this.age,
    required this.favouriteHobby,
  });

  factory UserData.fromFirestore(String documentId, Map<String, dynamic> data) {
    return UserData(
      id: documentId,
      name: data['name'] as String? ?? '',
      age: data['age'] as int? ?? 0,
      favouriteHobby: data['favouriteHobby'] as String? ?? '',
    );
  }
}
