# Awesome Splash Animations (Pure Flutter)

[![Flutter Version](https://img.shields.io/badge/Flutter-%3E%3D3.0.0-blue.svg)](https://flutter.dev/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)

A curated collection of splash screen animations faithfully recreated using **pure Flutter**.

## Goal ✨

The primary goal of this repository is to serve as a learning resource for Flutter developers. By providing clean, understandable implementations of popular app splash screens (like Netflix, Uber, YouTube, Pinterest, etc.), we aim to:

1.  **Demystify Complex Animations:** Show how intricate splash animations can be built step-by-step using Flutter's built-in animation framework.
2.  **Inspire Developers:** Provide practical examples that developers can learn from, adapt, and use in their own projects.
3.  **Promote Pure Flutter:** Demonstrate the power and flexibility of Flutter for creating beautiful UIs without relying heavily on external packages for core animations.

## Available Animations 🚀

Currently, the repository includes pure Flutter implementations for the following splash screens:

* **Netflix**
* **Uber**
* **YouTube**
* **Pinterest**

*(More coming soon! Contributions are welcome!)*

## Folder Structure 📁

The project follows a clear structure to make navigation easy:

```
awesome-splash-animations/
├── lib/
│   ├── animations/
│   │   ├── netflix/
│   │   │   └── netflix_animation.dart
│   │   ├── uber/
│   │   │   └── uber_animation.dart
│   │   ├── youtube/
│   │   │   └── youtube_animation.dart
│   │   ├── pinterest/
│   │   │   └── pinterest_animation.dart
│   │   └── ... (other animations)
│   ├── main.dart  (Entry point, might showcase animations)
├── pubspec.yaml
└── README.md
```

Each animation resides in its own dedicated folder within `lib/animations/`.

## Getting Started 🛠️

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/yashmakan/awesome-splash-animations.git
    cd awesome-splash-animations
    ```
2.  **Install dependencies:**
    ```bash
    flutter pub get
    ```
3.  **Run the app:**
    ```bash
    flutter run
    ```
    *(Note: You might need to modify `main.dart` to select which splash screen you want to view).*

## Contributing 🤝

Contributions are highly encouraged! If you've built a cool splash screen animation in pure Flutter or replicated one from a popular app, please share it with the community.

**How to Contribute:**

1.  **Fork the repository.**
2.  **Create a new branch:** `git checkout -b feature/your-animation-name` (e.g., `feature/twitter-splash`)
3.  **Create a new folder** for your animation under `lib/animations/`.
4.  **Implement your splash screen** using pure Flutter (minimize external dependencies for the animation itself). Ensure the code is well-commented.
5.  **(Optional but Recommended)** Add a simple way to preview your animation, perhaps by updating `main.dart` or adding a dedicated example file.
6.  **Commit your changes:** `git commit -m "Add [Your Animation Name] splash screen"`
7.  **Push to your branch:** `git push origin feature/your-animation-name`
8.  **Open a Pull Request (PR)** against the `main` branch of this repository.
9.  **Provide details** in your PR description:
    * Which app's splash screen did you replicate?
    * Any specific Flutter animation techniques used?
    * Screenshots or GIFs are highly appreciated!

**Contribution Guidelines:**

* **Pure Flutter:** Focus on using Flutter's core animation widgets and APIs (`AnimationController`, `Tween`, `AnimatedWidget`, `ImplicitlyAnimatedWidget`, etc.).
* **Clarity:** Write clean, readable, and well-commented code.
* **Accuracy:** Try to replicate the original splash screen's timing, easing, and visual elements as closely as possible.
* **Performance:** Keep performance in mind, especially for complex animations.
* **No Packages (for Animation):** Avoid using animation-specific packages *for the core animation logic*. Utility packages are fine.

## License 📄

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file (you'll need to create this file if you don't have one) for details.

---

Let's build an awesome collection together! 🎉