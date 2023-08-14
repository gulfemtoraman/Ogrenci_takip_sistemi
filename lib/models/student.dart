class Student {
  late int id;
  late String firstName;
  late String lastName;
  late int not;
  late String _durum;

  Student.withId(int id,String firstName, String lastName, int not) {
    this.id = id;
    this.firstName = firstName;
    this.lastName = lastName;
    this.not = not;
  }

  Student(String firstName, String lastName, int not) {
    this.id = id;
    this.firstName = firstName;
    this.lastName = lastName;
    this.not = not;
  }

  Student.withoutInfo(){

  }

  String get getFirstName {
    return "OGR - " + this.firstName;
  }

  void set setFirstName(String value){
    this.firstName = value;
  }

  String get getDurum{
    String mesaj = " ";
    if (this.not >= 50) {
      mesaj = "Geçti.";
    } else if (this.not >= 40) {
      mesaj = "Bütünlemeye kaldı.";
    } else {
      mesaj = "Kaldı.";
    }
    return mesaj;
  }
}
