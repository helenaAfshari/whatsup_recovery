import 'package:WhatsUp/core/resource/constants/my_colors.dart';
import 'package:WhatsUp/core/resource/constants/my_dimensions.dart';
import 'package:WhatsUp/core/resource/constants/my_strings.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AppBarCustomWidget extends StatelessWidget implements PreferredSizeWidget{
   AppBarCustomWidget({
    
    required this.size, 
    required this.text, 
    required  this.textStyle,
    this.icon=const SizedBox(),
    this.showPopupMenu = false, 
  });

  final Size size;
  final String text;
  final Widget icon;
   final  TextStyle textStyle;
     final bool showPopupMenu; // New boolean parameter


  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size(size.width,size.height*.1 ),
    child:
     Row(
  children: [
    SizedBox(width: MyDimensions.medium-1,),
    ...[
    icon,
    SizedBox(width: MyDimensions.small),
  ],
    SizedBox(width: MyDimensions.small+2,),
    Text(
      text,
      style: textStyle,
    ),

            SizedBox(width: MyDimensions.xxlarge-30,),
              if (showPopupMenu) // Conditionally include the PopupMenuButton
            PopupMenuButton(
              icon: Icon(
                Icons.more_vert_outlined,
                color: MyColors.primaryButtonColor,
              ),
              offset: Offset(0, 56),
              iconSize: MyDimensions.large - 4,
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: Container(
                    height: MyDimensions.large + 3,
                    width: MyDimensions.xxlarge - 100,
                    child: GestureDetector(
                      onTap: () async {
                        if (await canLaunchUrl(Uri.parse(MyStrings.support))) {
                          await launchUrl(Uri.parse(MyStrings.support));
                        }
                      },
                      child: Text(MyStrings.supportText),
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
      );
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(size.height*.1);
}
