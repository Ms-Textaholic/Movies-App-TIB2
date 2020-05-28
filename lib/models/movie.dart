// Movie => Movies

class Movie {
  final String title;
  final String year;
  final String type;
  final String poster;
  final String imdbRating;
  final String genre;

  Movie({this.genre, this.title, this.year, this.type, this.poster, this.imdbRating});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        title: json['Title'],
        genre: json['Genre'],
        year: json['Year'],
        type: json['Type'],
        poster: json['Poster'],
        imdbRating: json['imdbID']);
  }
}