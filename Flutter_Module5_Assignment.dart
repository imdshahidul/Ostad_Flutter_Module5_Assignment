// Define an abstract named Role:
abstract class Role {
  void displayRole();
}

// B. Create a class Person:
class Person implements Role {
  String name;
  int age;
  String address;
  late Role role; // Reference to the Role abstract class

  Person({
    required this.name,
    required this.age,
    required this.address,
  });

  String get getName => name;
  int get getAge => age;
  String get getAddress => address;

  @override
  void displayRole() {
    // This will be implemented by subclasses
  }
}

// C. Create a class Student that extends Person
class Student extends Person {
  String studentID;
  String grade;
  List<double> courseScores;

  Student({
    required String name,
    required int age,
    required String address,
    required this.studentID,
    required this.grade,
    required this.courseScores,
  }) : super(name: name, age: age, address: address);

  @override
  void displayRole() {
    print('Role: Student');
  }

  // Method to calculate average score
  double calculateAverageScore() {
    if (courseScores.isEmpty) return 0.0;
    double sum = courseScores.reduce((a, b) => a + b);
    return sum / courseScores.length;
  }
}

// D. Create a class Teacher that extends Person
class Teacher extends Person {
  String teacherID;
  List<String> coursesTaught;

  Teacher({
    required String name,
    required int age,
    required String address,
    required this.teacherID,
    required this.coursesTaught,
  }) : super(name: name, age: age, address: address);

  @override
  void displayRole() {
    print('Role: Teacher');
  }

  // Method to display courses taught
  void displayCoursesTaught() {
    print('Courses Taught:');
    for (var course in coursesTaught) {
      print('- $course');
    }
  }
}

// E. Create a class StudentManagementSystem
class StudentManagementSystem {
  
  void display() {
    
    var student = Student(
      name: 'John Doe',
      age: 20,
      address: '123 Main St',
      studentID: 'S-96785',
      grade: 'A',
      courseScores: [90, 85, 82],
    );

    var teacher = Teacher(
      name: 'Mrs. Smith',
      age: 35,
      address: '456 Oak St',
      teacherID: 'T-34567',
      coursesTaught: ['Math', 'English', 'Bangla'],
    );

   
    print('Student Information:');
    student.displayRole();
    print('Name: ${student.getName}');
    print('Age: ${student.getAge}');
    print('Address: ${student.getAddress}');
    double averageScore = student.calculateAverageScore();
    print("Average Score: ${averageScore.toStringAsFixed(2)}\n");
    
    
    print('Teacher Information:');
    teacher.displayRole();
    print('Name: ${teacher.getName}');
    print('Age: ${teacher.getAge}');
    print('Address: ${teacher.getAddress}');
    teacher.displayCoursesTaught();
  }
}

void main() {
 
  StudentManagementSystem system = StudentManagementSystem();
  system.display();
}