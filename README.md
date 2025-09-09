# Quizz

A simple Flutter project designed for educational purposes, functioning as a quiz app.

[![Flutter Version](https://img.shields.io/badge/flutter-v3.35.2-blue?logo=flutter&logoColor=white)](https://github.com/flutter/flutter/blob/main/CHANGELOG.md#3352)

## Getting Started

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Development Setup

This guide will help you set up the Quizz project for local development.

### Prerequisites

- [Git](https://git-scm.com/) (latest stable version)
- [Flutter SDK](https://docs.flutter.dev/get-started/install)
- [Flutter Version Management (FVM)](https://fvm.app/)
- An IDE ([VS Code](https://code.visualstudio.com/download),
[Android Studio](https://developer.android.com/studio), etc.)

### Setup Steps

#### 1. Clone the repository

```bash
git clone https://github.com/waffiqaziz/quizz.git
cd quizz
```

#### 2. Flutter Version Management (FVM)

This project uses FVM (Flutter Version Management) to ensure consistency across
development environments.

Install and use the required Flutter version `3.35.2` via FVM:

```bash
fvm install 3.35.2
fvm use 3.35.2
```

#### 3. Install dependencies

```bash
flutter pub get
```

#### 4. Run Flutter project

```bash
flutter run
```

## What You can get in here?

This project demonstrates fundamental Flutter skills by implementing a variety of core widgets and features. The app showcases the following Flutter components and concepts:

#### Widgets and UI Elements:

- Text Widget: Displaying text with customizable styles.
- StatelessWidget & StatefulWidget: Managing both static and dynamic components of the UI.
- Scaffold: The main structure of the app's screen, providing an app bar, body, floating action button, and more.
- Container: A versatile widget for creating custom layouts with padding, margin, and decoration.
- Card Widget: Displaying information in a material design card format.
- InkWell: Adding touch feedback to widgets like buttons or containers.
- ClipRRect: Creating rounded corners or clipping child widgets.
- ListTile: Standardizing the layout of items like rows with leading icons, titles, and trailing widgets.
- Padding & SizedBox: Controlling spacing and layout between widgets.
- AspectRatio: Maintaining a specific width-to-height ratio in widgets.
- Stack Widget: Overlapping multiple widgets on top of each other.
- Slivers: Implementing custom scroll behaviors and flexible layouts using sliver-based widgets like SliverAppBar.
- Collapse AppBar: Creating an AppBar that collapses when the user scrolls down.

#### User Interaction:

- AlertDialog: Displaying pop-up alerts for confirmation or information.
- Button Widgets: Utilizing various buttons, this project use FilledButton.
- RadioListTile: Creating a list of selectable radio buttons.
- KeyboardListener: Detecting and responding to keyboard inputs.

#### Layout & Design:

- Row and Column: Arranging widgets horizontally and vertically.
- Flexible Widget: Adjusting layout proportions flexibly based on screen space.
- Responsive Layout: Ensuring the UI adjusts appropriately for different screen sizes and orientations.
- Basic Styling: Applying consistent fonts, colors, and themes across the app.
- Image & Font Assets: Including custom fonts and images from the local assets folder.

#### Navigation & State Management:

- Basic Navigation: Handling navigation between screens and passing data through routes.
- PopScope: Controlling the behavior when the user attempts to leave a screen.

#### Data Handling:

- JSON to Object: Parsing JSON data and converting it into Dart objects to populate the app's content.

#### Additional Features:

- Material 3: Implementing the latest Material Design guidelines for a modern app look and feel.

## Contributing

Feel free to contribute to this project by adding new features, improving the code, or enhancing the overall design. Whether it's fixing a bug, refining the UI, or suggesting improvements, all contributions are welcome!
