
import 'package:WhatsUp/core/resource/constants/my_colors.dart';
import 'package:WhatsUp/core/resource/constants/my_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:WhatsUp/domain/model/service_whatsup_model.dart/service_whatsup_model.dart';

class DetailsNotificationHistoryList extends StatelessWidget {
  final RoomModel? room;
  const DetailsNotificationHistoryList({super.key, required this.room});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          room!.lastMsg.servicenotif.title.toString(),
          style: TextStyle(color: MyColors.textColor, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: MyColors.textColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: MyColors.backgroundColor,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage("assets/images/background.png"),
          ),
        ),
        child: ListView.builder(
          reverse: false, // اینجا برای شروع از آخرین مورد استفاده می‌شود
          itemCount: room?.messages.length,
          itemBuilder: (context, index) {
            final chat = room!.messages[index];
            return Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding:  EdgeInsets.only(left: MyDimensions.xxlarge-100, right: MyDimensions.xLight-2, bottom: MyDimensions.xLight),
                child: Card(
                  color: MyColors.backgroundTextChatColor,
                  elevation: 8,
                  child: IntrinsicWidth(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(left: MyDimensions.xLight-2, top: MyDimensions.light),
                          child: Text(
                            chat.servicenotif.content.toString(),
                            style: TextStyle(
                              fontSize: MyDimensions.medium,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: EdgeInsets.only(left: MyDimensions.xLight-2),
                            child: Text(
                              DateFormat('HH:mm:ss a').format(chat.date),
                              style: TextStyle(
                                fontSize: MyDimensions.light+2,
                                color: Colors.grey                                                                                                                                                                                                                                                                                                                                                                                                                    ,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: MyDimensions.small+1,)
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
