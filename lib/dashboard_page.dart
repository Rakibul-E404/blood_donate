// import 'package:flutter/material.dart';
// import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
//
// class DashboardPage extends StatefulWidget {
//   @override
//   _DashboardPageState createState() => _DashboardPageState();
// }
//
// class _DashboardPageState extends State<DashboardPage> {
//   int _currentIndex = 0;
//
//   final List<Widget> _pages = [
//     HomeWidget(),
//     SearchWidget(),
//     AddPostWidget(),
//     MessagesWidget(),
//     ProfileWidget(),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Dashboard'),
//       ),
//       body: _pages[_currentIndex],
//       bottomNavigationBar: AnimatedBottomNavigationBar(
//         icons: [
//           Icons.home,
//           Icons.search,
//           Icons.add_circle_outline,
//           Icons.message,
//           Icons.person,
//         ],
//         activeIndex: _currentIndex,
//         onTap: (index) => setState(() => _currentIndex = index),
//       ),
//     );
//   }
// }
//
// class HomeWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text('Home Page'),
//     );
//   }
// }
//
// class SearchWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text('Search Page'),
//     );
//   }
// }
//
// class AddPostWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text('Add Post Page'),
//     );
//   }
// }
//
// class MessagesWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text('Messages Page'),
//     );
//   }
// }
//
// class ProfileWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text('Profile Page'),
//     );
//   }
// }

///
///

///
///
///
///

// import 'package:flutter/material.dart';
// import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
//
// class DashboardPage extends StatefulWidget {
//   @override
//   _DashboardPageState createState() => _DashboardPageState();
// }
//
// class _DashboardPageState extends State<DashboardPage> {
//   int _currentIndex = 0;
//
//   final List<Widget> _pages = [
//     HomeWidget(),
//     SearchWidget(),
//     AddPostWidget(),
//     MessagesWidget(),
//     ProfileWidget(),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: true,
//         title: Text('Dashboard'),
//       ),
//       body: _pages[_currentIndex],
//       bottomNavigationBar: SalomonBottomBar(
//         currentIndex: _currentIndex,
//         onTap: (index) => setState(() => _currentIndex = index),
//         items: [
//           SalomonBottomBarItem(
//             icon: SizedBox(
//               width: 20,
//               height: 30,
//               child: Icon(Icons.home),
//             ),
//             title: Text('Home'),
//           ),
//           SalomonBottomBarItem(
//             icon: SizedBox(
//               width: 20,
//               height: 30,
//               child: Icon(Icons.search),
//             ),
//             title: Text('Search'),
//           ),
//           SalomonBottomBarItem(
//             icon: SizedBox(
//               width: 20,
//               height: 30,
//               child: Icon(Icons.add_circle_outline),
//             ),
//             title: Text('Add Post'),
//           ),
//           SalomonBottomBarItem(
//             icon: SizedBox(
//               width: 20,
//               height: 30,
//               child: Icon(Icons.message),
//             ),
//             title: Text('Messages'),
//           ),
//           SalomonBottomBarItem(
//             icon: SizedBox(
//               width: 20,
//               height: 30,
//               child: Icon(Icons.person),
//             ),
//             title: Text('Profile'),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class HomeWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text('Home Page'),
//     );
//   }
// }
//
// class SearchWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text('Search Page'),
//     );
//   }
// }
//
// class AddPostWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text('Add Post Page'),
//     );
//   }
// }
//
// class MessagesWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text('Messages Page'),
//     );
//   }
// }
//
// class ProfileWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text('Profile Page'),
//     );
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





import 'dart:io';
import 'package:blood_donate/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeWidget(),
    SearchWidget(),
    AddPostWidget(),
    MessagesWidget(),
    ProfileWidget(),
  ];

  XFile? selectedImageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.red[100],

      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text('Dashboard'),
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.all(20.0),
              //Image set

              decoration: BoxDecoration(
                color: Colors.cyan[200],
              ),
              child: Stack(
                children: [

                  Positioned(
                    right: 10,
                    bottom: 10,
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: selectedImageFile == null? const AssetImage("assets/images/BloodCells.jpg") : Image.file(File(selectedImageFile!.path)).image,
                    ),
                  ),
                  Positioned(
                    right: 10,
                    bottom: 10,
                    child: InkWell(
                    onTap: (){
                      Get.bottomSheet(
                        SizedBox(
                          height: 120,
                          width: Get.width,
                          child: Column(
                            children: [
                              ListTile(
                                onTap: (){
                                  pickImage(true);
                                },
                                leading: Icon(Icons.camera),
                                title: Text("Take Picture"),
                              ),
                              ListTile(
                                onTap: (){
                                  pickImage(false);
                                },
                                leading: Icon(Icons.image),
                                title: Text("Choose from gallery"),
                              ),

                            ],
                          ),
                        ),
                      );
                    },
                        child: Icon(Icons.add_a_photo,size: 25.0,)),
                  ),
                ],
              ),

            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                Get.to(() => LoginPage());
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Handle item 2 tap
              },
            ),
          ],
        ),
      ),
      // body: _pages[_currentIndex],
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                "https://png.pngtree.com/png-vector/20230414/ourmid/pngtree-blood-drop-blood-red-cartoon-illustration-png-image_6694336.png"),
            // image: AssetImage("assets/images/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: _pages[_currentIndex],
      ),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: [
          SalomonBottomBarItem(
            icon: SizedBox(
              width: 20,
              height: 30,
              child: Icon(Icons.home),
            ),
            title: Text('Home'),
          ),
          SalomonBottomBarItem(
            icon: SizedBox(
              width: 20,
              height: 30,
              child: Icon(Icons.search),
            ),
            title: Text('Search'),
          ),
          SalomonBottomBarItem(
            icon: SizedBox(
              width: 20,
              height: 30,
              child: Icon(Icons.add_circle_outline),
            ),
            title: Text('Add Post'),
          ),
          SalomonBottomBarItem(
            icon: SizedBox(
              width: 20,
              height: 30,
              child: Icon(Icons.message),
            ),
            title: Text('Messages'),
          ),
          SalomonBottomBarItem(
            icon: SizedBox(
              width: 20,
              height: 30,
              child: Icon(Icons.person),
            ),
            title: Text('Profile'),
          ),
        ],
      ),
    );
  }


  Future<void> pickImage(bool isCamera) async{
    final imagePicker = ImagePicker();
    if(isCamera){
      selectedImageFile = await imagePicker.pickImage(source: ImageSource.camera);
    }
    else{
      selectedImageFile = await imagePicker.pickImage(source: ImageSource.gallery);
    }
    Get.back();
    setState(() {

    });

    if(selectedImageFile != null){
      print(selectedImageFile!.name);
      print(selectedImageFile!.path);
    }
  }
}

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Home Page'),
    );
  }
}

class SearchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Search Page'),
    );
  }
}

class AddPostWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Add Post Page'),
    );
  }
}

class MessagesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Messages Page'),
    );
  }
}

class ProfileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Profile Page'),
    );
  }
}





