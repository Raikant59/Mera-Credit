// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:mera_credit/Web_viewScreen.dart';
//
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});
//
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     Timer(const Duration(seconds: 3), () {
//       Navigator.of(context).pushReplacement(
//         MaterialPageRoute(builder: (_) => const WebViewScreen()),
//       );
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 7, 115, 103),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const SizedBox(height: 40),
//             // Logo placeholder
//             Container(
//               width: 80,
//               height: 80,
//               decoration: BoxDecoration(
//                 color: Colors.white.withOpacity(0.1),
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               child: const Center(
//                 child: Text(
//                   "M",
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 40,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             RichText(
//               text: const TextSpan(
//                 style: TextStyle(
//                   fontSize: 28,
//                   fontWeight: FontWeight.bold,
//                   fontFamily: 'Sans-serif',
//                 ),
//                 children: [
//                   TextSpan(
//                     text: "Mera",
//                     style: TextStyle(color: Colors.white),
//                   ),
//                   TextSpan(
//                     text: "Credit",
//                     style: TextStyle(color: Color(0xFFFEBB10)),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }