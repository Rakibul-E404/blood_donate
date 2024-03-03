// import 'dart:convert';
// import 'package:blood_donate/user_model.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
//
// class SignupPage extends StatefulWidget {
//   @override
//   _SignupPageState createState() => _SignupPageState();
// }
//
// class _SignupPageState extends State<SignupPage> {
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController mobileController = TextEditingController();
//   String selectedBloodGroup = 'Select your blood group';
//   String selectedDivision = 'Select your division';
//   String selectDistrict = 'Select your districts';
//   String selectUpazila = 'Select your upazila';
//   String selectedDateText = 'No Date Selected';
//   final TextEditingController cityController = TextEditingController();
//   final TextEditingController dobController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController confirmPasswordController =
//   TextEditingController();
//   Map<String, dynamic> data = {};
//   final List<String> bloodGroups = [
//     'A+',
//     'A-',
//     'B+',
//     'B-',
//     'O+',
//     'O-',
//     'AB+',
//     'AB-'
//   ];
//
//   List<String> districts = [];
//   List<String> divisions = [];
//   List<String> postcodes = [];
//   List<String> upazilas = [];
//
//   final firestore = FirebaseFirestore.instance;
//
//   bool passwordsMatch = false;
//   bool willingToDonate = false; // Added variable for the checkbox
//
//   @override
//   void initState() {
//     districtsJson();
//     super.initState();
//   }
//
//   Future<void> districtsJson() async {
//     final String response = await rootBundle
//         .loadString('assets/Location/bd-districts.json');
//     data = await json.decode(response);
//
//     districts.clear();
//     divisions.clear();
//     upazilas.clear();
//
//     for (String division in data.keys) {
//       divisions.add(division);
//     }
//     print('Divisions: $divisions}');
//   }
//
//   void _selectDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(1900),
//       lastDate: DateTime.now(),
//     );
//
//     if (picked != null && picked != DateTime.now()) {
//       setState(() {
//         dobController.text = picked.toLocal().toString().split(' ')[0];
//         selectedDateText = '${dobController.text}';
//       });
//     }
//   }
//
//   void _validatePasswordMatch(String value) {
//     setState(() {
//       if (passwordController.text.isNotEmpty &&
//           confirmPasswordController.text.isNotEmpty) {
//         passwordsMatch = passwordController.text == value;
//       } else {
//         passwordsMatch = false;
//       }
//     });
//   }
//
//   void _signUp() {
//     if (nameController.text.isEmpty ||
//         emailController.text.isEmpty ||
//         mobileController.text.isEmpty ||
//         selectedBloodGroup == 'Select your blood group' ||
//         selectedDivision == 'Select your division' ||
//         selectDistrict == 'Select your districts' ||
//         selectUpazila == 'Select your upazila' ||
//         selectedDateText == 'No Date Selected' ||
//         passwordController.text.isEmpty ||
//         confirmPasswordController.text.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('All fields are required'),
//         ),
//       );
//     } else {
//       createAccount(emailController.text, passwordController.text);
//       Navigator.pushReplacementNamed(context, '/dashboard_page');
//     }
//   }
//
//   String? validatePassword(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Password is required';
//     } else if (value.length < 8) {
//       return 'Password must be at least 8 characters';
//     } else if (value.length > 14) {
//       return 'Password must be at most 14 characters';
//     }
//     return null;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Signup Page'),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 TextFormField(
//                   controller: nameController,
//                   decoration: InputDecoration(labelText: 'Name'),
//                 ),
//                 SizedBox(height: 10.0),
//                 TextFormField(
//                   controller: emailController,
//                   keyboardType: TextInputType.emailAddress,
//                   decoration: InputDecoration(labelText: 'Email'),
//                 ),
//                 SizedBox(height: 10.0),
//                 TextFormField(
//                   controller: mobileController,
//                   keyboardType: TextInputType.phone,
//                   decoration: InputDecoration(labelText: 'Mobile Number'),
//                 ),
//                 SizedBox(height: 10.0),
//                 DropdownButtonFormField<String>(
//                   value: selectedBloodGroup,
//                   onChanged: (String? newValue) {
//                     setState(() {
//                       selectedBloodGroup = newValue!;
//                     });
//                   },
//                   items: [
//                     'Select your blood group', // Initial text
//                     ...bloodGroups,
//                   ].map<DropdownMenuItem<String>>((String value) {
//                     return DropdownMenuItem<String>(
//                       value: value,
//                       child: Text(value),
//                     );
//                   }).toList(),
//                   decoration: InputDecoration(labelText: 'Blood Group'),
//                 ),
//                 SizedBox(height: 10.0),
//
//                 DropdownButtonFormField<String>(
//                   value: selectedDivision,
//                   onChanged: (String? newValue) {
//                     if (newValue == "Select your division") {
//                       districts.clear();
//                       upazilas.clear();
//                       setState(() {
//
//                       });
//                     } else {
//                       districts.clear();
//                       upazilas.clear();
//
//                       if (data[newValue]?.keys != null ||
//                           data[newValue]?.keys.isNotEmpty) {
//                         districts.addAll(data[newValue]?.keys ?? []);
//                       }
//                     }
//                     setState(() {
//                       selectedDivision = newValue!;
//                       selectDistrict = 'Select your districts';
//                       // selectedDivision = 'Select your districts';
//                     });
//                   },
//                   items: [
//                     'Select your division', // Initial text
//                     ...divisions,
//                   ].map<DropdownMenuItem<String>>((String value) {
//                     return DropdownMenuItem<String>(
//                       value: value,
//                       child: Text(value),
//                     );
//                   }).toList(),
//                   decoration: InputDecoration(labelText: 'Division Location'),
//                 ),
//                 SizedBox(height: 10.0),
//
//                 districts.isEmpty
//                     ? Container()
//                     : DropdownButtonFormField<String>(  ///district
//                   value: selectDistrict,
//                   onChanged: (String? newValue) {
//                     upazilas = [];
//                     upazilas.clear();
//                     selectDistrict = newValue!;
//                     upazilas.addAll(data[selectedDivision][selectDistrict].cast<String>());
//                     // setState(() {});
//                   setState(() {
//                     selectDistrict = newValue;
//                     selectUpazila = 'Select your upazila';
//
//                   });
//                   },
//
//                   items: [
//                     'Select your districts', // Initial text
//                     ...districts,
//                   ].map<DropdownMenuItem<String>>((String value) {
//                     return DropdownMenuItem<String>(
//                       value: value,
//                       child: Text(value),
//                     );
//                   }).toList(),
//                   decoration:
//                   InputDecoration(labelText: 'District Location'),
//                 ),
//                 SizedBox(height: 10.0),
//
//
//                 upazilas.isEmpty
//                     ? Container()
//                     : DropdownButtonFormField<String>(  /// upazila
//                   value: selectUpazila,
//                   onChanged: (String? newValue) {
//                     // selectUpazila = newValue!;
//
//                     // setState(() {});
//                     setState(() {
//                       selectUpazila = newValue!;
//                     });
//                   },
//                   items: [
//                     'Select your upazila', // Initial text
//                     ...upazilas,
//                   ].map<DropdownMenuItem<String>>((String value) {
//                     return DropdownMenuItem<String>(
//                       // value: value,
//                       value: value,
//                       child: Text(value),
//                     );
//                   }).toList(),
//                   decoration:
//                   InputDecoration(labelText: 'Upazila Location'),
//                 ),
//
//                 SizedBox(height: 10.0),
//                 Row(
//                   children: [
//                     ElevatedButton(
//                       onPressed: () => _selectDate(context),
//                       child: Text('Date of Birth'),
//                     ),
//                     SizedBox(width: 8.0),
//                     Expanded(
//                       child: TextButton(
//                         onPressed: () => _selectDate(context),
//                         child: Text(
//                           selectedDateText,
//                           style: TextStyle(fontSize: 16.0),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 10.0),
//                 TextFormField(
//                   controller: passwordController,
//                   obscureText: true,
//                   decoration: InputDecoration(
//                     labelText: 'Password',
//                     counterText: '',
//                     hintText: 'At least 8 characters & max 16 character',
//                     hintStyle: TextStyle(color: Colors.grey),
//                   ),
//                   validator: validatePassword,
//                   maxLength: 16,
//                   onChanged: _validatePasswordMatch,
//                 ),
//                 SizedBox(height: 10.0),
//                 TextFormField(
//                   controller: confirmPasswordController,
//                   obscureText: true,
//                   decoration: InputDecoration(
//                     labelText: 'Confirm Password',
//                     counterText: '',
//                     hintText: 'At least 8 characters max 16 characters',
//                     hintStyle: TextStyle(color: Colors.grey),
//                     suffixIcon: passwordsMatch
//                         ? Icon(
//                       Icons.check_circle,
//                       color: Colors.green,
//                     )
//                         : null,
//                   ),
//                   validator: validatePassword,
//                   maxLength: 16,
//                   onChanged: _validatePasswordMatch,
//                 ),
//                 SizedBox(height: 10.0),
//
//                 // Checkbox for willingness to donate blood
//                 Row(
//                   children: [
//                     Checkbox(
//                       value: willingToDonate,
//                       onChanged: (value) {
//                         setState(() {
//                           willingToDonate = value!;
//                         });
//                       },
//                     ),
//                     Text("I'm willing to donate blood"),
//                   ],
//                 ),
//
//                 SizedBox(height: 10.0),
//                 ElevatedButton(
//                   onPressed: _signUp,
//                   child: Text('Sign Up'),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Future<void> createAccount(String email, String password) async {
//     try {
//       await FirebaseAuth.instance
//           .createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       )
//           .then((value) {
//         saveUserData(value.user!.uid);
//       });
//     } on Exception catch (error) {
//       Get.showSnackbar(GetSnackBar(
//           title: "Error",
//           message: "$error",
//           duration: const Duration(seconds: 3)));
//     }
//   }
//
//   Future<void> saveUserData(String uid) async {
//     var root = firestore.collection("UserList").doc(uid);
//     UserModel userModel = UserModel(uid, "asdlkjf");
//     try {
//       await root.set(userModel.toJson());
//     } on Exception catch (error) {
//       Get.showSnackbar(GetSnackBar(
//           title: "Error",
//           message: "$error",
//           duration: const Duration(seconds: 3)));
//     }
//   }
// }


///
///
///
///
///
///


///
///
///
///
///



import 'dart:convert';
import 'package:blood_donate/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  String selectedBloodGroup = 'Select your blood group';
  String selectedDivision = 'Select your division';
  String selectDistrict = 'Select your districts';
  String selectUpazila = 'Select your upazila';
  String selectedDateText = 'No Date Selected';
  final TextEditingController cityController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  Map<String, dynamic> data = {};
  final List<String> bloodGroups = [
    'A+',
    'A-',
    'B+',
    'B-',
    'O+',
    'O-',
    'AB+',
    'AB-'
  ];

  List<String> districts = [];
  List<String> divisions = [];
  List<String> postcodes = [];
  List<String> upazilas = [];

  final firestore = FirebaseFirestore.instance;

  bool passwordsMatch = false;
  bool willingToDonate = false; // Added variable for the checkbox

  @override
  void initState() {
    districtsJson();
    super.initState();
  }

  Future<void> districtsJson() async {
    final String response =
    await rootBundle.loadString('assets/Location/bd-districts.json');
    data = await json.decode(response);

    districts.clear();
    divisions.clear();
    upazilas.clear();

    for (String division in data.keys) {
      divisions.add(division);
    }
  }

  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != DateTime.now()) {
      setState(() {
        dobController.text = picked.toLocal().toString().split(' ')[0];
        selectedDateText = '${dobController.text}';
      });
    }
  }

  void _validatePasswordMatch(String value) {
    setState(() {
      if (passwordController.text.isNotEmpty &&
          confirmPasswordController.text.isNotEmpty) {
        passwordsMatch = passwordController.text == value;
      } else {
        passwordsMatch = false;
      }
    });
  }

  void _signUp() {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        mobileController.text.isEmpty ||
        selectedBloodGroup == 'Select your blood group' ||
        selectedDivision == 'Select your division' ||
        selectDistrict == 'Select your districts' ||
        selectUpazila == 'Select your upazila' ||
        selectedDateText == 'No Date Selected' ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('All fields are required'),
        ),
      );
    } else {
      createAccount(emailController.text, passwordController.text);
      Navigator.pushReplacementNamed(context, '/dashboard_page');
    }
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters';
    } else if (value.length > 14) {
      return 'Password must be at most 14 characters';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signup Page'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: 'Name'),
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(labelText: 'Email'),
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  controller: mobileController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(labelText: 'Mobile Number'),
                ),
                SizedBox(height: 10.0),
                DropdownButtonFormField<String>(
                  value: selectedBloodGroup,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedBloodGroup = newValue!;
                    });
                  },
                  items: [
                    'Select your blood group', // Initial text
                    ...bloodGroups,
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  decoration: InputDecoration(labelText: 'Blood Group'),
                ),
                SizedBox(height: 10.0),
                DropdownButtonFormField<String>(
                  value: selectedDivision,
                  onChanged: (String? newValue) {
                    if (newValue == "Select your division") {
                      districts.clear();
                      upazilas.clear();
                      setState(() {});
                    } else {
                      districts.clear();
                      upazilas.clear();

                      if (data[newValue]?.keys != null ||
                          data[newValue]?.keys.isNotEmpty) {
                        districts.addAll(data[newValue]?.keys ?? []);
                      }
                    }
                    setState(() {
                      selectedDivision = newValue!;
                      selectDistrict = 'Select your districts';
                    });
                  },
                  items: [
                    'Select your division', // Initial text
                    ...divisions,
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  decoration: InputDecoration(labelText: 'Division Location'),
                ),
                SizedBox(height: 10.0),
                districts.isEmpty
                    ? Container()
                    : DropdownButtonFormField<String>(
                  value: selectDistrict,
                  onChanged: (String? newValue) {
                    upazilas = [];
                    upazilas.clear();
                    selectDistrict = newValue!;
                    upazilas.addAll(
                        data[selectedDivision][selectDistrict].cast<String>());
                    setState(() {
                      selectDistrict = newValue;
                      selectUpazila = 'Select your upazila';
                    });
                  },
                  items: [
                    'Select your districts', // Initial text
                    ...districts,
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  decoration:
                  InputDecoration(labelText: 'District Location'),
                ),
                SizedBox(height: 10.0),
                upazilas.isEmpty
                    ? Container()
                    : DropdownButtonFormField<String>(
                  value: selectUpazila,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectUpazila = newValue!;
                    });
                  },
                  items: [
                    'Select your upazila', // Initial text
                    ...upazilas,
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  decoration:
                  InputDecoration(labelText: 'Upazila Location'),
                ),
                SizedBox(height: 10.0),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () => _selectDate(context),
                      child: Text('Date of Birth'),
                    ),
                    SizedBox(width: 8.0),
                    Expanded(
                      child: TextButton(
                        onPressed: () => _selectDate(context),
                        child: Text(
                          selectedDateText,
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    counterText: '',
                    hintText: 'At least 8 characters & max 16 character',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  validator: validatePassword,
                  maxLength: 16,
                  onChanged: _validatePasswordMatch,
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  controller: confirmPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    counterText: '',
                    hintText: 'At least 8 characters max 16 characters',
                    hintStyle: TextStyle(color: Colors.grey),
                    suffixIcon: passwordsMatch
                        ? Icon(
                      Icons.check_circle,
                      color: Colors.green,
                    )
                        : null,
                  ),
                  validator: validatePassword,
                  maxLength: 16,
                  onChanged: _validatePasswordMatch,
                ),
                SizedBox(height: 10.0),
                // Checkbox for willingness to donate blood
                Row(
                  children: [
                    Checkbox(
                      value: willingToDonate,
                      onChanged: (value) {
                        setState(() {
                          willingToDonate = value!;
                        });
                      },
                    ),
                    Text("I'm willing to donate blood"),
                  ],
                ),
                SizedBox(height: 10.0),
                ElevatedButton(
                  onPressed: _signUp,
                  child: Text('Sign Up'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> createAccount(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) {
        saveUserData(value.user!.uid);
      });
    } on Exception catch (error) {
      Get.showSnackbar(GetSnackBar(
          title: "Error",
          message: "$error",
          duration: const Duration(seconds: 3)));
    }
  }

  Future<void> saveUserData(String uid) async {
    var root = firestore.collection("UserList").doc(uid);
    int accountOpeningDate = DateTime.now().millisecondsSinceEpoch;

    // DateTime createdDate = DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch);
    // String accountOpening = "${DateTime.now().day.toStringAsFixed(2)}/${DateTime.now().month.toStringAsFixed(2)}/${DateTime.now().year.toStringAsFixed(4)}";
    UserModel userModel = UserModel(
      uid,
      nameController.text,
      emailController.text,
      mobileController.text,
      selectedBloodGroup,
      selectedDivision,
      selectDistrict,
      selectUpazila,
      selectedDateText,
      "",
      willingToDonate,
      accountOpeningDate,
    );
    try {
      await root.set(userModel.toJson());
    } on Exception catch (error) {
      Get.showSnackbar(GetSnackBar(
          title: "Error",
          message: "$error",
          duration: const Duration(seconds: 3)));
    }
  }
}
