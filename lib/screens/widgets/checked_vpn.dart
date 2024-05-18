import 'package:WhatsUp/core/resource/constants/my_colors.dart';
import 'package:WhatsUp/core/resource/constants/my_dimensions.dart';
import 'package:WhatsUp/core/resource/constants/my_strings.dart';
import 'package:flutter/material.dart';
import 'package:vpn_connection_detector/vpn_connection_detector.dart';

class CheckedVpn extends StatelessWidget {
  const CheckedVpn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
  future: VpnConnectionDetector.isVpnActive(), // Ensure this future is correct
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const CircularProgressIndicator();
    } else if (snapshot.hasError) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'خطا در دریافت اطلاعات',
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(
                fontSize: 20,
              ),
        ),
      );
    } else if (snapshot.hasData) {
  bool isActive = snapshot.data ?? false;
  
  // اگر VPN روشن باشد، یک SizedBox با ارتفاع 0 برگردانید
  if (isActive) {
    return SizedBox(height: 0);
  }
  
  String statusText = '';
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: 50,
      color: MyColors.backgroundCheckedVpnColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(MyStrings.checkedVpn,
          style: TextStyle(color: MyColors.checkedTextVpnColor,),),
          SizedBox(width: MyDimensions.small),
          Text(
            statusText,
            overflow: TextOverflow.visible,
            maxLines: 1,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: MyColors.checkedTextVpnColor,
              fontSize: 10,
            )
          ),
        ],
      ),
    ),
  );
}
else {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'اطلاعاتی موجود نیست',
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(
                fontSize: 20,
              ),
        ),
      );
    }
  },
);
  }
}