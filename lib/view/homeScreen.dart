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
  Map<String, dynamic> infoData = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,

      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'H O M E',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.yellow,
            shadows: [
              Shadow(color: Colors.orange, offset: Offset(2, 2), blurRadius: 2),
            ],
          ),
        ),
        centerTitle: true,
        shadowColor: Colors.white,
        elevation: 0,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.yellow, Colors.orange],
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: ElevatedButton(
                onPressed: getInfo,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  elevation: 0,
                  padding: EdgeInsets.symmetric(vertical: 14, horizontal: 150),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'LOAD USER',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        color: Colors.grey,
                        offset: Offset(2, 2),
                        blurRadius: 2,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),
            Text(
              controller1.text,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),

            Expanded(
              child:
                  randomuserData.isEmpty
                      ? Text(
                        '-- No data --',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                      : ListView.builder(
                        itemCount: randomuserData.length,
                        itemBuilder: (context, index) {
                          var user = randomuserData[index];
                          var name = user['name'];
                          var location = user['location'];
                          var coordinates = location['coordinates'];
                          var timezone = location['timezone'];
                          var login = user['login'];
                          var dob = user['dob'];
                          var registered = user['registered'];

                          return Card(
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(
                                  randomuserData[index]['picture']['large'],
                                ),
                              ),
                              title: Text(
                                "${name['title']} ${name['first']} ${name['last']}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text("Gender: ${user['gender']}"),
                                  Text(
                                    "Address: ${location['street']['number']}, ${location['street']['name']}, "
                                    "${location['city']}, ${location['state']}, ${location['country']} - ${location['postcode']}",
                                  ),
                                  Text(
                                    "Timezone: ${timezone['description']} (${timezone['offset']})",
                                  ),
                                  Text(
                                    "Coordinates: Lat ${coordinates['latitude']}, Lng ${coordinates['longitude']}",
                                  ),
                                  Text("Email: ${user['email']}"),
                                  Text("Login Username: ${login['username']}"),
                                  Text("Login Password: ${login['password']}"),
                                  Text("Login UUID: ${login['uuid']}"),
                                  Text("Date of Birth: ${dob['date']}"),
                                  Text("Age: ${dob['age']}"),
                                  Text(
                                    "Registered Date: ${registered['date']}",
                                  ),
                                  Text("Registered Age: ${registered['age']}"),
                                  Text("Phone: ${user['phone']}"),
                                  Text("Cell: ${user['cell']}"),
                                  Text("ID Name: ${user['id']['name']}"),
                                  Text("ID Value: ${user['id']['value']}"),
                                  Text('NAT: ${user['nat']}'),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
            ),
          ],
        ),
      ),
    );
  }

  // CALL API FUNCTION
  Future<void> getInfo() async {
    var randomuser = await http.get(Uri.parse('https://randomuser.me/api/'));

    if (randomuser.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(randomuser.body);

      final name = data['results'][0]['name'];
      log("Name: ${name['title']} ${name['first']} ${name['last']}");

      final location = data['results'][0]['location'];
      log(
        "Address: ${location['street']['number']} ${location['street']['name']}, "
        "${location['city']}, ${location['state']}, ${location['country']} - ${location['postcode']}\n"
        "Timezone: ${location['timezone']['description']} (Offset: ${location['timezone']['offset']})\n"
        "Coordinates: Latitude ${location['coordinates']['latitude']}, "
        "Longitude ${location['coordinates']['longitude']}",
      );

      final info = data['info'];
      log(
        "Info: ${info['seed']} ${info['results']} ${info['page']} ${info['version']}",
      );

      setState(() {
        randomuserData = data['results'];
      });
    } else {
      controller1.text = 'Error ${randomuser.statusCode}';
      setState(() {});
    }
  }
}
