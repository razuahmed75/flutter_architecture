# Flutter Pro Architect 🚀

**Flutter Pro Architect** is a high-productivity VS Code extension designed for Flutter developers. It automates the tedious process of setting up a Clean Architecture folder structure and installing essential industry-standard packages in one click.



## ✨ Features

-   **📁 One-Click Scaffolding**: Instantly generates a professional, modular folder structure (App, Data, View, Controllers, Repositories, etc.).
-   **📦 Dependency Automation**: Automatically adds essential packages to your `pubspec.yaml` including:
    -   `get` (State Management)
    -   `dio` (Networking)
    -   `objectbox` (Local Database)
    -   `go_router` (Routing)
    -   `get_it` (Service Locator)
-   **🛠️ Smart Boilerplate**: Generates ready-to-use utility files like `ObjectBoxHelper` and `AppEnv` configurations.
-   **🖱️ Context Menu Support**: Right-click on any folder in the Explorer to trigger the generator.

## 📂 Generated Structure

The extension follows a professional Clean Architecture pattern:

```text
lib/
├── app/            # App-wide configuration & environment setup
├── controllers/    # Business logic & State management (GetX)
├── data/           # Remote & Local data sources
│   └── source/     # API clients, Interceptors, and ObjectBox storage
├── di/             # Dependency Injection / Service Locator
├── model/          # Data models and entities
├── repositories/   # Repository pattern implementation
├── res/            # Resources: Constants, Themes, Routes, Enums
├── utils/          # Helper classes, Validators, Loggers
└── view/           # UI Layer: Screens and reusable Widgets

## 🚀 Installation & Usage

### 1. Global Activation
To use the tool from anywhere on your machine, activate it globally via the Dart SDK:

1. dart pub global activate flutter_pro_architect
2. flutter_pro_architect
