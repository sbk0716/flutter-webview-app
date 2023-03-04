import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webview_app/provider.dart';
import 'package:webview_app/view/input_page.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Create a controller for an editable text field.
    final _controller = TextEditingController();
    // Set the initial value to the text property of the TextEditingController instance.
    _controller.text = 'https://finatext.com/';

    final _provider = ref.watch(provider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
        actions: [
          IconButton(
            onPressed: () {
              // Clear the text property of the TextEditingController instance.
              _controller.text = "";
            },
            icon: const Icon(Icons.autorenew),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: 'https://flutter.dev/',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                // Set a value to the text property of the TextEditingController instance.
                _provider.state = value;
              },
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const InputPage()));
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
