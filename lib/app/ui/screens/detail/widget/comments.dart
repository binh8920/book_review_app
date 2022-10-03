import 'package:flutter/material.dart';
import 'package:ez_book/app/ui/models/user_data_list.dart';

class Comments extends StatelessWidget {
  const Comments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: userDataList.length,
      itemBuilder: (context, int index) {
        return Column(
          children: [
            CommentElement(index: index),
          ],
        );
      },
    );
  }
}

class CommentElement extends StatelessWidget {
  const CommentElement({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        const Divider(
          height: 10,
          thickness: 1.5,
        ),
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(
              userDataList[index]["image"].toString(),
            ),
          ),
          title: Row(
            children: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: Text(
                    '${userDataList[index]["first_name"]} ${userDataList[index]["last_name"]} has commented this book',
                    maxLines: 2,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          subtitle: Text(
              '${userDataList[index]["date"]} at ${userDataList[index]["time"]}'),
          //trailing: const Icon(Icons.more_vert),
        ),
        Row(
          children: [
            const SizedBox(
              width: 70,
            ),
            Text(
              '${userDataList[index]["comment"]}',
              maxLines: 3,
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.left,
            ),
          ],
        )
      ],
    );
  }
}
