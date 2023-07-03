import 'package:flutter/material.dart';

Widget buildInstructionsList() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 15,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          elevation: 5,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: ListTile(
            leading: CircleAvatar(child: Text((index + 1).toString())),
            title: Text('Step ${index + 1}'),
            subtitle: Text('Detailed description of step ${index + 1}'),
          ),
        );
      },
    );
  }