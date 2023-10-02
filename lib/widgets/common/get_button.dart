import 'package:flutter/material.dart';

// class GetButton extends StatelessWidget {
//   const GetButton({
//     Key? key,
//     this.buttonText,
//     this.buttonFunction,
//   }) : super(key: key);
//   final String? buttonText;
//   final Function()? buttonFunction;
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 45,
//       width: 210,
//       child: ElevatedButton(
//         onPressed: buttonFunction,
//         style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.teal,
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(25))),
//         child: Text(
//           buttonText!,
//         ),
//       ),
//     );
//   }
// }

class GetButton extends StatelessWidget {
  const GetButton({
    Key? key,
    this.buttonText,
    this.buttonFunction,
  }) : super(key: key);

  final String? buttonText;
  final Function()? buttonFunction;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: EdgeInsets.all(10),
      child: ElevatedButton(
        onPressed: buttonFunction,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          backgroundColor: Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 5,
        ),
        child: Text(
          buttonText!,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).buttonTheme.colorScheme!.onTertiary,
          ),
        ),
      ),
    );
  }
}
