A package that lets you uplift your SnackBar experience in the app.

## 🛠 Attributes
- `title`: Top label that will be shown in the body
- `message`: Body message reflecting some error message, success message etc.
- `color`: Color of SnackBar body
- `contentType`: ContentType class reflecting failure, success, help or warning.

## 📱 Usage
To use the package:
- add the dependency to your pubspec.yaml file

```yaml
dependencies:
  flutter:
      sdk: flutter

  awesome_snackbar_content:
```

Then import it in your flutter project:
```
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
```

## 👀 Looks
Below are the looks of various types in package

### 🔴 Failure
<img src="https://user-images.githubusercontent.com/43790152/169772131-919389a1-3e49-43d7-b23a-9c27810b8110.png" height='600px' />

### ✅ Success
<img src="https://user-images.githubusercontent.com/43790152/169772318-03970ca9-3d45-4ce0-a760-0215b145835e.png" height='600px' />

### ❔ Help
<img src="https://user-images.githubusercontent.com/43790152/169772309-4b026300-30e9-492f-8c77-33500d566ca2.png" height='600px' />

### ⚠ Warning
<img src="https://user-images.githubusercontent.com/43790152/169772320-77e1479f-0351-4130-98c3-77b9b51b609b.png" height='600px' />

### 💻 Example
Below is a basic example usage of the `awesome_snackbar_content`

```dart
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
```

## 🧑 Credits
This packages has been created in reference to [Abu Anwar (GDE Flutter)][abuanwar] YouTube [video][ytvideo]. So, make sure to check his work!

[abuanwar]: https://github.com/abuanwar072
[ytvideo]: https://www.youtube.com/watch?v=UWXC0DHIIfQ&ab_channel=TheFlutterWay