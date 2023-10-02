import 'package:flutter/material.dart';

// class RateContainer extends StatelessWidget {
//   const RateContainer({
//     Key? key,
//     this.rateTitle,
//     this.infoWidget,
//   }) : super(key: key);

//   final String? rateTitle;
//   final Widget? infoWidget;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.teal,
//         borderRadius: BorderRadius.all(Radius.circular(8)),
//       ),
//       height: 110,
//       width: 100,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           Text(
//             rateTitle!,
//           ),
//           infoWidget!,
//         ],
//       ),
//     );
//   }
// }

class RateContainer extends StatelessWidget {
  const RateContainer({
    Key? key,
    this.rateTitle,
    this.infoWidget,
  }) : super(key: key);

  final String? rateTitle;
  final Widget? infoWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      height: 100, // Set a fixed height
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            rateTitle!,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          infoWidget!,
        ],
      ),
    );
  }
}
