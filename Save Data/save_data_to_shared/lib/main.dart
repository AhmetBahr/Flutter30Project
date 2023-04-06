import 'package:flutter/material.dart';
import 'package:save_data_to_shared/models.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState () => _MyAppState();
}

class _MyAppState extends State<MyApp>{
  final _usernameController = TextEditingController();
  var _selectGender =  Gender.FEMALE;
  var _selectPrograminLangue = Set<PrograminLangue>();
  var _isEmployed = false; 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amberAccent,
          title: Text("User Settings",),
        ),
        body:  ListView(
          children: [
            ListTile(
              title: TextField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: "Username"),
                
              ),
            ),    
           RadioListTile(
            title: Text('Female'),
            value:  Gender.FEMALE,
            groupValue: _selectGender,
            onChanged: (newValue) => setState(() => _selectGender = newValue),
           ),
           RadioListTile(
            title: Text('Male'),
            value:  Gender.MALE,
            groupValue: _selectGender,
            onChanged: (newValue) => setState(() => _selectGender = newValue),
           ),
           RadioListTile(
            title: Text('Other'),
            value:  Gender.OTHER,
            groupValue: _selectGender,
            onChanged: (newValue) => setState(() => _selectGender = newValue),
           ),
  /* ================================== CHECKBOX ================================= */
           CheckboxListTile(
            title: Text("Dart"),
            value: _selectPrograminLangue.contains(PrograminLangue.DART),
            onChanged: (_) {
              setState(() {
                _selectPrograminLangue.contains(PrograminLangue.DART)
                 ? _selectPrograminLangue.remove(PrograminLangue.DART)
                 : _selectPrograminLangue.add(PrograminLangue.DART);
              });
            }
          ),
           CheckboxListTile(
            title: Text("Java"),
            value: _selectPrograminLangue.contains(PrograminLangue.JAVA),
            onChanged: (_) {
              setState(() {
                _selectPrograminLangue.contains(PrograminLangue.JAVA)
                 ? _selectPrograminLangue.remove(PrograminLangue.JAVA)
                 : _selectPrograminLangue.add(PrograminLangue.JAVA);
              });
            }
          ),
           CheckboxListTile(
            title: Text("C#"),
            value: _selectPrograminLangue.contains(PrograminLangue.CSHARP),
            onChanged: (_) {
              setState(() {
                _selectPrograminLangue.contains(PrograminLangue.CSHARP)
                 ? _selectPrograminLangue.remove(PrograminLangue.CSHARP)
                 : _selectPrograminLangue.add(PrograminLangue.CSHARP);
              });
            }
          ),
           CheckboxListTile(
            title: Text("C++"),
            value: _selectPrograminLangue.contains(PrograminLangue.CPP),
            onChanged: (_) {
              setState(() {
                _selectPrograminLangue.contains(PrograminLangue.CPP)
                 ? _selectPrograminLangue.remove(PrograminLangue.CPP)
                 : _selectPrograminLangue.add(PrograminLangue.CPP);
              });
            }
          ),
         // ============================= SWITCH LIST ======================== //

          SwitchListTile(
            title: Text("Is Employed"),
            value: _isEmployed, 
            onChanged: (newValue) => setState(() => _isEmployed = newValue)
          ),
            

          TextButton(
          onPressed: _saveSettings , 
          child: Text("Save Settings")
        )

          ],
        ),
   

      ));

  }
  

  void _saveSettings(){
    final newSettings = Settings(
      username: _usernameController.text, 
      gender: _selectGender, 
      progrmainLanguages: _selectPrograminLangue, 
      isEmployed: _isEmployed);

    print(newSettings.username);
  }

}