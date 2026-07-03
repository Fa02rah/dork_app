// lib/models/search_item_model.dart
class SearchItem {
  final int id;
  final String title;
  final String subtitle;
  final String image;
  final String type; // هل هو 'business' أم 'service'

  SearchItem({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.type
  });
}