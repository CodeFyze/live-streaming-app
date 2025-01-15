import 'package:flutter/material.dart';
import 'package:live_streaming/common/AppColor.dart';
import 'package:live_streaming/common/appUtills.dart';
import 'package:live_streaming/screens/PlayList/myPlaylist.dart';

class CreatePlayListScreen extends StatefulWidget {
  @override
  State<CreatePlayListScreen> createState() => _CreatePlayListScreenState();
}

class _CreatePlayListScreenState extends State<CreatePlayListScreen> {
  @override
  Widget build(BuildContext context) {
    String selectedService = 'MrxTvPublic'; // Default selected item
  List<String> services = ['MrxTvPublic', 'Service1', 'Service2', 'Service3'];

    return Scaffold(
      backgroundColor: AppColor.primary, // Dark background color
      body: Stack(
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Positioned(
            top: -130,
            left: -130,
            child: Container(
                      width: 250,
                      height: 250,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [AppColor.red,AppColor.lightRed]
                          ),
                        shape: BoxShape.circle,
                      ),),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 80),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 
                  // Logo
                  Center(
                    child: Column(
                      children: [
                        Image.asset(
                          appUtills.blackLogo, // Replace with your logo asset
                          height: 100,
                        ),
                        
                        SizedBox(height: 40),
                      ],
                    ),
                  ),
                  // Service Dropdown (Mockup)
                  Row(
                children: [
                  Icon(Icons.http, color: Colors.white), // Icon
                  SizedBox(width: 8),
                  Text(
                    'Service',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
                  Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: AppColor.darkGrey, // Dropdown background color
                  borderRadius: BorderRadius.circular(8),
                ),
                child: DropdownButton<String>(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  value: selectedService,
                  dropdownColor: AppColor.darkGrey, // Dropdown items background color
                  icon: SizedBox.shrink(), // Dropdown arrow color
                  underline: SizedBox(), // Removes underline
                  isExpanded: true,
                  style: TextStyle(color: AppColor.white, fontSize: 16),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedService = newValue!;
                    });
                  },
                  items: services.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
                  SizedBox(height: 20),
                  // Username Field
                  TextFormField(
                     style: TextStyle(color: AppColor.white), 
                    decoration: InputDecoration(
                      
                      contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 12.0),
                      prefixIcon: Icon(Icons.person),
                      labelText: 'Username',
                      filled: true,
                      fillColor: Colors.black,
                      labelStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  // Password Field
                  Row(
                    
                    children: [
                      Icon(Icons.key_rounded,size: 20,color:Colors.white),
                      SizedBox(width: 10,),
                      Text("Password",style: TextStyle(
                        fontSize: 20,
                        color: AppColor.white
                      ),),
                    ],
                  ),
                  TextFormField(
                    obscureText: true,
                    style: TextStyle(color: Colors.white), 
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 12.0),
                      prefixIcon: Icon(Icons.lock),
                      labelText: 'Password',
                      filled: true,
                      fillColor: Colors.black,
                      labelStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  // Add Playlist Button
                  GestureDetector(
                    onTap: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyPlaylist()));
                    },
                    child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                  color: AppColor.buttonRed, // Button color
                  borderRadius: BorderRadius.circular(8.0),
            ),
            padding: EdgeInsets.symmetric(vertical: 16.0), // Button height
            child: Text(
                  'Add Playlist',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        
        Positioned(
                          bottom: -140,
            right: -80,
      
            child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [AppColor.red,AppColor.lightRed]
                          ),
                       shape: BoxShape.circle,
                      ),),
          ),
        ],
      ),
    );
  }
}