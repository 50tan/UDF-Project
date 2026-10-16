# UDF Project – Simple Calculator App

UI Design Flutter lab project, built with **Flutter** and **Dart**.

## Team

| Name | Roll No. |
|---|---|
| C. Rohan | 247R1A6616 |
| G. Tanishq | 247R1A6623 |
| GVSS Jaswanth | 247R1A6624 |
| Shaik Junaid Kareem | 247R1A6658 |

## About

A simple calculator that demonstrates Dart basics, Flutter buttons and `setState()` based UI updates.

## Features

- Number input (0–9) and decimal point
- Addition, subtraction, multiplication and division
- `AC` clears the calculation, `⌫` deletes the last character, `%` divides the displayed value by 100
- Status line under the display (`Ready` / `Operation: …`)
- Division by zero shows `Error: Div by 0`

## Run the app

```bash
flutter pub get
flutter run
```

Build an Android APK:

```bash
flutter build apk --release
```

The APK is written to `build/app/outputs/flutter-apk/app-release.apk`.

## Run the tests

```bash
flutter test
```

## Project structure

```
lib/main.dart                  # Calculator UI and logic
test/widget_test.dart          # Widget tests
docs/UDF_Project.pptx          # Project presentation
android/ ios/ web/ windows/ linux/ macos/   # Flutter platform folders
pubspec.yaml                   # Dependencies
```

## Presentation

The project presentation is in [`docs/UDF_Project.pptx`](docs/UDF_Project.pptx).
