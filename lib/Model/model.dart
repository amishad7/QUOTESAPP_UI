class Objects {
  String? author;
  String? title;
  String? quote;
  int? id;

  Objects({
    required this.author,
    required this.title,
    required this.quote,
    required this.id,
  });

  factory Objects.fromMapData(Map data) {
    return Objects(
        author: data['author'],
        title: data['title'],
        quote: data['quote'],
        id: data['id']);
  }
}
