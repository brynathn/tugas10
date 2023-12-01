class Blog {
  final String merek;
  final String tipe;
  final String id;

  const Blog({
    required this.merek,
    required this.tipe,
    required this.id,
  });

  factory Blog.fromJson(Map<String, dynamic> json) {
    return Blog(
      merek:json['merek'],
      tipe:json['tipe'],
      id:json['id'],
    );
  }
}