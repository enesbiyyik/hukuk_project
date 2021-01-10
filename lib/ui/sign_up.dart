import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'login.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final formKey = GlobalKey<FormState>();
  bool isAccepted = false;
  bool isLawyer = false;
  String _name;
  String _eMail;
  String _password;
  String _id;
  TapGestureRecognizer _termsConditionRecognizer;
  TapGestureRecognizer _privacyPolicyRecognizer;

  @override
  void dispose() {
    _privacyPolicyRecognizer.dispose();
    _termsConditionRecognizer.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _termsConditionRecognizer = TapGestureRecognizer()
      ..onTap = () {
        print("Terms and condition tapped");
      };
    _privacyPolicyRecognizer = TapGestureRecognizer()
      ..onTap = () {
        print("Privacy Policy tapped");
      };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.fromLTRB(16,36,16,16),
        width: double.maxFinite,
        height: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(padding: EdgeInsets.only(top: 5, left: 8), child: Text("Kayıt Ol", style: TextStyle(fontFamily: "Genel", fontSize: 48, fontWeight: FontWeight.w700),)),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Hesabın var mı? ", style: TextStyle(fontFamily: "Genel"),),
                ),
                InkWell(child: Text("Giriş Yap!", style: TextStyle(fontFamily: "Genel", color: Color(0xff0052cc)),),
                  onTap: () => Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context) =>LogIn())),
                ),
              ],
            ),
            Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(8),
                        labelText: "Ad Soyad",
                        labelStyle: TextStyle(fontFamily: "Genel"),
                      ),
                      validator: (s) => s.length < 1 ? "İsim boş bırakılamaz!" : null,
                      onSaved: (value) => _name = value,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
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
                  SwitchListTile(
                    title: const Text("Avukatım", style: TextStyle(fontFamily: "Genel"),),
                    value: isLawyer, 
                    onChanged: (bool value){
                      setState(() {
                        isLawyer = value;
                      });
                    },
                  ),
                  isLawyer ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(8),
                        labelText: "Baro Kayıt No",
                        labelStyle: TextStyle(fontFamily: "Genel"),
                      ),
                      onSaved: (value) => isLawyer ? _id = value : null //* İsa reisim buraya bak ben null dedim ama sen bi kontrol et.
                    ),
                  ) : Container(),
                  SizedBox(height: 30,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Checkbox(
                            value: isAccepted, 
                            onChanged: (bool value){
                            setState(() {
                              isAccepted = value;
                            });
                            }
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: RichText(
                            text: TextSpan(
                              text: 'Bir hesap oluşturarak ', style: TextStyle(color: Colors.black),
                              children: [
                                TextSpan(text: 'Gizlilik Politikamızı', recognizer: _termsConditionRecognizer, style: TextStyle(color: Colors.blue, fontFamily: "Genel")),
                                TextSpan( text: ', ',),
                                TextSpan(text: 'Hüküm ve Koşullarımızı',recognizer: _privacyPolicyRecognizer, style: TextStyle(color: Colors.blue, fontFamily: "Genel")),
                                TextSpan(text: ' kabul etmiş olursunuz.', style: TextStyle(color: Colors.black, fontFamily: "Genel")),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    padding: EdgeInsets.all(8),
                    width: 330,
                    height: 60,
                    child: FlatButton(
                      color: Color(0xff0052cc),
                      onPressed: logIn, 
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

  void logIn() async {
    if(formKey.currentState.validate()){
      //* Some code here
    }else{
      //* Some code here
    }
  }
}