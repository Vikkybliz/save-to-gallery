import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController _controller = TextEditingController();

  downloadImage(String path) async {
    await GallerySaver.saveImage(path).then((value) =>
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Image Saved Successfully'))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('File Downloader'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                  hintText: 'Input Url link',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12))),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  downloadImage(_controller.text);
                },
                child: const Text('Download Image'))
          ],
        ),
      ),
    );
  }
}
