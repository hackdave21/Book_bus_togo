class Annonce {
  final String imagePath;
  final String description;
  int likes;
  int dislikes;

  Annonce({
    required this.imagePath,
    required this.description,
    this.likes = 0,
    this.dislikes = 0,
  });
}
