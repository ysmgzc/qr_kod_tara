import "package:flutter/material.dart";
import "package:qr_kod_tara/qr_kod_tara.dart";

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height*0.05,),
              Text(
                'Giriş Yap',
                style: TextStyle(
                    color: Colors.green,
                    fontSize: MediaQuery.of(context).size.width*0.1,
                    fontWeight: FontWeight.bold,
                    shadows:const [BoxShadow(color: Colors.white, offset: Offset(1,2),blurRadius: 3 ),],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.1,),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width*0.9,
                  alignment: Alignment.center,
                  child: TextFormField(
                    style:const TextStyle(
                            height: 1.5,
                            ),
                    decoration:const InputDecoration(
                      contentPadding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.green,
                      ),
                      enabledBorder: UnderlineInputBorder(      
                        borderSide: BorderSide(color: Colors.grey),   
                      ),  
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      hintText: "Kullanıcı Adı",
                      hintStyle: TextStyle(
                        fontSize: 15.5,
                        color: Colors.grey,
                      ),
                    ),
                  ),
              )),
              SizedBox(height: MediaQuery.of(context).size.height*0.02,),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width*0.9,
                  alignment: Alignment.center,
                  child: TextFormField(
                    obscureText: true,
                    style:const TextStyle(
                            height: 1.5,
                            ),
                    decoration:const InputDecoration(
                      contentPadding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color: Colors.green,
                      ),
                      enabledBorder: UnderlineInputBorder(      
                        borderSide: BorderSide(color: Colors.grey),   
                      ),  
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      hintText: "Parola",
                      hintStyle: TextStyle(
                      fontSize: 15.5,
                      color: Colors.grey,
                    ),
                    ),
                  ),
              )),
              SizedBox(height: MediaQuery.of(context).size.height*0.07,),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                          const  QrKodTara(),
                      ),
                    );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width*0.4,
                  height: MediaQuery.of(context).size.height*0.06, 
                  padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.02,),
                  decoration:const BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    boxShadow: [BoxShadow(color: Colors.black26,
                    offset: Offset(3, 3),
                    blurRadius: 5,
                    )]
                  ),
                  child: Center(
                    child: Text('Giriş Yap',
                    style: TextStyle(color: Colors.white,
                    fontSize: MediaQuery.of(context).size.width*0.05),),),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.055,),
            ],
          ),
        ),
      )
    );
  }
}
