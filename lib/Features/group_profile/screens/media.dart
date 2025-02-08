import 'package:flutter/material.dart';
import 'package:nearme_app/core/constants.dart';
import 'package:video_player_control_panel/video_player_control_panel.dart';

class MediaScreen extends StatefulWidget {
  const MediaScreen({super.key});
  static String mediaScreenKey = '/MediaScreen';

  @override
  _MediaScreenState createState() => _MediaScreenState();
}

class _MediaScreenState extends State<MediaScreen> {
  // قائمة بالصور (يمكن استبدالها ببيانات حقيقية)
  final List<String> imageUrls = [];

  // قائمة بالفيديوهات (يمكن استبدالها ببيانات حقيقية)
  final List<String> videoUrls = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.3,
        backgroundColor: Colors.white,
        title: const Text(
          'Media Gallery',
          style: TextStyle(color: kFontColor),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: kFontColor,
            size: 28,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: _buildMediaGrid(),
    );
  }

  // بناء شبكة الوسائط
  Widget _buildMediaGrid() {
    // إذا لم تكن هناك بيانات، نعرض صورة افتراضية
    if (imageUrls.isEmpty && videoUrls.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/empty_media.png', // صورة افتراضية من assets
              width: 300,
              height: 300,
            ),
            const SizedBox(height: 16),
            const Text(
              'No media available',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          ],
        ),
      );
    }

    // دمج الصور والفيديوهات في قائمة واحدة
    final List<String> mediaUrls = [...imageUrls, ...videoUrls];

    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // عدد الأعمدة
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: mediaUrls.length,
      itemBuilder: (context, index) {
        final mediaUrl = mediaUrls[index];
        final isVideo = videoUrls.contains(mediaUrl);

        return GestureDetector(
          onTap: () {
            if (isVideo) {
              // فتح الفيديو في وضع ملء الشاشة
              // _playVideo(context, mediaUrl);
            } else {
              // فتح الصورة في وضع ملء الشاشة
              _showFullScreenImage(context, mediaUrl);
            }
          },
          child: Stack(
            fit: StackFit.expand,
            children: [
              // صورة مصغرة للوسائط
              Image.asset(
                isVideo
                    ? 'assets/images/empty_media.png' // صورة مصغرة للفيديو
                    : mediaUrl,
                fit: BoxFit.cover,
              ),
              // أيقونة تشغيل للفيديوهات
              if (isVideo)
                const Center(
                  child: Icon(
                    Icons.play_circle_filled,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  // فتح الصورة في وضع ملء الشاشة
  void _showFullScreenImage(BuildContext context, String imageUrl) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context); // إغلاق الصورة عند النقر
            },
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }

  // تشغيل الفيديو في وضع ملء الشاشة
  // void _playVideo(BuildContext context, String videoUrl) {
  //   // يمكنك استخدام VideoPlayerController هنا
  // }
}
