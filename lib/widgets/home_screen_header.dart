import 'package:flutter/material.dart';

class HomeScreenHeader extends StatefulWidget {
  const HomeScreenHeader({super.key});

  @override
  State<HomeScreenHeader> createState() => _HomeScreenHeaderState();
}

class _HomeScreenHeaderState extends State<HomeScreenHeader> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.only(left: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Top Stories',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          TextButton(
            onPressed: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context)=> NewsByCategoryScreen()));
            },
            child: Text('Show All', style: TextStyle(color: Colors.blue)),
          ),
        ],
      ),
    );
  }
}
