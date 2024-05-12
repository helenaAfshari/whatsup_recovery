

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:WhatsUp/core/components/customwidgets/custom_divider.dart';
import 'package:WhatsUp/core/resource/constants/my_colors.dart';
import 'package:WhatsUp/core/resource/constants/my_dimensions.dart';
import 'package:WhatsUp/core/resource/constants/my_strings.dart';
import 'package:WhatsUp/core/resource/constants/theme/my_theme.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
     backgroundColor: MyColors.backgroundDrawerColor,
     child:  DrawerHeader(
       child: ListView(
         children: [    
          Container(
          
            height: MyDimensions.xlarge*3,
            color: Colors.amber,
          ),
           CustomDivider(endIndent: 10, indent: 10),
            Gap(MyDimensions.medium),
        Row(
             mainAxisAlignment: MainAxisAlignment.end,
             children: [
                GestureDetector(
                  onTap: () async {
                   
                 },
                 child: Text(MyStrings.hello,style:  MyTHeme.lightTheme().textTheme.titleLarge,)),
           
             ],
           ),
         
         ],
       ) ,),
        );
  }
}