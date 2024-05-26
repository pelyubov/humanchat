import 'package:flutter/material.dart';

class MediaDrawer extends StatefulWidget {
  final Function()? onClosed; // Callback for when the drawer is closed

  const MediaDrawer({super.key, this.onClosed});

  @override
  // ignore: library_private_types_in_public_api
  _MediaDrawerState createState() => _MediaDrawerState();
}

class _MediaDrawerState extends State<MediaDrawer> {
  // final double _maxHeight = Get.height; // Maximum height of the drawer
  final List<Tab> tabs = [
    const Tab(text: 'Images', icon: Icon(Icons.image_rounded)),
    const Tab(text: 'Videos', icon: Icon(Icons.video_file_rounded)),
    const Tab(text: 'Files', icon: Icon(Icons.upload_file_rounded)),
  ];
  int _selectedIndex = 0; // Track the currently selected tab index

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 1, // Initial position of the drawer
      // minChildSize: 0.2, // Minimum height of the drawer when dragged
      // maxChildSize:
      //     1, // Maximum height of the drawer when dragged (full screen)
      expand: true,
      snap: true,
      builder: (context, controller) {
        return DefaultTabController(
          initialIndex: 1,
          length: 3,
          child: DefaultTabController(
            length: tabs.length, // Set the number of tabs
            child: Column(
              children: [
                // Your Tab Bar
                TabBar(
                  tabs: tabs,
                  onTap: _onItemTapped, // Handle tab selection
                ),
                Container(
                  child: Expanded(
                    child: IndexedStack(
                      // Display content based on selected index
                      index: _selectedIndex,
                      children: const [
                        // MediaGridView(),
                        // MediaGridView(),
                        // MediaGridView(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
