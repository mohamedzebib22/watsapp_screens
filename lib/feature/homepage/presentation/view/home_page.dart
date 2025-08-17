import 'package:chat_app/feature/storypage/presentation/view/storypage_view.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/feature/homepage/presentation/view/chat_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 3;

  final List<Widget> _pages = const [
    Center(child: Text("المكالمات", style: TextStyle(fontSize: 22))),
    Center(child: Text("المجتمعات", style: TextStyle(fontSize: 22))),
   StoryPageView(),
    ChatPage(),
  ];

  final List<String> _titles = const [
    "المكالمات",
    "المجتمعات",
    "التحديثات",
    "المحادثات",
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        floatingActionButton: _currentIndex == 2  
        ? FloatingActionButton(
          backgroundColor: isDark ? Colors.white : Colors.black,
            onPressed: () {},
            child:  Icon(Icons.linked_camera , size: 30,color: isDark?Colors.black : Colors.white,),
          )
        : null,
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        extendBody: true,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                isDark
                    ? 'assets/image/darkbackground.jpg'
                    : 'assets/image/lightbackground.png',
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
             
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top,
                  right: width * 0.02,
                  left: width * 0.02,
                 bottom: 0
                ),
                child: buildCustomAppBar(
                  _titles[_currentIndex],
                  width,
                  TextStyle(
                    color: isDark ? Colors.white : Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  isDark ? Colors.white : Colors.black,
                  height,
                ),
              ),
          
              Expanded(
                child: _pages[_currentIndex],
              ),
            ],
          ),
        ),
        bottomNavigationBar: buildBottomNavBar(height, isDark),
      ),
    );
  }

  SizedBox buildBottomNavBar(double height, bool isDark) {
    return SizedBox(
      height: height * 0.12,
      child: BottomNavigationBar(
        backgroundColor:isDark ? Colors.black : Colors.white,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedFontSize: 16,
        unselectedFontSize: 16,
        selectedItemColor: isDark ? Colors.white : Colors.black,
        unselectedItemColor: isDark ? Colors.white : Colors.black54,
        items: [
          _buildBarItem(Icons.call_outlined, "المكالمات", 0, isDark ? Colors.white : Colors.black),
          _buildBarItem(Icons.groups_outlined, "المجتمعات", 1, isDark ? Colors.white : Colors.black),
          _buildBarItem(Icons.update, "التحديثات", 2, isDark ? Colors.white : Colors.black),
          _buildBarItem(Icons.chat_bubble_outline, "المحادثات", 3, isDark ? Colors.white : Colors.black),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildBarItem(
    IconData icon,
    String label,
    int index,
    Color iconColor,
  ) {
    final isSelected = _currentIndex == index;
    return BottomNavigationBarItem(
      icon: Container(
        padding: EdgeInsets.symmetric(vertical: 3, horizontal: 16),
        decoration: isSelected
            ? BoxDecoration(
                color: const Color.fromARGB(255, 17, 110, 20),
                borderRadius: BorderRadius.circular(66),
              )
            : null,
        child: Icon(icon, color: iconColor, size: 30),
      ),
      label: label,
    );
  }

  Column buildCustomAppBar(String text,double width, TextStyle textStyle, Color iconColor,double height) {
    return Column(
      children: [
        Row(
          children: [
          
            Icon(Icons.more_vert_outlined, color: iconColor),
            SizedBox(width: width * 0.02),
            Icon(Icons.photo_camera_outlined, color: iconColor),
            Spacer(),
            Text(text, style: textStyle),
            
          ],
        ),
        Divider(
          color: Colors.grey,
          height: height * 0.02,
          thickness: 1/3,
        ),
      ],
    );
  }
}

