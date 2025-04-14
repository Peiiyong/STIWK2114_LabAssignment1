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

This project is a starting point for a Flutter application.

## Screenshots
<table>
    <tr>
    <td><img src="https://github.com/user-attachments/assets/4fb7b7ee-47ed-4af3-a7db-7566f440e063" width="180" height="350"></td>
    <td><img src="https://github.com/user-attachments/assets/7c275968-641b-45ce-9427-03ae17015b90" width="180" height="350"></td>
    <td><img src="https://github.com/user-attachments/assets/08740902-257f-4be1-a963-528ffc7440d9" width="180" height="350"></td>
    <td><img src="https://github.com/user-attachments/assets/2bbc52e7-6513-40c8-b5e9-f783561435cd" width="180" height="350"></td>
  </tr>
</table>

## Reflection / Challenges

<div align="justify">
During this lab, I discovered how to implement asynchronous programming in Flutter to retrieve API data and utilize setState() to reflect changes to the UI. I also had the opportunity to explore various widgets including ListView.builder, Card, and ElevatedButton to format the layout.

<br>

The first obstacle I faced was managing the nested JSON structure from the API. I had to thoughtfully parse and manage variables in order to retrieve data from very deep nesting. Additionally, I encountered difficulties when managing the layout within a scrollable view while maintaining a clean and visually appealing structure. Utilizing Expanded inside a Column and properly applying SizedBox widgets helped achieve a balanced layout.

<br> <br>
 
<b>Suggestions for Improvement:</b>
<ul>
  <li>Add Error Handling: Display appropriate error messages if the network call fails (e.g., no internet or bad response code).</li>
  <li>Load More Users: Modify the API URL to fetch multiple users (e.g., https://randomuser.me/api/?results=10) and display them in a scrollable list.</li>
  <li>Improve UI/UX: Wrap long fields (like address) with TextOverflow.ellipsis or allow expansion on tap.</li>
  <li>Improve UI/UX: Add animations or shimmer effects for loading states.</li>
</ul>
</div>
