import 'dart:html';
import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(97, 71, 133, 14),
        leading: IconButton(
          onPressed: onNotification,
          icon: const Icon(
            Icons.menu,
          ),
        ),

        title: const Text("Harara App"),
        actions: [
          IconButton(
            icon: const Text('hi'),
            //بنفع انحط ايقونة  او نص عادي
            onPressed: onNotification,
          ),
          //للتفاعل مع ال زر واضغط عليه
          IconButton(
              onPressed: onNotification,
              icon: const Icon(
                Icons.send_and_archive_outlined,
              )),

          IconButton(
              onPressed: () {
                print("hi");
              },
              icon: const Icon(Icons.sailing_outlined)),
        ],
        elevation: 20.0, //appbar ابتتحكم ب ضل ال
      ),
      
     /* body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.all(40.0), //مسافة للكل الصورة عن محيط الشاشة
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)
                  //ممكن نعمل جهة معين من الصورة  في القص والتدوير
                  //    borderRadius: BorderRadiusDirectional.only(bottomEnd: Radius.circular(20)),
                  ), // لقص الصورة وجعله دائرية
              clipBehavior: Clip
                  .antiAliasWithSaveLayer, //لتفعيل القص والتدوير  الي تحدد الي فوق
              child: Stack(
                alignment: Alignment.bottomLeft,
                //بحرك موضع النص في الصورة
                children: [
                  const Image(
                    image: NetworkImage(
                        'https://i0.wp.com/animetitans.com/wp-content/uploads/2021/10/desktop-naruto-wallpaper-whatspaper-1.jpg'),
                    height: 200.0,
                    width: 200.0,
                    fit: BoxFit.cover,
                    //بتعبي مساحة الصورة بشكل المحدد بمعنى الطول والعرض الي محددين بتعبيهم
                  ),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    //مساحة والمسافة النص عن محيط الون
                    color: Colors.black.withOpacity(.77), //شفافية الون
                    width: 200,
                    child: const Text(
                      'E',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
*/
//end code Stack & Container
      /*body: SingleChildScrollView(
   // scrollDirection: Axis.horizontal,// row لل scrollهادي لل
  //بس عليك اضيف row بدل coloum
  //يخفي الخطئ وبقدر اسكرول اكتر من عنصر في الشاشة 
        //SingleChildScrollView:(هادي للشريط الي بطلع لما اكون حاطط كمية من العناصر في الشاشة وبطلع زي شريط)
        child: Container(
         width: double.infinity,
          child: Column(
         
            children: const [
              Text(
                'data:1',
                style: TextStyle(fontSize: 25.0, color: Colors.teal),
              ),
               Text(
                'data:2',
                style: TextStyle(fontSize: 25.0, color: Colors.teal),
              ),
            Text(
                'data:3',
                style: TextStyle(fontSize: 25.0, color: Colors.teal),
              ),
              Text(
                'data:4',
                style: TextStyle(fontSize: 25.0, color: Colors.teal),
              ),
            Text(
                'data:1',
                style: TextStyle(fontSize: 25.0, color: Colors.teal),
              ),
               Text(
                'data:2',
                style: TextStyle(fontSize: 25.0, color: Colors.teal),
              ),
            Text(
                'data:3',
                style: TextStyle(fontSize: 25.0, color: Colors.teal),
              ),
              Text(
                'data:4',
                style: TextStyle(fontSize: 25.0, color: Colors.teal),
              ),
            Text(
                'data:1',
                style: TextStyle(fontSize: 25.0, color: Colors.teal),
              ),
               Text(
                'data:2',
                style: TextStyle(fontSize: 25.0, color: Colors.teal),
              ),
            Text(
                'data:3',
                style: TextStyle(fontSize: 25.0, color: Colors.teal),
              ),
              Text(
                'data:4',
                style: TextStyle(fontSize: 25.0, color: Colors.teal),
              ),
           Text(
                'data:1',
                style: TextStyle(fontSize: 25.0, color: Colors.teal),
              ),
               Text(
                'data:2',
                style: TextStyle(fontSize: 25.0, color: Colors.teal),
              ),
            Text(
                'data:3',
                style: TextStyle(fontSize: 25.0, color: Colors.teal),
              ),
              Text(
                'data:4',
                style: TextStyle(fontSize: 25.0, color: Colors.teal),
              ),
            ],
          ),
        ),
      ),
     */
      //end code Single Child Scroll View
      /* body: Container(
        color: Colors.blue,
        height: double.infinity,
        child: Row(
           //عكس ال coulom 
           //menu row style تبعه في ترتيب العناصر
            //ss   cs  es
            //sc   cc  ec
            //se   ce  ee
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              color: Color.fromARGB(255, 66, 23, 167),
              child: const Text(
                'ibrahim',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.tealAccent,
                ),
              ),
            ),
           /* Container(
              color: Colors.amberAccent,
              child: const Text(
                'abd',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Color.fromARGB(255, 23, 109, 89),
                ),
              ),
            ),
            Container(
              color: Color.fromARGB(255, 135, 224, 108),
              child: const Text(
                'harara',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Color.fromARGB(255, 4, 88, 69),
                ),
              ),
            ),
          */],
        ),
      ),
     */
      //end code row(* _ -)
      /*   body: Container(
        color: Colors.teal,
        width: double.infinity, //بملي كل الشاشة مهما كان حجمه
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          //mainAxisSize: بصغر الخلفية العمود ورى العناصر وبتحم بحجمه المحور الرئيسئ
          //تقسيمة الشاشة والتحكم بالعناصر واماكنه في الشاشة
          //ss  sc  se
          //cs  cc  ce
          //es  ec  ee
          children: [
            Container(
              color: const Color.fromARGB(255, 146, 164, 216),
              //اي اشي بتعمل جوه بطبق على  كل عنصر داخله
              child: const Icon(
                Icons.accessibility_sharp,
                color: Color.fromARGB(255, 23, 105, 97),
                size: 50,
              ),
            ), //بتلم اليله كله بكون فيه كل اشي
            /*    Container(
              color: Colors.amber,
              child: const Text(
                'this is a laptob',
                style: TextStyle(
                    color: Color.fromARGB(255, 110, 197, 28), fontSize: 30.0),
              ),
            ),
            Container(
              color:const Color.fromARGB(255, 65, 255, 7),
              child: const Text(
                'this is a laptob',
                style: TextStyle(
                    color: Color.fromARGB(255, 83, 3, 59), fontSize: 30.0),
              ),
            ),
            Container(
              color: const Color.fromARGB(255, 45, 163, 9),
              child: const Text(
                'this is a laptob',
                style: TextStyle(
                    color: Color.fromARGB(255, 6, 48, 44), fontSize: 30.0),
              ),
            ),
*/
            //Expanded:بزبط المسفات بين عناصر الشاشة او العمو
          ],
        ),
      
      ),
  */
      //end code  coulom(* _ -)
    );
    //Scaffold:تعمل على تخطيط الشاشة&& هي عبارة عن سكرين من التطبيق
  }

  void onNotification() {
    print('onNotification clicked ');
  }
}
