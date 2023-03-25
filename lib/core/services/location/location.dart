class Location {
  final double latitute;
  final double longitude;

  Location(this.latitute, this.longitude);

  @override
  bool operator ==(covariant Location other) {
    if (identical(this, other)) return true;

    return other.latitute == latitute && other.longitude == longitude;
  }

  @override
  int get hashCode => latitute.hashCode ^ longitude.hashCode;
}
