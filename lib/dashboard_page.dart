import 'dart:io';
import 'package:blood_donate/login_page.dart';
import 'package:flutter/cupertino.dart';
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

      // appBar: AppBar(
      //   automaticallyImplyLeading: true,
      //   title: Text('Dashboard'),
      // ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: const EdgeInsets.all(20.0),
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
                      backgroundImage: selectedImageFile == null
                          ? const AssetImage("assets/images/BloodCells.jpg")
                          : Image.file(File(selectedImageFile!.path)).image,
                    ),
                  ),
                  Positioned(
                    right: 10,
                    bottom: 10,
                    child: InkWell(
                        onTap: () {
                          Get.bottomSheet(
                            SizedBox(
                              height: 120,
                              width: Get.width,
                              child: Column(
                                children: [
                                  ListTile(
                                    onTap: () {
                                      pickImage(true);
                                    },
                                    leading: const Icon(
                                      Icons.camera,
                                      size: 10.0,
                                    ),
                                    title: const Text("Take Picture"),
                                  ),
                                  ListTile(
                                    onTap: () {
                                      pickImage(false);
                                    },
                                    leading: const Icon(Icons.image),
                                    title: const Text("Choose from gallery"),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        child: const Icon(
                          Icons.add_a_photo,
                          size: 25.0,
                        )),
                  ),
                ],
              ),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                Get.to(() => LoginPage());
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Handle item 2 tap
              },
            ),
          ],
        ),
      ),
      // body: _pages[_currentIndex],
      body: Container(
        decoration: const BoxDecoration(
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
            icon: const SizedBox(
              width: 20,
              height: 30,
              child: Icon(Icons.home),
            ),
            title: const Text('Home'),
          ),
          SalomonBottomBarItem(
            icon: const SizedBox(
              width: 20,
              height: 30,
              child: Icon(Icons.search),
            ),
            title: const Text('Search'),
          ),
          SalomonBottomBarItem(
            icon: const SizedBox(
              width: 20,
              height: 30,
              child: Icon(Icons.water_drop_outlined),
            ),
            title: const Text('Asked Help'),
          ),
          SalomonBottomBarItem(
            icon: const SizedBox(
              width: 20,
              height: 30,
              child: Icon(Icons.message),
            ),
            title: const Text('Messages'),
          ),
          SalomonBottomBarItem(
            icon: const SizedBox(
              width: 20,
              height: 30,
              child: Icon(Icons.person),
            ),
            title: const Text('Profile'),
          ),
        ],
      ),
    );
  }

  Future<void> pickImage(bool isCamera) async {
    final imagePicker = ImagePicker();
    if (isCamera) {
      selectedImageFile =
          await imagePicker.pickImage(source: ImageSource.camera);
    } else {
      selectedImageFile =
          await imagePicker.pickImage(source: ImageSource.gallery);
    }
    Get.back();
    setState(() {});

    if (selectedImageFile != null) {
      print(selectedImageFile!.name);
      print(selectedImageFile!.path);
    }
  }
}

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        automaticallyImplyLeading: false,
      ),
    );
  }
}

class SearchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search"),
        automaticallyImplyLeading: false,
      ),
    );
  }
}

class AddPostWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Asked Help"),
        automaticallyImplyLeading: false,
      ),
    );
  }
}

class MessagesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Message"),
        automaticallyImplyLeading: false,
      ),
    );
  }
}

///Profile Page Design
class ProfileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var bloodDonationCount = 0;
    var nextDonateTime = 30;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Profile"),
          automaticallyImplyLeading: false,
        ),
        body: Column(
          children: [
            Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: Get.width,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 40.0,
                          backgroundImage:
                              AssetImage("assets/images/BloodCells.jpg"),
                        ),
                        SizedBox(height: 8.0),
                        // Add some vertical spacing between the CircleAvatar and Text
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Add some horizontal spacing between the icon and text

                            Text(
                              "S. M. Rakibul Alam",
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            // Spacer(),
                            SizedBox(
                              width: 5.0,
                            ),
                            Icon(
                              Icons.edit_outlined,
                              color: Colors.black,
                            ),

                          ],

                        ),
                      ],
                    ),

                  ),
                )
              ],
            ),

            const SizedBox(
              height: 10.0,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Gender | Age",
                  softWrap: true,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(
              height: 30.0,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Personal Information",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                Container(
                  width: Get.width,
                  height: 180,
                  child: Card(
                    color: Colors.red[100],
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
                      child: Text(
                        "\nBlood Donation Time: $bloodDonationCount\n\nYou Can Donate After $nextDonateTime days",
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),

                )
              ],
            )
          ],

        ));
  }

}


