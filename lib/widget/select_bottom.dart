import 'package:flutter/material.dart';

class SelectBottom extends StatefulWidget {
  final Map<String, dynamic> params;

  SelectBottom({@required this.params});

  @override
  _SelectBottomState createState() => _SelectBottomState();
}

class _SelectBottomState extends State<SelectBottom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: widget.params
            .map((key, value) {
              return MapEntry(
                  key,
                  ListTile(
                    onTap: () {
                      Navigator.pop(context, {'key': key, "value": value});
                    },
                    title: Text(key),
                  ));
            })
            .values
            .toList(),
      ),
    );
  }
}
