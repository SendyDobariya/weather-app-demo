import 'dart:collection';

import 'package:flutter/material.dart';

// class ApiListingScreen extends StatelessWidget {
//   const ApiListingScreen({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // CarHireCompany(storageType: CarType.suv);
//     return Scaffold(
//       appBar: AppBar(),
//       body: Container(
//         child: SafeArea(
//             child: Center(
//           child: Text("Listing will here"),
//         )),
//       ),
//     );
//   }
// }

class ApiListingScreen extends StatefulWidget {
  ApiListingScreen({Key? key}) : super(key: key);

  @override
  _ApiListingScreenState createState() => _ApiListingScreenState();
}

class _ApiListingScreenState extends State<ApiListingScreen> {
  @override
  Widget build(BuildContext context) {
    // var obj = Circle();
    // obj.cal_area();
    // CarHireCompany(storageType: CarType.suv);
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: SafeArea(
            child: Row(
          children: [
            Expanded(
              child: Text(
                "Listing will here Listing will hereListing will hereListing will hereListing will hereListing will hereListing will hereListing will hereListing will hereListing will hereListing will hereListing will hereListing will hereListing will hereListing will hereListing will hereListing will hereListing will here",
                softWrap: false,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        )),
      ),
    );
  }
}

// class Shape {
//   void cal_area() {
//     print("calling calc area defined in the Shape class");
//   }
// }

// class Circle extends Shape {}

// enum CarType { sedan, suv, truck }

// class CarHireCompany {
//   CarType storageType;

//   CarHireCompany({@required this.storageType});
// }

