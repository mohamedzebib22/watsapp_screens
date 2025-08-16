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
    Center(child: Text("التحديثات", style: TextStyle(fontSize: 22))),
    ChatPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    double width = MediaQuery.of(context).size.width; 
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBody: true,
      
      body: buildChatPageBody(isDark),
      bottomNavigationBar: buildBottomNavBar(height, isDark),
    );
  }

  SizedBox buildBottomNavBar(double height, bool isDark) {
    return SizedBox(
      height: height*0.12, 
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedFontSize : 16,
        unselectedFontSize: 16,
        selectedItemColor:isDark ? Colors.white : Colors.black,
        unselectedItemColor: isDark ? Colors.white : Colors.black54,
        items: [
          _buildBarItem(Icons.call_outlined, "المكالمات", 0 ,
              isDark ? Colors.white : Colors.black),
          _buildBarItem(Icons.groups_outlined, "المجتمعات", 1, isDark ? Colors.white : Colors.black),
          _buildBarItem(Icons.update, "التحديثات", 2, isDark ? Colors.white : Colors.black),
          _buildBarItem(Icons.chat_bubble_outline, "المحادثات", 3, isDark ? Colors.white : Colors.black),
        ],
      ),
    );
  }

  Container buildChatPageBody(bool isDark) {
    return Container(
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
    child: _pages[_currentIndex], 
  );
  }

  BottomNavigationBarItem _buildBarItem(IconData icon, String label, int index , Color iconColor,) {
    final isSelected = _currentIndex == index;
    return BottomNavigationBarItem(
      icon: Container(
        padding: EdgeInsets.symmetric(vertical: 3,horizontal: 16),
        decoration: isSelected
            ? BoxDecoration(
                color: const Color.fromARGB(255, 17, 110, 20), 
                 borderRadius: BorderRadius.circular(66),
              )
            : null,
        child: Icon(icon,
          color: iconColor,
          size: 30,
        ),
      ),
      label: label,
    );
  }
}
