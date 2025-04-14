# LAB ASSIGNMENT 1 : Random User Info Viewer
<table border="1">
  <tr>
    <td><strong>Name</strong></td>
    <td>TAN PEI YONG</td>
  </tr>
  <tr>
    <td><strong>Matric Number</strong></td>
    <td>291688</td>
  </tr>  
  <tr>
    <td><strong>Subject</strong></td>
    <td>STIWK2114 / Mobile Programming</td>
  </tr>  
  <tr>
    <td><strong>Semester</strong></td>
    <td>A242</td>
  </tr>  
  <tr>
    <td><strong>Lab Title</strong></td>
    <td>Random User Info Viewer</td>
  </tr>  
  <tr>
    <td><strong>Submission Date</strong></td>
    <td>21/4/2025</td>
  </tr>  
</table>

## App Description

<div align="justify">
The objective of this lab assignment is to build a Flutter mobile application that displays a single random user profile retrieved from an external API. This mobile application will utilize https://randomuser.me/api/ to fetch random user data and display it on the user interface. Initially, the user interface will show a splash screen and transition to the home screen, where the user can press a 'LOAD USER' button to load and view details of a random user, such as profile picture, name, gender, address, and more. If the application fails to retrieve data from the API, it will display the error message 'Error 404'.
</div>

## Implementation

**Splash Screen and Transition Logic**
  - The splash screen (SplashScreen) shows an image, app title ("R U I V"), and a loading animation (CircularProgressIndicator).
  - After 5 seconds, it automatically navigates to the HomeScreen using Navigator.pushReplacement.

**Widgets Used in Main Screen**
  - Text: Displays labels and user information.
  - Image: Displays the logo and user's profile picture from the API.
  - Container: Used to style the “LOAD USER” button with gradient.
  - ElevatedButton: Used to trigger the API call.
  - ListView.builder: Dynamically lists out each random user's data in a scrollable view.
  - Card and ListTile: Present individual user data neatly with a CircleAvatar.

**HTTP GET Request Integration**
  - The app uses the http package to send a GET request to https://randomuser.me/api/.
  - JSON data is parsed and stored in a list (randomuserData), then used to update the UI.
  - The data includes name, gender, location, email, login info, DOB, phone number, and nationality.

**Button to Refresh User Data**
  - The “LOAD USER” button triggers the getInfo() function.
  - Each time the button is pressed, a new random user is fetched and displayed.


## Screenshots
<table>
    <tr>
    <td><img src="https://github.com/user-attachments/assets/4fb7b7ee-47ed-4af3-a7db-7566f440e063" width="180" height="350"></td>
    <td><img src="https://github.com/user-attachments/assets/7c275968-641b-45ce-9427-03ae17015b90" width="180" height="350"></td>
    <td><img src="https://github.com/user-attachments/assets/3112bf58-b35a-4963-8652-d7229de2dd3d" width="180" height="350"></td>
    <td><img src="https://github.com/user-attachments/assets/ffcbaf0b-3666-46da-bd25-f794cc457214" width="180" height="350"></td>
  </tr>
</table>

## Reflection / Challenges

<div align="justify">
During this lab, I discovered how to implement asynchronous programming in Flutter to retrieve API data and utilize setState() to reflect changes to the UI. I also had the opportunity to explore various widgets including ListView.builder, Card, and ElevatedButton to format the layout.
<br> <br>
The first obstacle I faced was managing the nested JSON structure from the API. I had to thoughtfully parse and manage variables in order to retrieve data from very deep nesting. Additionally, I encountered difficulties when managing the layout within a scrollable view while maintaining a clean and visually appealing structure. Utilizing Expanded inside a Column and properly applying SizedBox widgets helped achieve a balanced layout.
<br>  <br>
<b>Suggestions for Improvement:</b>
<ul>
  <li>Add Error Handling: Display appropriate error messages if the network call fails (e.g., no internet or bad response code).</li>
  <li>Load More Users: Modify the API URL to fetch multiple users (e.g., https://randomuser.me/api/?results=10) and display them in a scrollable list.</li>
  <li>Improve UI/UX: Wrap long fields (like address) with TextOverflow.ellipsis or allow expansion on tap.</li>
  <li>Improve UI/UX: Add animations or shimmer effects for loading states.</li>
</ul>
</div>
