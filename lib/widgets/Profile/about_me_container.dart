import 'package:flutter/material.dart';

class AboutMeContainer extends StatelessWidget {
  final String email;
  final String description;
  const AboutMeContainer({super.key, required this.email, required this.description});

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(15)
      ),
      child:  Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [


            Row(
              children: [
                const Icon(Icons.mail,),
                const SizedBox(width: 18,),
                Text(email)
              ],
            ),

            const SizedBox(height: 10,),

            Text(description)
          ],
        ),
      ),
    );
  }
}
