import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import './variable/form-var.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white70,
          child : ListView(
              children:
              [
                Container(
                  margin: const EdgeInsets.only(top: 50),
                  child:  Center(
                    child: DefaultTextStyle(
                      style: const TextStyle(
                        fontSize: 60.0,
                        fontFamily: 'hurricane',
                        color: Colors.blue,
                      ),
                      child: AnimatedTextKit(
                          animatedTexts: [
                            TyperAnimatedText('Welcome to your app'),
                            TyperAnimatedText('Login to continue'),
                          ]
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 50),
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child:  Center(
                    child: Column(
                      children: const [
                        TextFieldForm()
                      ],
                    )
                  ),
                )
              ],
      )
      )
    );
  }
}


class TextFieldForm extends StatefulWidget {
  const TextFieldForm({Key? key}) : super(key: key);

  @override
  State<TextFieldForm> createState() => _TextFieldFormState();
}

class _TextFieldFormState extends State<TextFieldForm> {

  final _formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();

  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  @override

  Widget build(BuildContext context) {
     return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: firstNameController,
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              labelText: 'Full name',
            ),
          ),
          TextFormField(
            controller: userNameController,
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              hintText: 'Enter your username',
              labelText: 'Username',
            ),
            validator: (value) {
              if (value == null) {
                return 'Please enter some text';
              }
                   return null;
            },
          ),
          TextFormField(
            controller: passwordController,
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            decoration: const InputDecoration(
              icon: Icon(Icons.lock),
              hintText: 'Enter your password',
              labelText: 'Password',
            ),
            validator: (value) {
              if (value == null) {
                return 'Please enter some text';
              }
                  return null;
            },
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            child:ElevatedButton(
              onPressed: () {
              if(userNameController.text.isEmpty || passwordController.text.isEmpty)
                  {
                    Scaffold.of(context).showSnackBar(
                        SnackBar(
                            content: Text(
                                'Please enter your username and password'
                             )
                           )
                        );
                  }

              else
                {
                  Scaffold.of(context).showSnackBar(
                      SnackBar(
                          content: Text(
                              'Great! You are logged in'
                          )
                      )
                  );
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
