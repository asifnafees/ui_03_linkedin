import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ui_03_linkedin/views/components/profile.dart';
import 'package:ui_03_linkedin/views/components/search_text_field.dart';
import 'package:ui_03_linkedin/views/screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bottom Navigation Bar Example',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  bool _isAppBarAndBottomNavBarVisible = true;
  PageController _pageController = PageController();
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection == ScrollDirection.reverse) {
        setState(() {
          _isAppBarAndBottomNavBarVisible = false;
        });
      } else if (_scrollController.position.userScrollDirection == ScrollDirection.forward) {
        setState(() {
          _isAppBarAndBottomNavBarVisible = true;
        });
      }
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _isAppBarAndBottomNavBarVisible = true;
    });
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( backgroundColor: Colors.grey.shade400,
      appBar: _isAppBarAndBottomNavBarVisible
          ? PreferredSize(preferredSize: Size.fromHeight(65),
            child: AppBar(backgroundColor: Colors.white,
               flexibleSpace: SafeArea(
                 child: Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                   child: Row(children: [
                     Expanded(flex: 1,
                       child: Profile(image: "assets/images/0.jpg",
                           radius: 18),
                     ),
                     Expanded(flex: 5,
                       child: SearchTextField(search: "Search",
                           iconData: FontAwesomeIcons.magnifyingGlass),
                     ),
                     SizedBox(width: 20,),
                     Icon(FontAwesomeIcons.solidCommentDots)
                   ],),
                 ),
               ),
                  ),
          )
          : null,
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
            _isAppBarAndBottomNavBarVisible = true;
          });
        },
        children: <Widget>[
          Home(),
          ListView.builder(
            controller: _scrollController,
            itemCount: 100,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('Asif Nafees $index'),
              );
            },
          ),
          Center(child: Text('Message Page')),
          Center(child: Text('More Page')),
        ],
      ),
      bottomNavigationBar: _isAppBarAndBottomNavBarVisible
          ? BottomNavigationBar(
                  items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.houseChimney,size: 20,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.userGroup,size: 20,),
            label: 'My Network',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box,size: 30,),
            label: 'Post',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications,size: 30,),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.briefcase,size: 20,),
            label: 'Jobs',
          ),
                  ],
                  currentIndex: _selectedIndex,
                  onTap: _onItemTapped,
                  selectedItemColor: Colors.black,
                  unselectedItemColor: Colors.grey,
                  selectedFontSize: 12,
                  unselectedFontSize: 10,
                  type: BottomNavigationBarType.fixed,
                )
          : null,
    );
  }
    @override
    void dispose() {
      _pageController.dispose();
      _scrollController.dispose();
      super.dispose();
    }

}
