
import 'package:flutter/material.dart';
import 'package:login/models/user.dart';
import 'package:login/screens/authenticate/authenticate.dart';
import 'package:login/screens/home/home.dart';
import 'package:provider/provider.dart';


class Wrapper extends StatelessWidget {
  const Wrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user= Provider.of<AppUser>(context);
    if(user == null)
      {
        return Authenticate();
      }
    else
    {
      return Home();
    }

  }
}
