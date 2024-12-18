import 'package:flutter/material.dart';

//backgroundColor: #ddece3
//orange: #fd762c
//text title: #463521
//text light: #4a3b28
//green details: #8fd2c1
//white: #ffffff

class AdoptAppbarWidget extends StatelessWidget {
  const AdoptAppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: const EdgeInsets.only(top: 48, right: 16, left: 16, bottom: 16),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CircleAvatar(
                radius: 34,
                backgroundColor: Color(0xFFfd762c),
              ),
              SizedBox(width: 16),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Ora Back",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 20,
                      color: Color(0xFF463521),
                    ),
                  ),
                  Text(
                    "Volunteer in pet shelter",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                  ),
                  Text(
                    "2 adoptions",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
          Icon(
            Icons.menu,
            color: Color(0xFFfd762c),
            size: 48,
          ),
        ],
      ),
    );
  }
}
