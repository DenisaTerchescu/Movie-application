import 'package:flutter/material.dart';
import 'package:login/services/auth.dart';

class Register extends StatefulWidget {

  Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();

}

class _RegisterState extends State<Register> {
  @override
  final AuthService _auth = AuthService();
  String email='';
  String password='';
  String error='';

  final _formKey=GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.green[400],

          title: Text('Register'),
          actions: <Widget>[
            TextButton.icon(
                onPressed: ()
                {
                  widget.toggleView();

                },
                icon: Icon(Icons.person, color: Colors.black),
                label: Text('Sign in',
                style: TextStyle(
                  color: Colors.black
                ),))
          ],
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,


                children: [
                  Text(
                    "Please provide credentials",
                    style: TextStyle(
                      color: Colors.grey[500],
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 30.0),
                      child: Form(
                        key:_formKey,
                          child: Column(
                            children: <Widget>[
                              SizedBox(height:20),

                              SizedBox(
                                  height: 70.0,
                                  child:TextFormField(
                                      decoration: InputDecoration(
                                        hintText: "Email",
                                        prefixIcon: Icon(Icons.mail),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        )),
                                    validator: (val) => val.isEmpty ? "Enter an email": null ,
                                    onChanged: (value)
                                    {
                                      setState(() => email=value);

                                    },
                                  )
                              ),
                              SizedBox(height:5),
                              SizedBox(
                                height:70.0,

                                child: TextFormField(
                                  decoration: InputDecoration(
                                    hintText: "Password",
                                    prefixIcon: Icon(Icons.vpn_key),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  validator: (val) => val.length < 6 ? "Enter a password long enough": null ,
                                  obscureText: true,
                                  onChanged: (value)
                                  {
                                    setState(() => password=value);
                                  },
                                ),
                              ),

                              SizedBox(height: 30.0),
                              MaterialButton(
                                  onPressed: () async {
                                    if(_formKey.currentState.validate())
                                      if(_formKey.currentState.validate())
                                      {
                                        dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                                        if (result == null)
                                        {
                                          setState(() => error="Error registering, please try again");

                                        }

                                      }

                                  },
                                  height:50,
                                  minWidth: double.infinity,
                                  color: Theme.of(context).primaryColor,
                                  textColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)
                                  ),
                                  child: Text(
                                      "Register",
                                      style:TextStyle(
                                        fontWeight: FontWeight.bold,

                                      )
                                  )),


                              SizedBox(height:10),
                              Text(error),
                            ],
                          ))
                  ),
                ],
              ),
            ),
          ),
        )

    );
  }
}
