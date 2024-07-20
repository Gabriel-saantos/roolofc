import 'package:flutter/material.dart';
import 'package:rool/main.dart';

class BuildLikeAndCommentButtons extends StatefulWidget {
  @override
  _BuildLikeAndCommentButtonsState createState() =>
      _BuildLikeAndCommentButtonsState();
}

class _BuildLikeAndCommentButtonsState
    extends State<BuildLikeAndCommentButtons> {
  bool isLiked = false;
  int likeCount = 0;
  int commentCount = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    isLiked = !isLiked;
                    likeCount += isLiked ? 1 : -1;
                  });
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.favorite_border,
                      size: 20.0,
                      color: Colors.white,
                    ),
                    Text(
                      '  $likeCount',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10.0),
              Container(
                height: 20.0,
                width: 1.0,
                color: Colors.grey,
                margin: const EdgeInsets.only(left: 10.0, right: 10.0),
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.mode_comment_outlined,
                        size: 20.0, color: Colors.white),
                    onPressed: () {
                      setState(() {
                        commentCount++;
                      });
                    },
                  ),
                  Text(
                    "$commentCount",
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Spacer(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: OutlinedButton.icon(
                    onPressed: () {
                      setState(() {
                        isLiked = !isLiked;
                        likeCount += isLiked ? 1 : -1;
                      });
                    },
                    icon: Icon(
                      isLiked ? Icons.favorite : Icons.favorite_border,
                      color: isLiked ? baseColor : Colors.white,
                    ),
                    label: Text(
                      isLiked ? "CURTIDO" : "CURTIR",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: OutlinedButton.icon(
                    onPressed: () {
                      setState(() {
                        commentCount++;
                      });
                    },
                    icon: Icon(
                      Icons.mode_comment_outlined,
                      color: Colors.white,
                    ),
                    label: Text(
                      "COMENTAR",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
