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
    return SizedBox(
      width: 200,
      child: ElevatedButton(
        onPressed: buttonFunction,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 5,
        ),
        child: Text(
          buttonText!,
        ),
      ),
    );
  }
}
