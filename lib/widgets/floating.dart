import "package:dev_house/widgets/groups/newGroup.dart";
import "package:dev_house/widgets/jobs/newJob.dart";
import "package:dev_house/widgets/feeds/newPost.dart";
import "package:flutter/material.dart";

Container float(
  BuildContext context,
  int selectedNavIndex,
  int selectedTabIndex,
) {
  return selectedNavIndex == 0 || selectedNavIndex == 2
      ? Container(
          margin: const EdgeInsets.only(
            bottom: 15.0,
            right: 3.0,
          ), // Add negative margin to lift the button above the bottom navigation bar
          child: FloatingActionButton(
            onPressed: selectedNavIndex == 0 && selectedTabIndex == 0
                ? () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const NewPost()),
                    );
                  }
                : selectedNavIndex == 0 && selectedTabIndex == 1
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const NewGroup()),
                        );
                      }
                    : selectedNavIndex == 2
                        ? () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const NewJob()),
                            );
                          }
                        : null,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            backgroundColor: const Color.fromARGB(255, 7, 42, 240),
            child: SizedBox(
              height: 28,
              width: 28,
              child: selectedNavIndex == 0 && selectedTabIndex == 0
                  ? Image.asset(
                      "assets/icons/floating.png",
                      color: const Color.fromARGB(255, 248, 245, 245),
                    )
                  : const Icon(
                      Icons.add,
                      color: Color.fromARGB(255, 248, 245, 245),
                    ),
            ),
          ),
        )
      : Container();
}
