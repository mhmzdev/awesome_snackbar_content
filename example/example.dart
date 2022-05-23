import 'package:flutter/material.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class AweseomSnackBarExample extends StatelessWidget {
  const AweseomSnackBarExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text('Show Awesome SnackBar'),
          onPressed: () {
            var snackBar = SnackBar(
              elevation: 0,
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.transparent,
              content: AwesomeSnackbarContent(
                title: 'On Snap!',
                message:
                    'This is an example error message that will be shown in the body of snackbar!',
                contentType: ContentType.failure,
              ),
            );

            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
        ),
      ),
    );
  }
}
