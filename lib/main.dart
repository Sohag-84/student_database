import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
        brightness: Brightness.light,
        accentColor: Colors.cyan
      ),
      home: NewApp(),
    );
  }
}
class NewApp extends StatefulWidget {
  const NewApp({Key? key}) : super(key: key);

  @override
  State<NewApp> createState() => _NewAppState();
}

class _NewAppState extends State<NewApp> {

  late String studentName,studentID,programID,studentGPA;

  getStudentName(name){
    studentName = name;
  }
  getStudentID(studentID){
    this.studentID = studentID;
  }
  getProgramID(programID){
    this.programID = programID;
  }
  getStudentGPA(studentGPA){
    this.studentGPA = double.parse(studentGPA) as String;
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Student database"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 15.0,right: 15),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(13)),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(13)),
                          borderSide: BorderSide(color: Colors.green,width: 2)
                      ),
                      labelText: "Name",
                      hintText: 'Student name'
                  ),
                  onChanged: (String name){
                    getStudentName(name);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(13)),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(13)),
                          borderSide: BorderSide(color: Colors.green,width: 2)
                      ),
                      labelText: "Student ID",
                      hintText: 'Student ID'
                  ),
                  onChanged: (String studentId){
                    getStudentID(studentId);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(13)),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(13)),
                        borderSide: BorderSide(color: Colors.green,width: 2)
                    ),
                    labelText: "Program ID",
                    hintText: 'Program ID'
                  ),
                  onChanged: (String programID){
                    getProgramID(programID);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(13)),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(13)),
                        borderSide: BorderSide(color: Colors.green,width: 2)
                    ),
                    labelText: "GPA",
                    hintText: 'Student GPA'
                  ),
                  onChanged: (String gpa){
                    getStudentGPA(gpa);
                  },
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.02,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: ()=>insertData(),
                      child: const Text("INSERT"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      )
                    ),
                  ),
                  ElevatedButton(
                      onPressed: ()=>readData(),
                      child: const Text("READ"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      )
                    ),
                  ),
                  ElevatedButton(
                      onPressed: ()=>updateData(),
                      child: const Text("UPDATE"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blueGrey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      )
                    ),
                  ),
                  ElevatedButton(
                      onPressed: ()=>deleteData(),
                      child: const Text("DELETE"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.redAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      )
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  insertData() {print("inserted data");}
  readData() {print("read data");}
  updateData() {print("updated data");}
  deleteData() {print("deleted data");}
}

