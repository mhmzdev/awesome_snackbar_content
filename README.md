A package that lets you uplift your SnackBar or MaterialBanner experience in the app.

<img src="https://user-images.githubusercontent.com/43790152/169776704-cc6ac8d8-ebd7-4cf1-8239-5d4678b65bc4.png" />

## 🛠 Attributes
- `title`: Top label that will be shown in the body
- `message`: Body message reflecting some error message, success message etc.
- `color`: Color of SnackBar body
- `contentType`: ContentType class reflecting failure, success, help or warning.
- `inMaterialBanner`: Simply configure the working according to `showMaterialBanner`

## Overall Look'n Feel
https://user-images.githubusercontent.com/43790152/200166529-51927c9d-66a6-4f76-b8f7-990680db2eba.mov


## 📱 Usage
To use the package:
- add the dependency to your pubspec.yaml file

```yaml
dependencies:
  flutter:
      sdk: flutter

  awesome_snackbar_content: <latest-package>
```

Then import it in your flutter project:
```
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
```

## 👀 SnackBar Looks
Below are the looks of various types in package used as Snackbar

### 🔴 Failure
<img src="https://user-images.githubusercontent.com/43790152/169772131-919389a1-3e49-43d7-b23a-9c27810b8110.png" height='600px' />

### ✅ Success
<img src="https://user-images.githubusercontent.com/43790152/169772318-03970ca9-3d45-4ce0-a760-0215b145835e.png" height='600px' />

### ❔ Help
<img src="https://user-images.githubusercontent.com/43790152/169772309-4b026300-30e9-492f-8c77-33500d566ca2.png" height='600px' />

### ⚠ Warning
<img src="https://user-images.githubusercontent.com/43790152/169772320-77e1479f-0351-4130-98c3-77b9b51b609b.png" height='600px' />

## 👀 Material Banner Looks
Below are the looks of various types in package used as Snackbar

### 🔴 Failure
<img src="https://user-images.githubusercontent.com/43790152/200166474-afa76a1f-1789-474c-ba64-4d7bce9f76c6.png" height='600px' />

### ✅ Success
<img src="https://user-images.githubusercontent.com/43790152/200166472-2d7393be-4dda-4c5e-8059-2453f0dad303.png" height='600px' />

### ❔ Help
<img src="https://user-images.githubusercontent.com/43790152/200166471-e29c4d80-7f0b-48e5-a38b-ae09ec0cf0a2.png" height='600px' />

### ⚠ Warning
<img src="https://user-images.githubusercontent.com/43790152/200166470-88198e42-2cf6-4628-a18b-85f856960208.png" height='600px' />

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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              child: const Text('Show Awesome SnackBar'),
              onPressed: () {
                final snackBar = SnackBar(
                  /// need to set following properties for best effect of awesome_snackbar_content
                  elevation: 0,
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Colors.transparent,
                  content: AwesomeSnackbarContent(
                    title: 'On Snap!',
                    message:
                        'This is an example error message that will be shown in the body of snackbar!',

                    /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                    contentType: ContentType.failure,
                  ),
                );

                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(snackBar);
              },
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              child: const Text('Show Awesome Material Banner'),
              onPressed: () {
                final materialBanner = MaterialBanner(
                  /// need to set following properties for best effect of awesome_snackbar_content
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  forceActionsBelow: true,
                  content: AwesomeSnackbarContent(
                    title: 'Oh Hey!!',
                    message:
                        'This is an example error message that will be shown in the body of materialBanner!',

                    /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                    contentType: ContentType.success,
                    // to configure for material banner
                    inMaterialBanner: true,
                  ),
                  actions: const [SizedBox.shrink()],
                );

                ScaffoldMessenger.of(context)
                  ..hideCurrentMaterialBanner()
                  ..showMaterialBanner(materialBanner);
              },
            ),
          ],
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
