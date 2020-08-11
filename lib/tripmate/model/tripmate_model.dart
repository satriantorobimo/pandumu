class TripMateModel {
  String name;
  String username;
  String nameTrip;
  String type;

  TripMateModel(this.name, this.username, this.nameTrip, this.type);

  @override
  String toString() {
    return '{ ${this.name}, ${this.username}, ${this.nameTrip}, ${this.type} }';
  }
}
