class newsmodel {
  final String title;
  final String description;
  final String imgUrl;

  newsmodel({
    required this.title,
    required this.description,
    required this.imgUrl,
  });

  // Adjusted to directly parse the JSON of a single article
  factory newsmodel.fromJson(Map<String, dynamic> json) {
    return newsmodel(
      title: json["title"] ?? 'none', 
      description: json["description"] ?? 'nono', // Provide a default value in case it is null
      imgUrl: json["urlToImage"] ?? 'non', // Provide a default value in case it is null
    );
  }
}
