import 'package:flutter/material.dart';
import '../video.dart';

class feeds_t extends StatefulWidget {
  const feeds_t({super.key});

  @override
  _feeds_tState createState() => _feeds_tState();
}

class _feeds_tState extends State<feeds_t> {
  late ScrollController _scrollController;
  late List<bool> _isVideoPlayed;
  int like = 0;
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
          return BuildPost(
            context: context, // Pass context here
            type: 'textAndPhoto',
            text: 'This is a post with text and photo.',
            imageUrl: 'assets/images/link.jpeg',
            scrollController: _scrollController,
            isVideoPlayed: _isVideoPlayed,
            index: index,
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

  const BuildPost({
    Key? key,
    required this.context,
    required this.type,
    this.text,
    this.imageUrl,
    this.videoUrl,
    required this.scrollController,
    required this.isVideoPlayed,
    required this.index,
  }) : super(key: key);

  @override
  _BuildPostState createState() => _BuildPostState();
}

class _BuildPostState extends State<BuildPost> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Container(
        padding: const EdgeInsets.all(8.0),
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
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(12.0),
                  ),
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
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.text!,
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 12),
                      const Row(
                        children: [
                          // Icons for like, dislike, and share on left corner
                          Icon(Icons.thumb_up, size: 18),
                          SizedBox(width: 4),
                          Text('15', style: TextStyle(fontSize: 14)),
                          SizedBox(
                              width: 16), // Spacing between like and dislike
                          Icon(Icons.thumb_down, size: 18),
                          SizedBox(width: 4),
                          // No text for dislikes
                          SizedBox(
                              width: 16), // Spacing between dislike and share
                          Icon(Icons.share, size: 18),
                          Spacer(), // Spacer to push the views and save to the right corner
                          // Icons for views and save on right corner
                          Row(
                            children: [
                              Icon(Icons.visibility, size: 18),
                              SizedBox(width: 4),
                              Text('100', style: TextStyle(fontSize: 14)),
                              SizedBox(
                                  width: 16), // Spacing between views and save
                              Icon(Icons.save, size: 18),
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
                          // Icons for like, dislike, and share on left corner
                          Icon(Icons.thumb_up, size: 18),
                          SizedBox(width: 4),
                          Text('15', style: TextStyle(fontSize: 14)),
                          SizedBox(
                              width: 16), // Spacing between like and dislike
                          Icon(Icons.thumb_down, size: 18),
                          SizedBox(width: 4),
                          // No text for dislikes
                          SizedBox(
                              width: 16), // Spacing between dislike and share
                          Icon(Icons.share, size: 18),
                          Spacer(), // Spacer to push the views and save to the right corner
                          // Icons for views and save on right corner
                          Row(
                            children: [
                              Icon(Icons.visibility, size: 18),
                              SizedBox(width: 4),
                              Text('100', style: TextStyle(fontSize: 14)),
                              SizedBox(
                                  width: 16), // Spacing between views and save
                              Icon(Icons.save, size: 18),
                            ],
                          ), // Spacer to push the views and save to the right corner
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
                    VideoPlayerWidget(videoPath: widget.videoUrl!),
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
                              // Icons for like, dislike, and share on left corner
                              Icon(Icons.thumb_up, size: 18),
                              SizedBox(width: 4),
                              Text('15', style: TextStyle(fontSize: 14)),
                              SizedBox(
                                  width:
                                      16), // Spacing between like and dislike
                              Icon(Icons.thumb_down, size: 18),
                              SizedBox(width: 4),
                              // No text for dislikes
                              SizedBox(
                                  width:
                                      16), // Spacing between dislike and share
                              Icon(Icons.share, size: 18),
                              Spacer(), // Spacer to push the views and save to the right corner
                              // Icons for views and save on right corner
                              Row(
                                children: [
                                  Icon(Icons.visibility, size: 18),
                                  SizedBox(width: 4),
                                  Text('100', style: TextStyle(fontSize: 14)),
                                  SizedBox(
                                      width:
                                          16), // Spacing between views and save
                                  Icon(Icons.save, size: 18),
                                ],
                              ), // Space// Spacer to push the views and save to the right corner
                            ],
                          ),
                        ],
                      ),
                    ),
// Add Video Player Widget for videoUrl
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
