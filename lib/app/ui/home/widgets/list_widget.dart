import 'package:flutter/material.dart';

Widget buildList({String key, String string}) {
  return ListView.builder(
    key: PageStorageKey(key),
    itemBuilder: (_, i) => ListTile(title: Text("${string} ${i}")),
  );
}