import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BetakatiApp extends StatelessWidget {
  var emailContoroller = TextEditingController();
  var passwordContoroller = TextEditingController();
  var nameContoroller = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Form(
          key: formKey,
          child: Column(
            //  crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('images/maleicon.png'),
              ),

              SizedBox(
                height: 20.0,
              ),

              Text(
                'Eng: Ibrahim Harara',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'مبرمج تطبيقات ',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              TextFormField(
                controller: emailContoroller, //لاخذ القيم التي تم ادخاله
                keyboardType:
                    TextInputType.emailAddress, //نوع البيانات الي بدو يدخله
                onFieldSubmitted: (String value) {
                  print(value);
                }, //بعد ميخلص ادخال
                onChanged: (String value) {
                  print(value);
                }, //سعت الادخال لاما اكتب حرف حرف

                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'email address must not be empty';
                  }
                },
                decoration: const InputDecoration(
                    //hintText: 'Enter the Email Address',// النص بكون مخفي وبروح لما اجي ادخل بيانات
                    labelText:
                        'email address', //هادي نفسه بس النص هاد بطلع لفوق مبروحش
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder() // بحوط الشكله بمعمله زي بوكس
                    ),
                //Input بزبط وبعمل شكل الادخال
              ),
              //بقدر اكتب وادخل نصوص س  للادخال //login بيجي في المنتصف لم احطه تلقائي النص ال

              const SizedBox(
                height: 15.0,
              ),

              TextFormField(
                controller: passwordContoroller,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                onFieldSubmitted: (value) {
                  print(value);
                },
                onChanged: (String value) {
                  print(value);
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return ' Password must is empty';
                  }
                },
                decoration: const InputDecoration(
                  labelText: 'Passpword',
                  prefixIcon: Icon(Icons.password),
                  suffixIcon: Icon(Icons.remove_red_eye),
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(
                height: 15.0,
              ),

              ElevatedButton(
                child: Text('Login'),
                onPressed: () {
                  if (formKey.currentState != null &&
                      formKey.currentState!.validate()) {
                    print(emailContoroller.text);
                    print(passwordContoroller.text);
                    print(nameContoroller.text);
                  }
                },

                // isUpperCase: false,
              ), //زر تم استدعائه

              const SizedBox(
                height: 15.0,
              ),
            ],
          ),
        ),
      ),
      //يجعل المحتوى داخل  حدود الشاشة
    );
  }
}
