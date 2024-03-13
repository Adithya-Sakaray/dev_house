// ignore_for_file: must_be_immutable
import 'dart:async';
import 'package:flutter/material.dart';
import '../video.dart';

class feeds_l extends StatefulWidget {
  const feeds_l({super.key});

  @override
  _feeds_lState createState() => _feeds_lState();
}

class _feeds_lState extends State<feeds_l> {
  late ScrollController _scrollController;
  late List<bool> _isVideoPlayed;
  bool likeb = false;
  bool dislikeb = false;
  bool saveb = false;
  int like = 4;
  int dislike = 0;
  int views = 0;

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
                context: context,
                type: 'text',
                text:
                    'Mohandas Karamchand Gandhi was an Indian lawyer, anti-colonial nationalist and political ethicist who employed nonviolent resistance to lead the successful campaign for India\'s independence from British rule. He inspired movements for civil rights and freedom across the world.',
                scrollController: _scrollController,
                isVideoPlayed: _isVideoPlayed,
                index: index,
                likeb: likeb,
                dislikeb: dislikeb,
                views: views,
                like: like,
                dislike: dislike,
                saveb: saveb,
              ),
              // const Divider(),
            ],
          );
        },
      ),
    );
  }
}

class BuildPost extends StatefulWidget {
  final BuildContext context;
  final String? type;
  final String? text;
  final String? imageUrl;
  final String? videoUrl;
  final ScrollController scrollController;
  final List<bool> isVideoPlayed;
  final int index;
  bool likeb; // Change here
  bool dislikeb;
  int like;
  int dislike;
  int views;
  bool saveb; // Change here

  BuildPost({
    Key? key,
    required this.context,
    required this.type,
    this.text,
    this.imageUrl,
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

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white, // Changed the background color
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
        child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(12.0)),
                ),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.white,
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
                    IconButton(
                      icon: const Icon(Icons.more_vert),
                      onPressed: () {
                        // Open menu
                      },
                    ),
                  ],
                ),
              ),
              if (widget.type == 'text')
                Padding(
                  padding: const EdgeInsets.only(
                    top: 12.0,
                    bottom: 12.0,
                    left: 12.0,
                    right: 12.0,
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
                        child: Text(
                          showFullPost ? widget.text! : _getDisplayFullPost(),
                          style: const TextStyle(fontSize: 14.5),
                        ),
                      ),
                      const SizedBox(height: 6),
                      const Divider(),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                // Toggle the like button
                                widget.likeb = !widget.likeb;

                                // If the like button is now selected, ensure dislike button is deselected
                                if (widget.likeb) {
                                  widget.dislikeb = false;
                                }
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
                                          "assets/icons/like_o.gif",
                                          height: 20,
                                          width: 20,
                                          color: const Color.fromARGB(
                                              255, 7, 42, 240),
                                        )
                                      : widget.likeb == false
                                          ? Image.asset(
                                              "assets/icons/like_b.png",
                                              height: 20,
                                              width: 20,
                                            )
                                          : Image.asset(
                                              "assets/icons/like_a.png",
                                              height: 20,
                                              width: 20,
                                              color: const Color.fromARGB(
                                                  255, 7, 42, 240),
                                            ),
                                  const SizedBox(width: 4),
                                  Text(widget.like.toString(),
                                      style: const TextStyle(fontSize: 14)),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ), // Spacing between likeb and dislikeb
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                // Toggle the dislike button
                                widget.dislikeb = !widget.dislikeb;

                                // If the dislike button is now selected, ensure like button is deselected
                                if (widget.dislikeb) {
                                  widget.likeb = false;
                                }
                              });
                            },
                            child: widget.dislikeb == false
                                ? Image.asset(
                                    "assets/icons/dlike_b.png",
                                    height: 20,
                                    width: 20,
                                  )
                                : Image.asset(
                                    "assets/icons/dlike_a.png",
                                    height: 20,
                                    width: 20,
                                    color:
                                        const Color.fromARGB(255, 7, 42, 240),
                                  ),
                          ),

                          const SizedBox(
                              width: 16), // Spacing between dislikeb and share
                          const Icon(Icons.share, size: 20),

                          const Spacer(),
                          Row(
                            children: [
                              // const Icon(Icons.visibility, size: 18),
                              Image.asset(
                                "assets/icons/views.png",
                                height: 20,
                                width: 20,
                              ),
                              const SizedBox(width: 4),
                              const Padding(
                                padding: EdgeInsets.only(top: 2.5),
                                child:
                                    Text('100', style: TextStyle(fontSize: 14)),
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
                                    Timer(const Duration(milliseconds: 500),
                                        () {
                                      setState(() {
                                        _showAnimatedIcons = false;
                                      });
                                    });
                                  });
                                },
                                child:
                                    _showAnimatedIcons && widget.saveb == true
                                        ? Image.asset(
                                            "assets/icons/save_o.gif",
                                            height: 20,
                                            width: 20,
                                          )
                                        : widget.saveb == false
                                            ? Image.asset(
                                                "assets/icons/save_b.png",
                                                height: 20,
                                                width: 20,
                                              )
                                            : Image.asset(
                                                "assets/icons/save_a.png",
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
              if (widget.type == 'textAndPhoto')
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.text!,
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 12),
                        ],
                      ),
                    ),
                    Image.asset(widget.imageUrl!),
                    const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          Icon(Icons.thumb_up, size: 18),
                          SizedBox(width: 4),
                          Text('15', style: TextStyle(fontSize: 14)),
                          SizedBox(width: 16),
                          Icon(Icons.thumb_down, size: 18),
                          SizedBox(width: 4),
                          Icon(Icons.share, size: 18),
                          Spacer(),
                          Row(
                            children: [
                              Icon(Icons.visibility, size: 18),
                              SizedBox(width: 4),
                              Text('100', style: TextStyle(fontSize: 14)),
                              SizedBox(width: 16),
                              Icon(Icons.save, size: 18),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              if (widget.type == 'textAndVideo')
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.text!,
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 12),
                        ],
                      ),
                    ),
                    const VideoPlayerWidget(
                        videoPath: "assets/images/video.mp4"),
                    const Padding(
                      padding: EdgeInsets.only(
                        top: 16.0,
                        bottom: 14.0,
                        left: 12.0,
                        right: 12.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.thumb_up, size: 18),
                              SizedBox(width: 4),
                              Text('15', style: TextStyle(fontSize: 14)),
                              SizedBox(width: 16),
                              Icon(Icons.thumb_down, size: 18),
                              SizedBox(width: 4),
                              Icon(Icons.share, size: 18),
                              Spacer(),
                              Row(
                                children: [
                                  Icon(Icons.visibility, size: 18),
                                  SizedBox(width: 4),
                                  Text('100', style: TextStyle(fontSize: 14)),
                                  SizedBox(width: 16),
                                  Icon(Icons.save, size: 18),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  String _getDisplayFullPost() {
    const maxCharactersToShow = 300;
    if (widget.text!.length <= maxCharactersToShow) {
      return widget.text!;
    } else {
      return '${widget.text!.substring(0, maxCharactersToShow)}... see more';
    }
  }
}
