import 'package:flutter/material.dart';

class Feed extends StatelessWidget {
  final String imageUrl;
  final String username;
  final String postText;
  final bool showFullPost;
  final bool likeButtonState;
  final Function(bool) onLikeButtonPressed;
  final Function() onPostTapped;

  const Feed({
    Key? key,
    required this.imageUrl,
    required this.username,
    required this.postText,
    required this.showFullPost,
    required this.likeButtonState,
    required this.onLikeButtonPressed,
    required this.onPostTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                //bar
                padding: const EdgeInsets.only(
                  top: 10,
                  left: 12,
                  right: 8,
                  bottom: 10,
                ), //bar size
                color: Colors.white,

                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.grey[200],
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      'Username',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const Spacer(),
                    Transform.translate(
                      offset: const Offset(-10, 0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all(
                              color: Colors.grey.shade300,
                            )),
                        constraints: const BoxConstraints(
                          minWidth: 0,
                          minHeight: 32,
                        ),
                        child: const Center(
                          child: Text(
                            'Student',
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.black,
                              // fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: Colors.grey[100],
              padding: const EdgeInsets.only(
                top: 14.0,
                left: 13.5,
                right: 13.5,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    postText,
                    style: const TextStyle(fontSize: 14.5),
                  ),
                  const SizedBox(height: 14),
                ],
              ),
            ),
            if (likeButtonState == false) Image.asset(imageUrl),
          ],
        ),
        Container(
          padding: const EdgeInsets.only(
            top: 11,
            left: 12.0,
            right: 12.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  onLikeButtonPressed(!likeButtonState);
                },
                child: likeButtonState
                    ? const Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 22,
                      )
                    : const Icon(
                        Icons.favorite_outline,
                        color: Colors.black,
                        size: 22,
                      ),
              ),
              const SizedBox(width: 6),
              const Text("Like"),
            ],
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Divider(
          height: 1,
          thickness: 5,
          color: Colors.grey.shade200,
        ),
      ],
    );
  }
}
