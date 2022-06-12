class BookModel {
  final int? id;
  final String? title;
  final String? author;
  final String? genre;
  final String? description;
  final String? isbn;
  final String? image;
  final String? published;
  final String? publisher;

  BookModel(
      {this.id,
        this.title,
        this.author,
        this.genre,
        this.description,
        this.isbn,
        this.image,
        this.published,
        this.publisher});

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      id: json["id"],
      title: json["title"],
      author: json["author"],
      genre: json["genre"],
      description: json["description"],
      isbn: json["isbn"],
      image: json["image"],
      published: json["published"],
      publisher: json["publisher"],
    );
  }
}
