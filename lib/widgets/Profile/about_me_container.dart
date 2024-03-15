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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [

            Row(
              children: [
                Icon(Icons.location_on_outlined,),
                SizedBox(width: 18,),
                Text("Location")
              ],
            ),

            SizedBox(height: 10,),

            Row(
              children: [
                Icon(Icons.date_range,),
                SizedBox(width: 18,),
                Text("12/12/2000")
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
