import 'package:flutter/material.dart';

class AboutMeContainer extends StatelessWidget {
  const AboutMeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(15)
      ),
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [


            Row(
              children: [
                Icon(Icons.mail,),
                SizedBox(width: 18,),
                Text("email@gmail.com")
              ],
            ),

            SizedBox(height: 10,),

            Text("mfnvdkfjnvfjvfdv dfvjkfvf vmdfvkdfvd fkjbvd vfdn vv  vfjv fdvdfv djv dfv fdvjkdf vfv fv jf")
          ],
        ),
      ),
    );
  }
}
