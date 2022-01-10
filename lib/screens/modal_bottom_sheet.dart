// ignore_for_file: sized_box_for_whitespace

import 'package:app_examples/widgets/my_gradient_buttom.dart';
import 'package:flutter/material.dart';

class ModalBottomSheet extends StatelessWidget {
  const ModalBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Modal Bottom Sheet'),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyGradientElevatedButtom(
              witdh: 180,
              height: 50,
              border: 10,
              text: 'Modal Bottom Sheet',
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (_) => Container(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ListTile(
                          leading: const Icon(Icons.link),
                          title: const Text('Copy Link'),
                          onTap: () => Navigator.pop(context),
                        ),
                        const Divider(height: 1, color: Colors.white12),
                        ListTile(
                          leading: const Icon(Icons.share),
                          title: const Text('Share'),
                          onTap: () => Navigator.pop(context),
                        ),
                        const Divider(height: 1, color: Colors.white12),
                        ListTile(
                          leading: const Icon(Icons.delete, color: Colors.red),
                          title: const Text('remove from list'),
                          onTap: () {
                            Navigator.pop(context);
                            final snackBar = SnackBar(
                              backgroundColor: Colors.black.withOpacity(0.4),
                              content: const Text('Removed from list',
                                  style: TextStyle(color: Colors.white)),
                              action: SnackBarAction(
                                textColor: Colors.white,
                                label: 'Undo',
                                onPressed: () {},
                              ),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
