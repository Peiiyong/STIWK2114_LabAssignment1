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

            // 'LOAD USER' button: it will call the getInfo method when pressed
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
            // This widget is used to display error message if the API call fails (e.g., no internet connection)
            Text(
              controller1.text,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),

            /* 
               This section displays user data retrieved from the API.
               If no data is available, it shows a "-- No data --" message.
               Otherwise, it shows a scrollable list of user cards with detailed info.
             */
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

  // getInfo method fetches random user data from the API and updates the UI.
  Future<void> getInfo() async {
    // Send a GET request to the randomuser API
    var randomuser = await http.get(Uri.parse('https://randomuser.me/api/'));

    if (randomuser.statusCode == 200) {
      // Decode the JSON response to access user data in a readable format
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

      // Update the UI with the retrieved user data
      setState(() {
        randomuserData = data['results'];
      });
    } else {
      // If request failed, display error message in the UI
      controller1.text = 'Error ${randomuser.statusCode}';
      setState(() {});
    }
  }
}
