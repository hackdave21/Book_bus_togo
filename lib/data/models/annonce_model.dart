
import 'package:book_bus_togo/domain/entities/annonce.dart';

class AnnonceModel extends Annonce {
  AnnonceModel(
    {
      required super.imagePath,
      required super.description,
      required super.likes,
      required super.dislikes
    }
  );
}