class Mentor {
  final int id;
  final String name;
  final String thumbnail;
  final String divisi;
  final String phone;

  Mentor({
    required this.id,
    required this.name,
    required this.thumbnail,
    required this.divisi,
    required this.phone,
  });

  factory Mentor.fromJson(Map<String, dynamic> json, int id) {
    return Mentor(
      id: id,
      name:
          "${json['name']?['first'] ?? 'Unknown'} ${json['name']?['last'] ?? ''}"
              .trim(),
      thumbnail:
          json['picture']?['large'] ?? "https://example.com/placeholder.png",
      divisi: _getDivisiById(id),
      phone: json['phone'] ?? '000000000000', // Default jika tidak tersedia
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'thumbnail': thumbnail,
      'divisi': divisi,
      'phone': phone,
    };
  }

  static String _getDivisiById(int id) {
    List<String> divisiList = [
      "UI/UX",
      "Mobile Programmer",
      "Digital Bisnis",
      "UI/UX",
      "Mobile Programmer"
    ];
    return divisiList[id % divisiList.length];
  }
}
