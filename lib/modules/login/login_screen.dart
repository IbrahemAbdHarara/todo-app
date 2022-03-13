import 'package:first_app/shared/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//reusble component
// اعادة الاستخدام توفير...
//1. timing
//2. refactor
//3. qulity
class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailContoroller = TextEditingController();

  var passwordContoroller = TextEditingController();

  var nameContoroller = TextEditingController();
  late IconData suffix;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool ispassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            //العناصر  centerعشان مايصير خط ويطلع بره العناصر عشان
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.center,
                //النص بيجي في البداية
                children: [
                  const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 35.0,
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ), //فراغ بين العناصر

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
                      return null;
                    },
                    decoration: const InputDecoration(
                        //hintText: 'Enter the Email Address',// النص بكون مخفي وبروح لما اجي ادخل بيانات
                        labelText:
                            'email address', //هادي نفسه بس النص هاد بطلع لفوق مبروحش
                        prefixIcon: Icon(Icons.email),
                        border:
                            OutlineInputBorder() // بحوط الشكله بمعمله زي بوكس
                        ),
                    //Input بزبط وبعمل شكل الادخال
                  ),
                  //بقدر اكتب وادخل نصوص س  للادخال //login بيجي في المنتصف لم احطه تلقائي النص ال
                  const SizedBox(
                    height: 15.0,
                  ),

                  const SizedBox(
                    height: 15.0,
                  ),

                  TextFormField(
                    controller: passwordContoroller,
                    keyboardType: TextInputType.visiblePassword,
                    onFieldSubmitted: (value) {
                      print(value);
                    },
                    onChanged: (String value) {
                      print(value);
                    },
                    //لاضهار والاخفاء
                    decoration: const InputDecoration(
                      labelText: 'Passpword',
                      prefixIcon: Icon(Icons.password),
                      suffixIcon: Icon(Icons.remove_red_eye),
                      border: OutlineInputBorder(),
                    ),
                    obscureText: ispassword,
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return ' Password must is empty';
                      }
                    },
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('dont have an account(? _ ?)'),
                      TextButton(
                        onPressed: () {},
                        child: Text('Register Now (+  _ +)'),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
