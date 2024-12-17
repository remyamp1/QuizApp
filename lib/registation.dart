import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class RegisterExample extends StatefulWidget {
  const RegisterExample  ({super.key});

  @override
  State <RegisterExample> createState() =>  _RegisterExampleState();
}

class  _RegisterExampleState extends State <RegisterExample> {

   TextEditingController usernameController =TextEditingController();
  TextEditingController passwordComtroller =TextEditingController();
  String _registrationMessage='';
  Future<void> _register() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String username=usernameController.text;
    String password = passwordComtroller.text;

    if (username.isNotEmpty && password.isNotEmpty){
      await prefs.setString('username',username);
       await prefs.setString('password',password);
       setState(() {
         _registrationMessage='Registration Successful!';
       });
    } 
    else {
      setState(() {
        
        _registrationMessage='Please Fill in both fielde!';
      });
    }
        
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
        padding: EdgeInsets.symmetric(vertical: 30),
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topCenter
          ,colors:<Color>[
            const Color.fromARGB(255, 172, 208, 236),
            Colors.blue,
            const Color.fromARGB(255, 2, 69, 124)
          ]
          )
        ),
      
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 80),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Resister",
                  style: TextStyle(fontSize: 40,
                  color: Colors.white,fontWeight: FontWeight.bold
                  ),
                  )
                ],
              ),
            ),
      
            Expanded(child: 
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60),
                  topRight: Radius.circular(60),
                  bottomLeft: Radius.circular(60),
                  bottomRight: Radius.circular(60),
                )
              ),
      
              child: Padding(padding: const EdgeInsets.symmetric(
                horizontal: 15,vertical: 15
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Text("User Name",style: TextStyle(fontSize: 15,color: Colors.black,
                  fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,),
                  SizedBox(height: 10),
                  TextField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      )
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: passwordComtroller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),
                      )
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 15),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                  ),
                  SizedBox(height: 60),
                  SizedBox(height: 50,
                  width: double.infinity,
                  child: ElevatedButton(onPressed: _register,style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ), child:Text("Register",
                  style: TextStyle(color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
                  ),
                  ),
                  ),
                  Center(child: Text(_registrationMessage)),
                  SizedBox(height: 20),
                 TextButton(onPressed: (){
                  Navigator.pop(context);
                 }, child: Text("Go to Login"))
                ]
              ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}