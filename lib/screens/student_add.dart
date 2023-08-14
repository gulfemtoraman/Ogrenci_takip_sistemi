import 'package:flutter/material.dart';
import 'package:flutter_widget/models/student.dart';
import 'package:flutter_widget/validation/student_validator.dart';

class StudentAdd extends StatefulWidget {
  final List<Student> students;
  StudentAdd(this.students);
  @override
  _StudentAddState createState() => _StudentAddState();
}

class _StudentAddState extends State with StudentValidationMixin {

  late List<Student> students;

  var student = Student.withoutInfo();
  var formKey = GlobalKey<FormState>();


  StudentAdd(List<Student> students){
    this.students = students;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Yeni öğrenci ekle"),
      ),
      body: Container(
        margin: const EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              buildFirstNameField(),
              buildLastNameField(),
              buildGradeField(),
              buildSubmitButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFirstNameField() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: "Öğrenci adı: ",
        hintText: "Gülfem",
      ),
      validator: validateFirtName,
      onSaved: (String? value) {
        student.firstName = value!;
      },
    );
  }

  Widget buildLastNameField() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: "Öğrenci soyadı: ",
        hintText: "Toraman",
      ),
      validator: validateLastName,
      onSaved: (String? value) {
        student.lastName = value!;
      },
    );
  }

  Widget buildGradeField() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: "Aldığı not: ",
        hintText: "65",
      ),
      validator: validateGrade,
      onSaved: (String? value) {
        student.not = int.parse(value!);
      },
    );
  }

  Widget buildSubmitButton() {
    return ElevatedButton(
      child: const Text("Kaydet"),
      onPressed: () {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
          students.add(student);
          saveStudent();
          Navigator.pop(context);
        }
      },
    );
  }

  void saveStudent() {

    print(student.firstName);
    print(student.lastName);
    print(student.not);
  }
}
