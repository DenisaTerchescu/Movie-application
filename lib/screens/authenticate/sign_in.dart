
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:login/services/auth.dart';

class SignIn extends StatefulWidget {
  Function toggleView;

  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  String email='';
  String password='';
  String error='';
  final _formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height:70
                ),
                Text(
                  "Welcome back",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.green[500],
                  ),
                ),
                SizedBox(height:5),
                Text(
                  "Please sign in to continue",
                  style: TextStyle(
                    color: Colors.grey,
                  ),

                ),

                Container(
                  padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 30.0),
                  child: Form(
                      key:_formKey,
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 70.0,
                            child:TextFormField(
                              decoration: InputDecoration(
                                hintText: "Email",
                                prefixIcon: Icon(Icons.mail),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),



                              ),
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
                                {
                                  dynamic result = await _auth.signInWithEmailAndPassword(email, password);

                                  if (result == null)
                                  {
                                    setState(() => error="Error signing in, please try again");
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
                            "Sign in",
                            style:TextStyle(
                              fontWeight: FontWeight.bold,

                            )
                          )),

                          SizedBox(height:20),
                          Row(
                            children: [
                              Text("Don't have an account?"),
                              TextButton(
                                onPressed: () async
                                {
                                  widget.toggleView();
                                },
                                child: Text(
                                  "Sign up here",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                )


                              ),
                            ],
                          ),

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
