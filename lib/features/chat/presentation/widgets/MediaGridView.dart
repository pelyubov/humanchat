// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:human_chat25/features/channel/presentation/bloc/media_states.dart';

// // TODO: media grid view
// class MediaGridView extends StatelessWidget {
//   MediaGridView({super.key});
//   // final mediaController = Get.put(MediaController());

//   @override
//   Widget build(BuildContext context) {
//     mediaController.addMany(
//       List.generate(
//         23,
//         (index) => Media(
//           select: false,
//           path: '',
//           name: index.toString(),
//         ),
//       ),
//     );
//     return GridView.count(
//       crossAxisCount: 3,
//       crossAxisSpacing: 1,
//       mainAxisSpacing: 1,
//       children: mediaController.mediaList
//           .map((element) => MediaItem(
//                 media: element,
//               ))
//           .toList(),
//     );
//   }
// }

// class MediaItem extends StatefulWidget {
//   const MediaItem({super.key, required this.media});
//   final Media media;

//   @override
//   State<MediaItem> createState() => _MediaItemState();
// }

// class _MediaItemState extends State<MediaItem> {
//   void _onTap() {
//     widget.media.select = !widget.media.select;
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: _onTap,
//       child: Container(
//           child: Stack(
//         children: [
//           Container(
//             color: Colors.red,
//             margin: widget.media.select == true ? const EdgeInsets.all(6) : EdgeInsets.zero,
//             alignment: Alignment.center,
//             child: Text(widget.media.name),
//           ),
//           if (widget.media.select)
//             Container(
//               child: const Center(
//                 child: Text('index'),
//               ),
//             ),
//         ],
//       )),
//     );
//   }
// }