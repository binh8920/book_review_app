import 'package:flutter/material.dart';

class CommentInput extends StatelessWidget {
  //CommentInput({required this.commentController});

  //TextEditingController commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          height: 10,
          thickness: 1.5,
        ),
        ListTile(
          title: TextFormField(
            //controller: commentController,
            decoration:
                InputDecoration(labelText: 'Write your comment here ...'),
          ),
          trailing: OutlinedButton(
            onPressed: () => print('Add comment'),
            child: const Text('Post'),
          ),
        ),
      ],
    );
  }
}
