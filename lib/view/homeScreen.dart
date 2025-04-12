import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController controller1 = TextEditingController();
  List<dynamic> randomuserData = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'H O M E',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
            shadows: [
              Shadow(color: Colors.grey, offset: Offset(3, 3), blurRadius: 2),
            ],
          ),
        ),
        centerTitle: true,
        shadowColor: Colors.grey.shade700,
        elevation: 0,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: getInfo, child: Text('Click Me!')),

            Expanded(
              child:
                  randomuserData.isEmpty
                      ? Text('No data')
                      : ListView.builder(
                        itemCount: randomuserData.length,
                        itemBuilder: (context, index) {
                          String nameTitle =
                              randomuserData[index]['name']['title'];
                          String nameFirst =
                              randomuserData[index]['name']['first'];
                          String nameLast =
                              randomuserData[index]['name']['last'];
                          String gender = randomuserData[index]['gender'];

                          return Card(
                            child: ListTile(
                              title: Text(nameTitle + nameFirst + nameLast),
                              subtitle: Text(gender),
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(
                                  randomuserData[index]['picture']['large'],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
            ),
          ],
        ),
      ),

      /* Center(
        child: Text(
          'H O M E',
          style: TextStyle(
            fontFamily: 'Times Rew Roman',
            fontSize: 48,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
            shadows: [
              Shadow(
                color: Colors.grey.shade700,
                offset: Offset(3, 5),
                blurRadius: 4,
              ),
            ],
          ),
        ),
      ), */
    );
  }

  Future<void> getInfo() async {
    // call api
    var randomuser = await http.get(Uri.parse('https://randomuser.me/api/'));

    if (randomuser.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(randomuser.body);
      log(data['results'][0]['gender']);
      log(data['results'][0]['name']['title']);
      log(data['results'][0]['name']['first']);
      log(data['results'][0]['name']['last']);

      setState(() {
        randomuserData = data['results'];
      }); 
    } else {
      controller1.text = 'Error ${randomuser.statusCode}';
      setState(() {});
    }
  }
}
