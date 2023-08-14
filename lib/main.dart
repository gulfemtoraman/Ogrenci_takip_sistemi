import 'package:flutter/material.dart';
import 'package:flutter_widget/models/student.dart';
import 'package:flutter_widget/screens/student_add.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Student seciliOgrenci = Student.withId(0, "", "", 0);

  String baslik = "Öğrenci Takip Sistemi";

  var students = [
    Student.withId(1,"Gülfem", "Toraman", 50),
    Student.withId(2,"Beyzanur", "Kesici", 30),
    Student.withId(3,"Enes", "Mağat", 45)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(baslik),
      ),
      body: buildBody(context),
    );
  }

  void mesajGoster(BuildContext context, String mesaj) {
    var alert = AlertDialog(
      title: Text("İşlem sonucu"),
      content: Text(mesaj),
    );
    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  Widget buildBody(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: const CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://cdn.pixabay.com/photo/2023/07/04/10/35/sheep-8106018_1280.jpg"),
                    ),
                    title: Text(students[index].firstName +
                        " " +
                        students[index].lastName),
                    subtitle: Text("Sınavdan aldığı not: " +
                        students[index].not.toString() +
                        "  [" +
                        students[index].getDurum +
                        "]"),
                    trailing: buildStatusIcon(students[index].not),
                    onTap: () {
                      setState(() {
                        seciliOgrenci = students[index];
                      });
                      print(seciliOgrenci);
                    },
                  );
                })),
        Text("Seçili öğrenci: " + seciliOgrenci.firstName),
        Row(
          children: [
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                ),
                child: const Row(
                  children: [
                    Icon(Icons.add),
                    SizedBox(width: 1.0,),
                    Text("Yeni Öğrenci"),
                  ],
                ),
                onPressed: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>StudentAdd(students)));
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: ElevatedButton(
                child: const Row(
                  children: [
                    Icon(Icons.update),
                    SizedBox(width: 7.0,),
                    Text("Güncelle"),
                  ],
                ),
                onPressed: () {
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.redAccent,
                ),
                child: const Row(
                  children: [
                    Icon(Icons.delete),
                    SizedBox(width: 17.0,),
                    Text("Sil"),
                  ],
                ),
                onPressed: () {
                  setState(() {
                    students.remove(seciliOgrenci);
                  });
                  var mesaj = "Silindi : "+seciliOgrenci.firstName;
                  mesajGoster(context, mesaj);
                },
              ),
            )
          ],
        )
      ],
    );
  }

  Widget buildStatusIcon(int not) {
    if (not >= 50) {
      return Icon(Icons.done);
    } else if (not >= 40) {
      return Icon(Icons.album);
    } else {
      return Icon(Icons.clear);
    }
  }
}
