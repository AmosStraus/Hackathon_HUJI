// import 'package:huji_hackathon/utils/utils.dart';
// import 'package:meta/meta.dart';

// class UserField {
//   static final String lastMessageTime = 'lastMessageTime';
// }

// class MyUser {
//   final String idUser;
//   final String name;
//   final String urlAvatar;
//   final DateTime lastMessageTime;

//   const MyUser({
//     this.idUser,
//     @required this.name,
//     @required this.urlAvatar,
//     @required this.lastMessageTime,
//   });

//   MyUser copyWith({
//     String idUser,
//     String name,
//     String urlAvatar,
//     String lastMessageTime,
//   }) {
//     return MyUser(
//       idUser: idUser ?? this.idUser,
//       name: name ?? this.name,
//       urlAvatar: urlAvatar ?? this.urlAvatar,
//       lastMessageTime: lastMessageTime ?? this.lastMessageTime,
//     );
//   }

//   static MyUser fromJson(Map<String, dynamic> json) => MyUser(
//         idUser: json['idUser'],
//         name: json['name'],
//         urlAvatar: json['urlAvatar'],
//         lastMessageTime: Utils.toDateTime(json['lastMessageTime']),
//       );

//   Map<String, dynamic> toJson() => {
//         'idUser': idUser,
//         'name': name,
//         'urlAvatar': urlAvatar,
//         'lastMessageTime': Utils.fromDateTimeToJson(lastMessageTime),
//       };
// }
