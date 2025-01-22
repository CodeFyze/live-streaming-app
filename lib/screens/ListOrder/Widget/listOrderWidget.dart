import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:live_streaming/common/AppColor.dart';

class ListOrderWidget extends StatefulWidget {
  String heading;
  IconData headingIcon;
  String subtitle;
   ListOrderWidget({super.key,required this.heading,required this.headingIcon, required this.subtitle});

  @override
  State<ListOrderWidget> createState() => _ListOrderWidgetState();
}

class _ListOrderWidgetState extends State<ListOrderWidget> {
   String _selectedCategoryOrder = 'Default';
  String _selectedMovieOrder = 'Default';
  @override
  Widget build(BuildContext context) {
    return Column(
                children: [
                  Row(
                    children: [
                      Icon(widget.headingIcon,size: 30,color: AppColor.white,),
                      SizedBox(width: 5,),
                      Text(
                        widget.heading,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColor.white
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: Container(decoration: BoxDecoration(
                      border: Border.all(color: AppColor.lightGrey,),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Text(
                        'Categories',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColor.white
                        ),
                      ),
                      _buildRadioListTile('Default', 'Categories', _selectedCategoryOrder),
                      _buildRadioListTile('A to Z', 'Categories', _selectedCategoryOrder),
                      _buildRadioListTile('Z to A', 'Categories', _selectedCategoryOrder),
                      ],),
                    ),
                    ),
                  ),
                  SizedBox(height: 16),        
                  Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: Container(decoration: BoxDecoration(
                      border: Border.all(color: AppColor.lightGrey,),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Text(
                        widget.subtitle,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColor.white
                        ),
                      ),
                       _buildRadioListTile('Default', 'Movies', _selectedMovieOrder),
                  _buildRadioListTile('Recent added first', 'Movies', _selectedMovieOrder),
                  _buildRadioListTile('Recent added last', 'Movies', _selectedMovieOrder),
                  _buildRadioListTile('A to Z', 'Movies', _selectedMovieOrder),
                  _buildRadioListTile('Z to A', 'Movies', _selectedMovieOrder),
                      ],),
                    ),
                    ),
                  ),
                ],
              );
  }

  Widget _buildRadioListTile(String title, String group, String selectedValue) {
    return RadioListTile(
      title: Text(title,style: TextStyle(color: AppColor.white),),
      value: title,
      activeColor:AppColor.red,
      groupValue: group == 'Categories' ? _selectedCategoryOrder : _selectedMovieOrder,
      onChanged: (value) {
        setState(() {
          if (group == 'Categories') {
            _selectedCategoryOrder = value as String;
          } else if (group == 'Movies') {
            _selectedMovieOrder = value as String;
          }
        });
      },
    );
  }

}