
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            size: 24,
            color: Colors.black87,
          ),
        ),
        Spacer(),
        const Icon(
          Icons.share_rounded,
          size: 24,
          color: Colors.black87,
        ),
        const SizedBox(width: 12),
        const Icon(
          Icons.more_vert,
          size: 24,
          color: Colors.black87,
        ),
      ],
    );
  }
}
