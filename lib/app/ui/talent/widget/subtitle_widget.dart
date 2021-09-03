import 'package:flutter/material.dart';

Widget subTitleWidget(String subtitle, BuildContext context){
  return Container(
    padding: const EdgeInsets.only(left: 20),
    child: Align(
      alignment: AlignmentDirectional.centerStart,
      child: Text(
        subtitle,
        style: Theme.of(context).textTheme.caption,
        textAlign: TextAlign.start,
      ),
    ),
  );
}