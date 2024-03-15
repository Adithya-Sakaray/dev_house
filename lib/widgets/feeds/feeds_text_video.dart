import 'dart:async';

import 'package:dev_house/screens/group_detail_screen.dart';
import 'package:dev_house/screens/others_profile_screen.dart';
import 'package:dev_house/screens/share_post_screen.dart';
import 'package:flutter/material.dart';
import 'menu.dart';
import 'video.dart';
import 'views.dart';

class feeds_f extends StatefulWidget {
  const feeds_f({super.key});

  @override
  _feeds_fState createState() => _feeds_fState();
}

class _feeds_fState extends State<feeds_f> {
  late ScrollController _scrollController;
  late List<bool> _isVideoPlayed;
  bool likeb = false;
  bool dislikeb = false;
  bool saveb = false;
  int like = 0;
  int dislike = 0;
  int views = 0;
  int comments = 3;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _isVideoPlayed = List.generate(3, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        controller: _scrollController,
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              BuildPost(
                context: context, // Pass context here
                type: 'textAndVideo',
                text:
                    'Wrapping up an unforgettable chapter at VIT Chennai with the grand finale of Vibrance\'24! 🎭 It\'s bittersweet bidding adieu to this cultural extravaganza, especially as it marks my final Vibrance as an organizer. The journey has been nothing short of incredible, filled with emotions as we wrapped up on a high note.',

                videoUrl: 'assets/videos/video.mp4',
                scrollController: _scrollController,
                isVideoPlayed: _isVideoPlayed,
                index: index,
                likeb: likeb,
                dislikeb: dislikeb,
                views: views,
                like: like,
                dislike: dislike,
                saveb: saveb,
                comments: comments,
              ),
              Divider(
                height: 1,
                thickness: 6.3,
                color: Colors.grey.shade100,
              ),
            ],
          );
        },
      ),
    );
  }
}

// ignore: must_be_immutable
class BuildPost extends StatefulWidget {
  final BuildContext context;
  final String? type;
  final String? text;
  final String? videoUrl;
  final ScrollController scrollController;
  final List<bool> isVideoPlayed;
  final int index;
  bool likeb; // Change here
  bool dislikeb;
  int like;
  int dislike;
  int views;
  int comments;

  bool saveb; // Change here

  BuildPost({
    Key? key,
    required this.context,
    required this.type,
    this.text,
    this.videoUrl,
    required this.scrollController,
    required this.isVideoPlayed,
    required this.index,
    required this.like,
    required this.dislike,
    required this.views,
    required this.saveb,
    required this.likeb, // Change here
    required this.dislikeb,
    required this.comments,
  }) : super(key: key);

  @override
  _BuildPostState createState() => _BuildPostState();
}

class _BuildPostState extends State<BuildPost> {
  bool _showAnimatedIconl = false;
  bool _showAnimatedIcons = false;
  bool showFullPost = false;
  bool hasLiked = false; // Track if the post has been liked
  bool hasDisliked = false;
  void doubleTap() {
    setState(() {
      // Toggle the like button
      widget.likeb = !widget.likeb;

      // If the like button is now selected, ensure dislike button is deselected

      if (!hasLiked) {
        // Increment the like count and mark the post as liked
        widget.like++;
        hasLiked = true;
      } else {
        // Decrement the like count and mark the post as unliked
        widget.like--;
        hasLiked = false;
      }

      _showAnimatedIconl = true;
      Timer(const Duration(milliseconds: 500), () {
        setState(() {
          _showAnimatedIconl = false;
        });
      });
    });
  }

  String _getDisplayFullPost() {
    const maxCharactersToShow = 300;
    if (widget.text!.length <= maxCharactersToShow) {
      return widget.text!;
    } else {
      return '${widget.text!.substring(0, maxCharactersToShow)}... see more';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const OthersProfileScreen(),
                ),
              );
            },
            child: Container(
              //bar
              padding: const EdgeInsets.only(
                top: 8,
                left: 8,
                right: 8,
                bottom: 8,
              ), //bar size
              color: Colors.white,

              child: Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.grey[200],
                  ),
                  const SizedBox(width: 12),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Username',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.verified,
                            color: Colors.blue,
                            size: 16,
                          ),
                          Text(
                            'Verified Professional',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  Transform.translate(
                    offset: const Offset(9.5, 0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const GroupDetailScreen(),
                            ),
                          );
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.lightGreen[200],
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 0,
                          minHeight: 32,
                        ),
                        child: const Center(
                          child: Text(
                            'Finance',
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.black,
                              // fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: const Offset(
                        8, 0), // Adjust the X and Y offset as needed
                    child: IconButton(
                      icon: const Icon(
                        Icons.more_vert,
                        size: 22,
                      ),
                      onPressed: () {
                        // Open bottom sheet menu
                        _menuBottomSheet(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (widget.type == 'textAndVideo')
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  color: Colors.grey[100],
                  padding: const EdgeInsets.only(
                    top: 14.0,
                    // bottom: 0, //change
                    left: 13.5,
                    right: 13.5,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            showFullPost = !showFullPost;
                          });
                        },
                        onDoubleTap: () {
                          doubleTap();
                        },
                        child: Text(
                          showFullPost ? widget.text! : _getDisplayFullPost(),
                          style: const TextStyle(fontSize: 14.5),
                        ),
                      ),
                      const SizedBox(height: 14),
                    ],
                  ),
                ),
                const VideoPlayerWidget(videoPath: "assets/videos/video.mp4"),
              ],
            ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.only(
              // top: 8,
              bottom: 16.0, //change
              left: 12.0,
              right: 12.0,
            ),
            child: Column(
              children: [
                // const Divider(),
                const SizedBox(height: 11),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          // Toggle the like button
                          widget.likeb = !widget.likeb;

                          // If the like button is now selected, ensure dislike button is deselected

                          if (!hasLiked) {
                            // Increment the like count and mark the post as liked
                            widget.like++;
                            hasLiked = true;
                          } else {
                            // Decrement the like count and mark the post as unliked
                            widget.like--;
                            hasLiked = false;
                          }

                          _showAnimatedIconl = true;
                          Timer(const Duration(milliseconds: 500), () {
                            setState(() {
                              _showAnimatedIconl = false;
                            });
                          });
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.only(
                          top: 5,
                          bottom: 5,
                          left: 8,
                          right: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(
                              10), // Adjust the radius as needed
                        ),
                        child: Row(
                          children: [
                            _showAnimatedIconl && widget.likeb == true
                                ? Image.asset(
                                    "assets/icons/feed/like_o.gif",
                                    height: 20,
                                    width: 20,
                                    color:
                                        const Color.fromARGB(255, 7, 42, 240),
                                  )
                                : widget.likeb == false
                                    ? Image.asset(
                                        "assets/icons/feed/like_b.png",
                                        height: 20,
                                        width: 20,
                                      )
                                    : Image.asset(
                                        "assets/icons/feed/like_a.png",
                                        height: 20,
                                        width: 20,
                                        color: const Color.fromARGB(
                                            255, 7, 42, 240),
                                      ),
                            const SizedBox(width: 4),
                            widget.like == 0
                                ? const Text(
                                    "Like",
                                    style: TextStyle(fontSize: 14),
                                  )
                                : Text(
                                    widget.like.toString(),
                                    style: const TextStyle(fontSize: 14),
                                  ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ), // Spacing between likeb and dislikeb

                    GestureDetector(
                      onTap: () {
                        print("comment");
                      },
                      child: Image.asset(
                        "assets/icons/feed/comment.png",
                        height: 21.5,
                        width: 21.5,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      widget.comments.toString(),
                      style: const TextStyle(fontSize: 14),
                    ),
                    const SizedBox(
                        width: 12), // Spacing between dislikeb and share
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SharePostScreen(),
                            ),
                          );
                        });
                      },
                      child: Image.asset(
                        "assets/icons/feed/share.png",
                        height: 24,
                        width: 24,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        // const Icon(Icons.visibility, size: 18),
                        GestureDetector(
                          onTap: () {
                            _showViewsBottomSheet(context);
                          },
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/icons/feed/views.png",
                                height: 20,
                                width: 20,
                              ),
                              const SizedBox(width: 4),
                              const Padding(
                                padding: EdgeInsets.only(top: 2.5),
                                child:
                                    Text('100', style: TextStyle(fontSize: 14)),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(
                          width: 13.5,
                        ), // Spacing between views and save
                        // Icon(Icons.save, size: 18),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              widget.saveb = !widget.saveb;
                              _showAnimatedIcons = true;
                              Timer(const Duration(milliseconds: 500), () {
                                setState(() {
                                  _showAnimatedIcons = false;
                                });
                              });
                            });
                          },
                          child: _showAnimatedIcons && widget.saveb == true
                              ? Image.asset(
                                  "assets/icons/feed/save_o.gif",
                                  height: 20,
                                  width: 20,
                                )
                              : widget.saveb == false
                                  ? Image.asset(
                                      "assets/icons/feed/save_b.png",
                                      height: 20,
                                      width: 20,
                                    )
                                  : Image.asset(
                                      "assets/icons/feed/save_a.png",
                                      height: 20,
                                      width: 20,
                                    ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void _showViewsBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
    ),
    builder: (BuildContext context) {
      return const ViewsBottomSheet();
    },
  );
}

void _menuBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
    ),
    backgroundColor: const Color.fromARGB(255, 253, 249, 249),
    builder: (BuildContext context) {
      return const MenuBottomSheet();
    },
  );
}
