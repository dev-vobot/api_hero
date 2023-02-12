
# API Hero

A demo application for handling APIs in flutter app using BLoC pattern

along with
[simple app state management
tutorial](https://flutter.dev/docs/development/data-and-backend/state-mgmt/simple).

For help getting started with Flutter development, view the
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Assets

The `assets` directory houses images, fonts, and any other files you want to
include with your application.

The `assets/images` directory contains [resolution-aware
images](https://flutter.dev/docs/development/ui/assets-and-images#resolution-aware).

## Localization

This project generates localized messages based on arb files found in
the `lib/src/localization` directory.

To support additional languages, please visit the tutorial on
[Internationalizing Flutter
apps](https://flutter.dev/docs/development/accessibility-and-localization/internationalization)



## Environment

- Flutter SDK 3.7.0

- Dart SDK 2.19.0


## Initialization

- Create a new flutter project
- Select **Skeleton** instead of **Application**
- Select appropriate folder to keep the project in
- Enter the name of project and wait for it to load
- Follow the instructions below now
## Dependencies

Install the dependencies by running these commands from a terminal in your project root

```bash
  flutter pub add chopper
  flutter pub add flutter_bloc
  flutter pub add -d chopper_generator
  flutter pub add -d build_runner
  ```
**After the installation of dependencies proceed to run the project**
## Structuring the Demo app

Now follow the steps to achieve what we want

```
Create following files
1. sample_model.dart
2. sample_bloc.dart
3. api_services.dart
4. api_constants.dart
5. api_interceptors.dart
6. json_to_type_converter.dart
```
**The contents of above files are in the repo inside demo_files folder**

**If you haven't just cloned the repo, make sure to edit the *main.dart* accordingly**

**Run the following command to generate he required files**
```
flutter pub run build_runner build --delete-conflicting-outputs
```



## Bonus

 - [Sample APIs can be found here](https://reqres.in/)
 - [Generate Model from here](https://app.quicktype.io/) follow the steps below for generating model
 - Select the language as **Dart** 
 - Put encoder & decoder in Class >> **on**
 - Make all properties required >> **on**
 - Make all properties final >> **on**
 - Paste the **json body** of API on the editor and click **copy code**

