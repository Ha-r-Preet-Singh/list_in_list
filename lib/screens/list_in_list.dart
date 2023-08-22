import 'package:flutter/material.dart';
import 'package:list_in_list_46/constants/constants.dart';

class ListInList extends StatefulWidget {
  const ListInList({super.key});

  @override
  State<ListInList> createState() => _ListInListState();
}

class _ListInListState extends State<ListInList> {
  @override
  Widget build(BuildContext context) {
    var data = Constants.results;
    return Scaffold(
      body: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(data[index]["name"]),
                  Text(data[index]["ph"]),
                ],
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount:
                    (data[index]["subMarks"]  as List<Map<String, dynamic>> )
                        .length,
                itemBuilder: (context, childIndex) {
                  var childData = data[index]["subMarks"][childIndex]
                      as Map<String, dynamic>;

                  return ListTile(
                    title: Text(childData["sub"] ),
                    trailing: Text(childData["marks"]),
                  );
                },
              ),
            ],
          );
          //helloo
        },
      ),
    );
  }
}
