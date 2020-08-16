import 'package:flutter/material.dart';

class Auth extends StatefulWidget {
  final _authMode;

  Auth(this._authMode);

  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  final _authForm = GlobalKey<FormState>();
  final _passwordFocusNode = FocusNode();
  final _confirmPasswordFocusNode = FocusNode();

  Map<String, String> _authData = {
    'mobile': '',
    'password': '',
    'confirmPassword': ''
  };

  void _saveAuthForm() {
    final isValid = _authForm.currentState.validate();
    if (isValid) {
      _authForm.currentState.save();
      print(_authData);

      if (widget._authMode == 'login') {
        print('login');
      } else {
        print('register');
      }
    }
  }

  Widget buildTextInput(
    String key,
    IconData icon,
    String labelText,
    TextInputType textInputType,
    TextInputAction textInputAction,
    String validatorMsg,
    FocusNode focusNode,
    Function onSaved,
  ) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: const Color.fromRGBO(119, 119, 255, 0.5),
          ),
        ),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: Color.fromRGBO(0, 0, 0, 0.5),
            size: 20,
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: labelText,
                  labelStyle: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 0.5),
                  ),
                  border: InputBorder.none,
                ),
                keyboardType: textInputType,
                textInputAction: textInputAction,
                focusNode: focusNode,
                obscureText: key != 'mobile' ? true : false,
                validator: (value) {
                  return value.isEmpty ? validatorMsg : null;
                },
                onFieldSubmitted: (_) {
                  if (textInputAction == TextInputAction.next) {
                    FocusScope.of(context).requestFocus(_passwordFocusNode);
                  } else if (textInputAction == TextInputAction.done) {
                    _saveAuthForm();
                  }
                },
                onSaved: onSaved,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 41.5),
      child: Form(
        key: _authForm,
        child: Column(
          children: [
            buildTextInput(
                'mobile',
                Icons.smartphone,
                'Enter Mobile No.',
                TextInputType.numberWithOptions(signed: true),
                TextInputAction.next,
                'Mobile No. is required',
                null, (value) {
              _authData = {
                'mobile': value,
                'password': _authData['password'],
                'confirmPassword': _authData['confirmPassword'],
              };
            }),
            buildTextInput(
                'password',
                Icons.lock,
                'Password',
                TextInputType.text,
                TextInputAction.next,
                'Password is required',
                _passwordFocusNode, (value) {
              _authData = {
                'mobile': _authData['mobile'],
                'password': value,
                'confirmPassword': _authData['confirmPassword'],
              };
            }),
            if (widget._authMode == 'register')
              buildTextInput(
                  'confirm_password',
                  Icons.lock,
                  'Confirm Password',
                  TextInputType.text,
                  TextInputAction.done,
                  'Confirm Password is required',
                  _confirmPasswordFocusNode, (value) {
                _authData = {
                  'mobile': _authData['mobile'],
                  'password': _authData['password'],
                  'confirmPassword': value,
                };
              }),
            SizedBox(
              height: 40.0,
            ),
            Container(
              width: double.infinity,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(29.0),
                ),
                color: Theme.of(context).primaryColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 21.0),
                  child: Text(
                    widget._authMode == 'login' ? 'LOGIN' : 'REGISTER',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                onPressed: _saveAuthForm,
              ),
            )
          ],
        ),
      ),
    );
  }
}
