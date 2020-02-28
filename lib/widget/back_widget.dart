import 'package:flutter/material.dart' hide Action;

class BackWidget extends StatefulWidget implements PreferredSizeWidget {
  @override
  _BackWidgetState createState() => _BackWidgetState();

  @override
  Size get preferredSize => Size(double.infinity, 44.0);
}

class _BackWidgetState extends State<BackWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: SafeArea(
        top: true,
        child: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: IconButton(
            icon: Image.asset(
              'assets/nav_back.png',
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}
