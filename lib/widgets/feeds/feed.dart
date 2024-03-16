import 'package:flutter/material.dart';

class feed extends StatelessWidget {
  final String name;
  final String profileType;
  final String content;
  final String? imageUrl;
  final bool likeb;
  final int like;
  const feed(
      {super.key,
      required this.name,
      required this.profileType,
      required this.content,
      this.imageUrl,
      required this.likeb,
      required this.like});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
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
                Text(
                  name,
                  style: const TextStyle(
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
                    child: Center(
                      child: Text(
                        profileType,
                        style: const TextStyle(
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
                  content,
                  style: const TextStyle(fontSize: 14.5),
                ),
                const SizedBox(height: 14),
              ],
            ),
          ),
          isImageDefined(imageUrl),
          Container(
            color: Colors.grey[100],
            padding: const EdgeInsets.only(
              top: 11,
              left: 12.0,
              right: 12.0,
              bottom: 12,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    // setState(() {
                    //   likeb = !likeb;
                    // });
                  },
                  child: likeb
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
          Divider(
            height: 1,
            thickness: 6,
            color: Colors.grey.shade200,
          ),
        ],
      ),
    );
  }
}

Widget isImageDefined(String? imageUrl) {
  if (imageUrl == null) {
    return Container();
  } else {
    return Image.asset(imageUrl);
  }
}
