import 'package:chat_app/helpers/constants.dart';
import 'package:chat_app/helpers/styles.dart';
import 'package:chat_app/pages/auth/create_account.dart';


import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:url_launcher/url_launcher.dart';



String login="0";
printFunction(message) {
  // ignore: avoid_print
  print(message);
}
pop(context) {
  Navigator.of(context).pop();
}

pushPage({context, page}) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => page,
    ),
  );
}
replacePage({context, page}) {
  Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (context) => page));
}


// getDataUser(){
//   ShardEditor editor=ShardEditor();
//   editor.getUser().then((value) {
//
//     currentUser = value;
//     token=value.token!;
//     printFunction("cerrentUser${currentUser.token}");
//   });
// }

bool isLogin(){

  return token != "";
}


readToken() async {
  // await getBaseUrl();
  const storage =  FlutterSecureStorage();
  try {

    token = (await storage.read(key: "token"))!;
    currentUser.id=( await storage.read(key: "id"));
    currentUser.role=( await storage.read(key: "role"));
    currentUser.fullName=( await storage.read(key: "name"));
    currentUser.imageUrl=( await storage.read(key: "image"));
    login = (await storage.read(key: isLoginKey))!;
    printFunction("token : $token");
  } catch (e) {}
}

isRegistered() {
  return (token != "" && token != null);
}

saveToken() {
  const storage =  FlutterSecureStorage();
  storage.write(key: 'token', value: token);
  storage.write(key: 'id', value: currentUser.id);
  storage.write(key: 'role', value: currentUser.role);
  storage.write(key: 'image', value: currentUser.imageUrl);
  storage.write(key: 'name', value: currentUser.fullName);
}

saveData({key,value}) {
  const storage =  FlutterSecureStorage();
  storage.write(key: key, value: value);

}
Future<dynamic> readData({key})async {
  const storage =  FlutterSecureStorage();

  return await storage.read(key: key);
}


late String currentLocal;
// LocationData locData = LocationData.fromMap({});
// getLocation() async {
//   Location location =  Location();
//   bool _serviceEnabled;
//   PermissionStatus _permissionGranted;
//   _serviceEnabled = await location.serviceEnabled();
//   if (!_serviceEnabled) {
//     _serviceEnabled = await location.requestService();
//     if (!_serviceEnabled) {
//       return;
//     }
//   }
//
//   _permissionGranted = await location.hasPermission();
//   if (_permissionGranted == PermissionStatus.denied) {
//     _permissionGranted = await location.requestPermission();
//     if (_permissionGranted != PermissionStatus.granted) {
//       return;
//     }
//   }
//
//   locData = await location.getLocation();
//   print(locData.latitude.toString() + " lat:");
// }

signOut({ctx}) async {
  final storage = FlutterSecureStorage();

  token = "";
  await storage.delete(key: "token");
  // await storage.delete(key: "id");
  replacePage(context: ctx, page:  CreateAccount());
}


int createUniqueId() {
  return DateTime.now().millisecondsSinceEpoch.remainder(100000);
}



/*
Future showDialogAction(BuildContext context,bool load,{name,type,onTap}) async {
  showDialog(
    context: context,
    builder: (context) {
      // return object of type Dialog
      return Container(
        // height: 200,
        child: AlertDialog(
          title: Texts(
              fSize: 18,
              color: Colors.red,
              title: name,
              weight: FontWeight.bold),
          content: Texts(
              fSize: 18,
              color: Colors.black,
              title: "هل أنت متأكد من أنك تريد حذف هذا $type",
              weight: FontWeight.bold),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            load?const Center(
              child: CircularProgressIndicator(
                color: homeColor,
                strokeWidth: 3,
              ),
            ):    TextButton(
              child: Text("حذف", style: const TextStyle(color: Colors.red)),
              onPressed: onTap,
            ),
            TextButton(
              child: Text("الغاء"),
              onPressed: () {
                Navigator.pop(context, 0);
              },
            ),
          ],
        ),
      );
    },
  );
}
*/
Future<void> launchUrlOpen({url}) async {
  if (!await launchUrl(url)) {
    throw 'Could not launch $url';
  }
}