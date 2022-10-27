class Pupils {
  final String name;
  final String age;
  final String course;
  final String score;
  Pupils({
    required this.age,
    required this.course,
    required this.name,
    required this.score,
  });
}

List<Pupils> addPupils() {
  List<Pupils> pupils = [];
  pupils.add(
    Pupils(age: "19", course: "2", name: "David", score: "4.4"),
  );
  pupils.add(
    Pupils(age: "22", course: "4", name: "Steve", score: "2.4"),
  );
  pupils.add(
    Pupils(age: "18", course: "1", name: "Jack", score: "3.4"),
  );
  pupils.add(
    Pupils(age: "24", course: "5", name: "Mack", score: "4.8"),
  );
  return pupils;
}

class ChartData {
  final String name;
  final double percent;
  ChartData({
    required this.name,
    required this.percent,
  });
}
