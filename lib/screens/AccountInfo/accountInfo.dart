import 'package:flutter/material.dart';
import 'package:live_streaming/common/AppColor.dart';

class AccountInfo extends StatefulWidget {
  @override
  State<AccountInfo> createState() => _AccountInfoState();
}

class _AccountInfoState extends State<AccountInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             SizedBox(height: 20,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Account Info',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'MrxTvPublic',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50),
          
              // Account Details
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  
                  padding: EdgeInsets.all(10),
                   color: AppColor.primaryTransparent,
                  
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildInfoRow('Username', 'mrx@1994'),
                      _buildInfoRow('Password', '●●●●●●●●'),
                      _buildInfoRow('Account Status', 'Active'),
                      _buildInfoRow('Created At', 'Jan 17, 2024'),
                      _buildInfoRow('Expiry Date', 'Jan 17, 2025'),
                      _buildInfoRow('Is Trial Account', 'No'),
                      _buildInfoRow('Maximum\nConnections', '100'),
                      _buildInfoRow('Active\nConnections', '0'),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
          
              // Buttons Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
          
                    _buildButton(
                      context,
                      title: 'Back',
                      color: AppColor.red,
                      textColor: AppColor.red,
                      backGroundColor: AppColor.primaryTransparent,
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    
                    _buildButton(
                      context,
                      title: 'Refresh',
                      color: AppColor.red,
                      textColor: AppColor.white,
                      backGroundColor: AppColor.red,
                      onTap: () {
                        setState(() {
                          
                        });
                      },
                    ),
                  ],
                ),
              ),
          
              SizedBox(height: 30,),
          
              // Note Section
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Note: If you wish to edit or delete your details, please navigate to the My Playlists screen and perform a long press on your playlist name.',
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper Widget for Info Row
  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: AppColor.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          
          ),
          Text(
            value,
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
            
          ),
        ],
      ),
    );
  }

  // Helper Widget for Buttons
  Widget _buildButton(BuildContext context,
      {required String title, required Color color, textColor, backGroundColor, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 36),
                      decoration: BoxDecoration(
                          color: backGroundColor,
                          border: Border.all(width: 1.5,color: color),
                          borderRadius: BorderRadius.circular(5)
      
                      ),
                      child: Text(title,style: TextStyle(
                        color: textColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),),
                    ),
    );
  }
}

