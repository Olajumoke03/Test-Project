import 'package:flutter/material.dart';

class BuildErrorUi extends StatefulWidget {
  final String message;

  const BuildErrorUi({super.key, required this.message});

  @override
  State<BuildErrorUi> createState() => _BuildErrorUiState();
}

class _BuildErrorUiState extends State<BuildErrorUi> {
  @override
  Widget build(BuildContext context) {
    return Center (
      child: Text ( widget.message ,
        style:  TextStyle (
          color: Theme.of(context).textTheme.bodyMedium!.color,
          fontSize: 15 ) ,
      ) ,
    );
  }
}
