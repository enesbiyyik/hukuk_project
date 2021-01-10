import 'package:flutter/material.dart';
import 'package:hukuk_ui/ui/sign_up.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final formKey = GlobalKey<FormState>();
  String _eMail;
  String _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        padding: EdgeInsets.fromLTRB(16,100,16,16),
        width: double.maxFinite,
        height: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(padding: EdgeInsets.only(top: 5, left: 8), child: Text("Giriş Yap", style: TextStyle(fontFamily: "Genel", fontSize: 48, fontWeight: FontWeight.w700),)),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Hesabın yok mu? ", style: TextStyle(fontFamily: "Genel"),),
                ),
                InkWell(child: Text("Şimdi Kaydol!", style: TextStyle(fontFamily: "Genel", color: Color(0xff0052cc)),),
                  onTap: () => Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context) =>SignUp())),
                ),
              ],
            ),
            Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8, bottom: 16, top: 30),
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(8),
                        labelText: "E-Mail",
                        labelStyle: TextStyle(fontFamily: "Genel"),
                      ),
                      validator: (s) => _eMailControl(s),
                      onSaved: (value) => _eMail = value,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(8),
                        labelText: "Şifre",
                        labelStyle: TextStyle(fontFamily: "Genel"),
                      ),
                      obscureText: true,
                      validator: (s) => s.length < 8 ? "Şifre en az 8 karakter olmalıdır!" : null,
                      onSaved: (value) => _password = value,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(child: Text("Şifremi unuttum!", style: TextStyle(fontFamily: "Genel", color: Color(0xff0052cc)),),
                    onTap: () => null,
                ),
                  ),
                  SizedBox(height: 30,),
                  Container(
                    padding: EdgeInsets.all(8),
                    width: 330,
                    height: 60,
                    child: FlatButton(
                      color: Color(0xff0052cc),
                      onPressed: signUp, 
                      child: Text("Kayıt Ol", style: TextStyle(color: Colors.white, fontFamily: "Genel"),),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _eMailControl(String mail) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(mail)) return 'Geçersiz mail';
    else return null;
  }

  void signUp() async {
    if(formKey.currentState.validate()){
      //* Some code here
    }else{
      //* Some code here
    }
  }
}