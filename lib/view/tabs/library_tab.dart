import 'package:flutter/material.dart';
import 'package:instagram/view/dummydb.dart';

class LibraryTab extends StatelessWidget {
  const LibraryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      // physics: NeverScrollableScrollPhysics(),
      itemCount: DummyDb.taggedPostsList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 2, crossAxisSpacing: 2, crossAxisCount: 4),
      itemBuilder: (context, index) => Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(DummyDb.taggedPostsList[index]))),
      ),
    );
  }
}