import 'package:flutter/material.dart';

class NiceTextField extends StatelessWidget {
  const NiceTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: TextField(
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search),
            suffixIcon: IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () {
                /* Clear the search field */
              },
            ),
            hintText: 'Search game',
            border: InputBorder.none,
            //contentPadding: EdgeInsets.all(16.0),
          ),
        ),
      ),
    );
  }
}

// class SearchPage extends StatelessWidget {
//   const SearchPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final MediaQueryData mediaQueryData = MediaQuery.of(context);

//     final double deviceHeight = mediaQueryData.size.height;

//     final double deviceWidth = mediaQueryData.size.width;
//     return Container(
//         width: double.infinity,
//         height: deviceHeight / 13,
//         decoration: BoxDecoration(
//             color: Colors.white, borderRadius: BorderRadius.circular(10)),
//         child: Center(
//           child: TextField(
//             decoration: InputDecoration(
//               prefixIcon: const Icon(Icons.search),
//               suffixIcon: IconButton(
//                 icon: const Icon(Icons.clear),
//                 onPressed: () {
//                   /* Clear the search field */
//                 },
//               ),
//               hintText: 'Search...',
//             ),
//           ),
//         ));
//   }
// }

class GameSearchBar extends StatelessWidget {
  const GameSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: const TextField(
        decoration: InputDecoration(
          hintText: 'Search game...',
          prefixIcon: Icon(
            Icons.search,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(16.0),
        ),
      ),
    );
  }
}
