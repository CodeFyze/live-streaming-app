import 'package:flutter/material.dart';
import 'package:live_streaming/common/AppColor.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: AppColor.primary, 
         padding: EdgeInsets.symmetric(horizontal: 10,vertical: 40),
         
        child: ListView(
          children: [
            // Drawer Header
            Container(
              // Slightly lighter background for the header
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
 color: AppColor.primaryTransparent,
 borderRadius: BorderRadius.circular(16)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.people, size: 40, color: Colors.white),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Name:  MrxTvPublic',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            'Username  mrx@1994',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios, color: Colors.white),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Refreshed On: Jan 13, 2025 | 12:46 PM',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 10,
                    ),
                  ),
                  Text(
                    'Auto refreshes every 12 hours.',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),

            // Drawer Items
            _buildDrawerItem(Icons.playlist_play, 'My Playlists', context),
            _buildDrawerItem(Icons.download, 'Downloader 1', context),
            _buildDrawerItem(Icons.download, 'Downloader 2', context),
            _buildDrawerItem(Icons.movie, 'Catchup', context),
            _buildDrawerItem(Icons.history, 'Watch History', context),
            _buildDrawerItem(Icons.grid_view, 'Multi-Screen', context),
            _buildDrawerItem(Icons.play_circle_filled, 'External Players', context),
            _buildDrawerItem(Icons.radio, 'Radio', context, trailingWidget: Text(
              'VIP',
              style: TextStyle(
                color: Colors.yellow,
                fontWeight: FontWeight.bold,
              ),
            )),

            Divider(color: Colors.white24, thickness: 1),

            // Actions Section
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Actions',
                style: TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            _buildDrawerItem(Icons.refresh, 'Force Refresh', context),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title, BuildContext context, {Widget? trailingWidget}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        decoration: BoxDecoration(
      color: AppColor.primaryTransparent,
        borderRadius: BorderRadius.circular(16)
        ),
        
        child: ListTile(
          leading: Icon(icon, color: AppColor.white,),
          title: Text(
            title,
            style: TextStyle(
              color: AppColor.white,
              fontSize: 14,
            ),
          ),
          trailing: trailingWidget,
          onTap: () {
            // Handle item tap
            Navigator.pop(context); // Close the drawer
          },
        ),
      ),
    );
  }
}
