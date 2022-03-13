import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessengerSecreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          titleSpacing: 22.0,
          title: Row(
            children: const [
              Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              /* CircleAvatar(
         radius: 20.0,
         backgroundImage: NetworkImage('https://downloadwap.com/thumbs2/wallpapers/p2ls/2019/anime/45/6cd4939c13498682.jpg'),
        ),
        */
              SizedBox(
                width: 40.0,
              ),
              Text(
                'ibrahim_harara',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const CircleAvatar(
                radius: 22,
                backgroundColor: Colors.pinkAccent,
                child: Icon(
                  Icons.camera,
                  size: 20,
                  color: Colors.white,
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const CircleAvatar(
                radius: 20,
                backgroundColor: Colors.pinkAccent,
                child: Icon(
                  Icons.edit,
                  color: Colors.white,
                  size: 15.0,
                ),
              ),
            ),
          ]),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey[350],
                ),
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: const [
                    Icon(Icons.search),
                    SizedBox(
                      width: 20.0,
                    ),
                    Text(
                      'Buscar',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                height: 100.0, //هان حجمن العناصر  يعني مستحيل يزيد عن 100
                child: ListView.separated(
                  shrinkWrap: true,
                  //عشان اقدر ابعد العناصر عن بعض واحط مسافة
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => buildStoryItem(),
                  separatorBuilder: (context, index) => (SizedBox(
                    width: 15.0,
                  )),
                  //لتبعيد العناصر عن بعض
                  itemCount: 5, //عدد العناصر
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
               ListView.separated(
                 physics: NeverScrollableScrollPhysics(),
                 //ممنوع يسكول خالص 
               shrinkWrap:true ,//ارمي كل حاجة
               itemBuilder:  (context,index  )=>buildChatItem(),
               separatorBuilder: (context,index)=>SizedBox(
                 height: 20.0,
               ),
               itemCount: 20,
                 )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildChatItem() => Row(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: const [
              CircleAvatar(
                radius: 30.0,
                backgroundImage: NetworkImage(
                    'https://pbs.twimg.com/profile_images/378800000322241929/43e9c59101a271a3f63ce52ca712ce5e_400x400.jpeg'),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(
                  bottom: 3.0,
                  end: 3.0,
                ),
                child: CircleAvatar(
                  radius: 6.0,
                  backgroundColor: Colors.pink,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ibrahim Harara ',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                ),
                SizedBox(
                  height: 7.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Ibrahim Harara ',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Container(
                        width: 7.0,
                        height: 7.0,
                        decoration: BoxDecoration(
                            color: Colors.pink, shape: BoxShape.circle),
                      ),
                    ),
                    Text('08:00 pm'),
                  ],
                )
              ],
            ),
          ),
        ],
      );
 
  Widget buildStoryItem() => Container(
        width: 60.0,
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: const [
                CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage(
                      'https://pbs.twimg.com/profile_images/378800000322241929/43e9c59101a271a3f63ce52ca712ce5e_400x400.jpeg'),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(
                    bottom: 3.0,
                    end: 3.0,
                  ),
                  child: CircleAvatar(
                    radius: 6.0,
                    backgroundColor: Colors.pink,
                  ),
                ),
              ],
            ),
            Text(
              'Ibrahim Abd Harara',
              maxLines: 2,
              overflow: TextOverflow.ellipsis, //بعرفني انو فيه كلام  زيادة
            ),
          ],
        ),
      );
}
