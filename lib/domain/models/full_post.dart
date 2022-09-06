import 'package:equatable/equatable.dart';

class FullPost extends Equatable {
  const FullPost({
    this.urlImage,
    required this.title,
    required this.selftext,
    required this.rating,
    required this.countComments,
  });

  final String? urlImage;
  final String title;
  final String selftext;
  final int rating;
  final int countComments;

  factory FullPost.fromJson(Map<String, dynamic> json) {
    return FullPost(
      urlImage: !(json['thumbnail'] as String).contains('http')
          ? null
          : json['thumbnail'],
      title: json['title'] ?? '',
      selftext:
          (json['selftext'] != null && (json['selftext'] as String).isNotEmpty)
              ? json['selftext']
              : ' ',
      rating: json['ups'] ?? 0,
      countComments: json['num_comments'] ?? 0,
    );
  }

  @override
  List<Object> get props => [
        urlImage ?? '',
        title,
        rating,
        countComments,
      ];

  @override
  String toString() {
    return 'FullPost(urlImage: $urlImage, title: $title, selftext: $selftext, rating: $rating, countComments: $countComments,)';
  }
}
