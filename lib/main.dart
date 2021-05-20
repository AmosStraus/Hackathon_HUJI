import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:huji_hackathon/databases/firebase_api.dart';
import 'package:huji_hackathon/guy_files/dummy_users.dart';
import 'package:huji_hackathon/startuphacka/add_new_trip.dart';
import 'package:huji_hackathon/startuphacka/card_for_trip.dart';
import 'package:huji_hackathon/startuphacka/user_profile.dart';
import 'package:provider/provider.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   await Firebase.initializeApp();
//   // FirebaseApi.addRandomUsers(MyUsers.dummyUsers);
//   // print(MyUsers.dummyUsers.length);
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         Provider<AuthenticationService>(
//             create: (context) => AuthenticationService(FirebaseAuth.instance)),
//         StreamProvider(
//           create: (context) =>
//               context.read<AuthenticationService>().authStateChanges,
//           initialData: null,
//         )
//       ],
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'Get out',
//         theme: ThemeData(
//           primarySwatch: Colors.green,
//         ),
//         home: AuthenticationWrapper(),
//       ),
//     );
//   }
// }

// class AuthenticationWrapper extends StatelessWidget {
//   const AuthenticationWrapper({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final User firebaseUser = context.watch<User>();
//     if (firebaseUser != null) {
//       return MainPage();
//     }
//     return AuthenticatePage();
//   }
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseApi.addRandomUsers(DummyUsers2.all_users);
  print(DummyUsers2.all_users.length);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'GET OUT',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Home(),
    );
  }
}

// TRY NOW

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _currentIndex = 1;
  final List<Widget> _children = [
    AddNewTrip(),
    PostCardPage(),
    ProfileUI2(DummyUsers2.all_users[0]),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            label: 'Get out',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          )
        ],
      ),
    );
  }
}

class PlaceholderWidget extends StatelessWidget {
  final Color color;

  PlaceholderWidget(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text("Page $color"),
          )
        ],
      ),
    );
  }
}
