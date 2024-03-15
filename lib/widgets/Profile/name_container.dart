import 'package:flutter/material.dart';

class ProfileNameContainer extends StatelessWidget {
  final String userName;
  const ProfileNameContainer({
    super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(15)
      ),
      child:  Padding(
        padding:  const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(
                Icons.account_circle_outlined,
              size: 50,
            ),

            const SizedBox(width: 20,),

            Text(
              userName,
              style: const TextStyle(
                fontSize: 28
              ),
            )
          ],
        ),
      ),
    );
  }
}
