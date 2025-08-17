import 'package:chat_app/core/utils/constants/constant.dart';
import 'package:chat_app/core/utils/widgets/custom_text_feild.dart';
import 'package:chat_app/core/utils/widgets/style_text.dart';
import 'package:chat_app/feature/homepage/data/model/prson_info.dart';
import 'package:chat_app/feature/homepage/presentation/widget/person_info_widget.dart';
import 'package:flutter/material.dart';

class ChatPageBody extends StatelessWidget {
  const ChatPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    List<PersonInfoModel> personInfo = [
      PersonInfoModel(
        name: 'محمد سمير',
        desc: '✔✔تم ارسال رساله',
        image: 'assets/image/avatar1.jpg',
      ),
      PersonInfoModel(
        name: 'عبده المنفى',
        desc: '✔✔مرحبا بكم',
        image: 'assets/image/avatar2.jpg',
      ),
      PersonInfoModel(
        name: 'عرفه عطا',
        desc: '✔السلام عليكم ورحمة الله',
        image: 'assets/image/avatar3.png',
      ),
    ];
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.02,
        vertical: height * 0.01,
      ),
      decoration: BoxDecoration(
  image: DecorationImage(
    image: AssetImage(
      isDark 
        ? 'assets/image/darkbackground.jpg'
        : 'assets/image/lightbackground.png',
    ),
    fit: BoxFit.fill,
  ),
),
key: ValueKey(isDark), 

      child: Column(
        children: [
         
          CustomTextFeild(
            hintColor: isDark ? Colors.white : Colors.black,
            hintText: Constant.metaAi,
            sufix: Icon(Icons.search, color: Colors.grey),
            isFill: true,
            fillColor:
            isDark?
             const Color.fromARGB(255, 48, 47, 47) : 
               const Color.fromARGB(255, 228, 224, 224),
          ),
          SizedBox(height: height * 0.02),
          buildListOfPerson(personInfo),
        ],
      ),
    );
  }
}

Expanded buildListOfPerson(List<PersonInfoModel> personInfo) {
  return Expanded(
    child: ListView.builder(
      itemBuilder: (context, index) {
        return PersonInfoWidget(personInfo: personInfo[index]);
      },
      itemCount: 3,
    ),
  );
}


