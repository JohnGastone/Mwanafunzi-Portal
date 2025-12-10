# Mwanafunzi Portal

A modern, efficient, and user-friendly student registration and management system built with Flutter.

![Banner](assets/banner.png)

## Table of Contents

* [Overview](#overview)
* [Features](#features)
* [Tech Stack](#tech-stack)
* [Architecture](#architecture)
* [App Structure](#app-structure)
* [Installation](#installation)
* [Usage](#usage)
* [Known Issues](#known-issues)
* [Screenshots](#screenshots)
* [License](#license)

---

## Overview

Mwanafunzi Portal is a streamlined student registration app developed using Flutter. It enables educational institutions to manage student data efficiently while providing built-in authentication for secure access. The system supports registering new students, updating student details, removing student profiles, and managing user accounts (Sign In and Sign Up).

This project demonstrates proficiency in Flutter UI development, modern state management patterns, and clean code practices.

---

## Features

### Student Management

* Register new students with complete profile details
* Upload student photos using the device camera or gallery
* Edit existing student information
* Delete a student and all associated records

### Authentication

* Secure Sign In and Sign Up views
* Validations for all form fields
* Local state persistence (can be extended to Firebase authentication)

### UI and Experience

* Clean and modern design using Google Fonts
* SVG-based icons for sharp visuals
* Responsive layout tested across devices

---

## Tech Stack

### Framework

* **Flutter** (Dart SDK 3.7.0)

### State Management

* **Provider**
* **Riverpod**

### Packages

* `google_fonts`
* `flutter_svg`
* `image_picker`
* `flutter_launcher_icons`
* `provider`
* `riverpod`
* `cupertino_icons`

---

## Architecture

The app follows a clean, modular structure organized into:

* **Models**: Student model, helpers
* **Providers**: For managing student state and UI state
* **Widgets**: Reusable UI components
* **Screens**: Sign In, Sign Up, Registration Form, Student Registry, Student Editing Dialog
* **Services** (optional extension): Storage or backend connections

This separation ensures scalability and maintainability, allowing features to be expanded easily.

---

## App Structure

```
mwanafunziportal/
│
├── assets/
│   ├── icons/
│   ├── images/
│   └── screenshots/
│
├── lib/
│   ├── Authentication/
│   ├── Registration/
│   ├── Students/
│   ├── Providers/
│   ├── Widgets/
│   ├── Core/
│   └── main.dart
│
└── pubspec.yaml
```

---

## Installation

### 1. Clone the Repository

```
git clone https://github.com/JohnGastone/Mwanafunzi-Portal.git
```

### 2. Navigate into the Project Folder

```
cd Mwanafunzi-Portal
```

### 3. Install Dependencies

```
flutter pub get
```

### 4. Run the Application

```
flutter run
```

---

## Usage

### Sign Up

Create an account to access the student management dashboard.

### Register Students

Fill in the student’s personal details, academic information, and upload a profile picture.

### Edit or Delete Students

Open any student record from the registry to update details or remove the student.

### Authentication Flow

All users must be authenticated to access student data, ensuring secure use of the system.

---

## Known Issues

* Some emulators may not support full image capture capability.
* Image permissions on Android may require manual approval depending on device settings.
* Riverpod and Provider coexist; future versions may consolidate state management.

---

## Screenshots

### Sign In

![Sign In](assets/screenshots/signin.png)

### Sign Up

![Sign Up](assets/screenshots/signup.png)

### Register Student

![Register Student](assets/screenshots/register_student.png)

### Students Registry

![Students Registry](assets/screenshots/students_registry.png)

### Edit Student Dialog

![Edit Student](assets/screenshots/edit_student.png)

---

## License

This project is licensed under the MIT License.
You are free to modify, distribute, and use it for educational or commercial purposes.

---


