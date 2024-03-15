import 'package:flutter/material.dart';

class ProfileNameContainer extends StatelessWidget {
  final String userName;
  final IconData icon;
  final String role;
  const ProfileNameContainer({
    super.key, required this.userName, required this.icon, required this.role});

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
             Icon(
                icon,
              size: 50,
            ),

            const SizedBox(width: 20,),

            Text(
              userName,
              style: const TextStyle(
                fontSize: 28
              ),
            ),

            Spacer(),
            
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.black,
                  )
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                  child: Text(role),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
