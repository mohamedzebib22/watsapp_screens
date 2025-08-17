import 'package:chat_app/core/utils/widgets/style_text.dart';
import 'package:chat_app/feature/chatpage/presentation/view/chatpage_view.dart';
import 'package:chat_app/feature/homepage/data/model/prson_info.dart';
import 'package:chat_app/feature/homepage/presentation/view/chat_page.dart';
import 'package:flutter/material.dart';

class PersonInfoWidget extends StatelessWidget {
  const PersonInfoWidget({super.key, required this.personInfo});
  final PersonInfoModel personInfo ;
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Directionality(
      textDirection:TextDirection.rtl,
      child: ListTile(
        onTap: (){
          Navigator.pushNamed(context, ChatPageView.id ,arguments: personInfo);
        },
        title:Hero(
          tag: personInfo.name,
          child: Text(personInfo.name, style: 
          isDark 
            ? StyleText.personNameWhite 
            : StyleText.personNameBlack),
        ),
    
        subtitle: Text(personInfo.desc, style: isDark ? StyleText.personDescWhite : StyleText.personDescBlack),
        leading: Hero(
          tag: personInfo.image,
          child: CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(personInfo.image),
          ),
        ),
        trailing: CircleAvatar(
          radius: 10,
          backgroundColor: Colors.green,
          child: Text('${personInfo.numOfMessage=5}',style: TextStyle(color: Colors.black,fontSize: 12),),
        ),
      ),
    );
  }
}