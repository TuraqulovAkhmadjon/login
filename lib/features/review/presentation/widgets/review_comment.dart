import 'package:easy_localization/easy_localization.dart';
import 'package:recipe_app/features/review/data/models/review_comment_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:recipe_app/core/utils/colors.dart';

class ReviewComment extends StatelessWidget {
  const ReviewComment({
    super.key,
    required this.comment,
  });

  String getTimeAgo(DateTime created) {
    final Duration difference = DateTime.now().difference(created);
    if (difference.inSeconds < 60) {
      return "${difference.inSeconds} second ago";
    } else if (difference.inMinutes < 60) {
      return "${difference.inMinutes} minute ago";
    } else if (difference.inHours < 24) {
      return "${difference.inHours} hour ago";
    } else if (difference.inDays < 30) {
      return "${difference.inDays} day ago";
    } else {
      return DateFormat('yyyy-MM-dd').format(created);
    }
  }

  final ReviewCommentModel comment;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 36, vertical: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Text(
            "Comments",
            style: TextStyle(
              color: AppColors.redPinkMain,
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: 35,
                height: 35,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(comment.image),
                ),
              ),
              SizedBox(width: 7),
              Text(
                '@${comment.userModel.username}',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    color: AppColors.redPinkMain,
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
              ),
              // Expanded(
              //   child: Text(
              //     commen,
              //     style: TextStyle(
              //       fontFamily: 'Poppins',
              //       color: AppColors.redPinkMain,
              //       fontSize: 15,
              //       fontWeight: FontWeight.w400,
              //     ),
              //     textAlign: TextAlign.end,
              //   ),
              // ),
            ],
          ),
          Text(
            comment.comment,
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
            softWrap: true,
          ),
          Divider(color: Colors.grey[300]),
        ],
      ),
    );
  }
}
