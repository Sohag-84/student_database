import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        //accentColor: Colors.cyan
      ),
      home: const NewApp(),
    );
  }
}
class NewApp extends StatefulWidget {
  const NewApp({Key? key}) : super(key: key);

  @override
  State<NewApp> createState() => _NewAppState();
}

class _NewAppState extends State<NewApp> {

  final _form = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _programIdController = TextEditingController();
  final TextEditingController _gpaController = TextEditingController();


  //for clear textField
  void clearText(){
    _nameController.clear();
    _idController.clear();
    _programIdController.clear();
    _gpaController.clear();
  }
  //
  // // for validate form
  // void _formValid(){
  //   final isValid = _form.currentState!.validate();
  //   if(!isValid){
  //     return;
  //   }
  // }

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
    this.studentGPA = studentGPA;
  }



  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Student database"),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0,right: 15),
              child: Form(
                key: _form,
                child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: TextFormField(
                          // validator: (name){
                          //   if(name!.isEmpty || name.length<3){
                          //     return "Enter a valid name more than 3 character";
                          //   }else{
                          //     return null;
                          //   }
                          // },
                          controller: _nameController,
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
                          controller: _idController,
                          // validator: (studentId){
                          //   if(studentId!.isEmpty || studentId.length<9){
                          //     return "Enter a valid student ID more than 9 character";
                          //   }else{
                          //     return null;
                          //   }
                          // },
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
                          controller: _programIdController,
                          // validator: (courseId){
                          //   if(courseId!.isEmpty || courseId.length<6){
                          //     return "Enter a valid course code more than 6 character";
                          //   }else{
                          //     return null;
                          //   }
                          // },
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(13)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(13)),
                                  borderSide: BorderSide(color: Colors.green,width: 2)
                              ),
                              labelText: "Course Code",
                              hintText: 'Course Code'
                          ),
                          onChanged: (String programID){
                            getProgramID(programID);
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: TextFormField(
                          controller: _gpaController,
                          validator: (studentGpa){
                            if(studentGpa!.isEmpty || studentGpa.length<3){
                              return "Enter a valid name more than 3 character";
                            }else{
                              return null;
                            }
                          },
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
                      SizedBox(height: height*0.02,),
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
                      ),
                      SizedBox(height: height*0.013,),
                      Row(
                        children: const [
                          Expanded(child: Text("Name")),
                          Expanded(child: Text("Student ID")),
                          Expanded(child: Text("Course Code")),
                          SizedBox(width: 6,),
                          Expanded(child: Text("CGPA")),
                        ],
                      ),
                      SizedBox(height: height*0.02,),
                      StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance.collection("Mystudent").snapshots(),
                          builder: (context,snapshot) {
                            if(snapshot.hasData){
                              return ListView.builder(
                                shrinkWrap: true,
                                itemCount: snapshot.data!.docs.length,
                                itemBuilder: (BuildContext context, int index) {
                                  DocumentSnapshot document = snapshot.data!.docs[index];
                                  return Row(
                                    children: [
                                      Expanded(child: Text(document["studentName"])),
                                      Expanded(child: Text(document["studentID"])),
                                      Expanded(child: Text(document["programID"])),
                                      Expanded(child: Text(document["studentGPA"])),

                                    ],
                                  );
                                },
                              );
                            }else{
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          })
                    ]
                ),
              ),
            ),
          ],
        )
      ),
    );
  }



  insertData() {
      DocumentReference documentReference = FirebaseFirestore.instance.collection("Mystudent").doc(studentID);

      //create map
      Map<String, dynamic> student = {
        "studentName": studentName,
        "studentID": studentID,
        "programID": programID,
        "studentGPA": studentGPA
      };
      documentReference.set(student).whenComplete(() => print("$studentID created"));
      clearText();

  }
  readData() {
    DocumentReference documentReference = FirebaseFirestore.instance.collection("Mystudent").doc(studentID);
    documentReference.get().then((value){
      print(value.get("studentID"));
      print(value.get("studentName"));

      print(value.get("programID"));
      print(value.get("studentGPA"));

    });
    clearText();
  }
  updateData() {
    DocumentReference documentReference = FirebaseFirestore.instance.collection("Mystudent").doc(studentID);

    //create map
    Map<String, dynamic> student = {
      "studentName": studentName,
      "studentID": studentID,
      "programID": programID,
      "studentGPA": studentGPA
    };
    documentReference.set(student).whenComplete(() => print("$studentName is updated"));
    clearText();
  }
  deleteData() {
    DocumentReference documentReference = FirebaseFirestore.instance.collection("Mystudent").doc(studentID);

    documentReference.delete().whenComplete(() => print("$studentID is deleted successfully"));
    clearText();
  }
}

