import 'package:flutter/material.dart';
import 'package:huji_hackathon/databases/auth.dart';
import 'package:huji_hackathon/menus/settings_menu.dart';
import 'package:huji_hackathon/pages/chat_page.dart';

class MainPage extends StatelessWidget {
  final AuthService _auth = AuthService();

  MainPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            backgroundColor: Colors.green,
            title: Text(
              'TripApp',
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: LogoutBurgerWidget(),
              )
            ],
            bottom: TabBar(
              tabs: [
                // Tab(icon: Icon(Icons.calendar_today), text: 'Calendar'),
                Tab(icon: Icon(Icons.update), text: "Upcoming Trips"),
                Tab(icon: Icon(Icons.message), text: "Messages"),
              ],
            ),
          ),
          backgroundColor: Colors.blue,
          body: TabBarView(
            children: [
              // CalendarTab(),
              ChatPage(),
              // MessagesDisplayWidget(idUser: _auth.getUser.uid)
            ],
          )),
    );
  }

  Widget buildText(String text) {
    return Center(child: Text(text, style: TextStyle(fontSize: 24)));
  }
}
