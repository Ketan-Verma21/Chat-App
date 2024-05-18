# ChatApp

Welcome to **ChatApp**! This project is a feature-rich, real-time messaging application built using Flutter for the frontend and Firebase for the backend. ChatApp aims to provide users with a smooth and responsive chatting experience.

## Features

- **Real-time Messaging**: Send and receive messages in real-time.
- **User Authentication**: Secure sign up and log in using Firebase Authentication.
- **Profile Management**: Update and manage user profiles.
- **Group Chats**: Create and participate in group conversations.
- **Push Notifications**: Receive notifications for new messages.
- **Media Sharing**: Share images and videos within chats.
- **Status Updates**: Post and view status updates from friends.

## Screenshots

<div style="display: flex; overflow-x: auto; padding: 10px; gap: 50px;">
  <img src="https://github.com/Ketan-Verma21/Chat-App/assets/106913278/2451ac79-2835-4e73-93e9-1acb4cfc0ed0" alt="Login Screen" height="450" />
  <img src="https://github.com/Ketan-Verma21/Chat-App/assets/106913278/bbe0d802-9adf-424a-8fc5-67473c0113a3" alt="Register Screen" height="450" />
  <img src="https://github.com/Ketan-Verma21/Chat-App/assets/106913278/d6d64805-6862-43f4-a527-d1678f01d92c" alt="Chat Screen" height="450" />
  <img src="https://github.com/Ketan-Verma21/Chat-App/assets/106913278/e0eae6ca-ae3a-4ddf-96f9-736ff65a67c9" alt="Contact Screen (Dark)" height="450" />
  <img src="https://github.com/Ketan-Verma21/Chat-App/assets/106913278/09c6a39a-ae78-4917-b566-81b17d24084c" alt="Contact Screen" height="450" />
  <img src="https://github.com/Ketan-Verma21/Chat-App/assets/106913278/cded51a3-0ca5-4e08-a023-10936e0ea437" alt="Settings" height="450" />
  <img src="https://github.com/Ketan-Verma21/Chat-App/assets/106913278/ff930e69-9095-408b-b3eb-27dd4757edd2" alt="Side Drawer (Dark)" height="450" />
  <img src="https://github.com/Ketan-Verma21/Chat-App/assets/106913278/7f870da3-90c2-4435-bb30-7eb5279a71b6" alt="Side Drawer" height="450" />
</div>

## Getting Started

To get a copy of the project up and running on your local machine, follow these simple steps.

### Prerequisites

- [Flutter](https://flutter.dev/docs/get-started/install) SDK
- [Firebase](https://firebase.google.com/) account
- [Android Studio](https://developer.android.com/studio) or [Visual Studio Code](https://code.visualstudio.com/)

### Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/Ketan-Verma21/Chat-App.git
   cd firebasexchatapp
   ```

2. **Set up Firebase:**
   - Go to the Firebase Console and create a new project.
   - Add an Android and iOS app to your Firebase project.
   - Download the `google-services.json` (for Android) and `GoogleService-Info.plist` (for iOS) and place them in the respective directories of your Flutter project.

3. **Install dependencies:**
   ```bash
   flutter pub get
   ```

4. **Run the app:**
   ```bash
   flutter run
   ```

## Folder Structure

```
chat-app/
|- android
|- build
|- ios
|- lib
|  |- components
|  |- models
|  |- pages
|  |- services
|  |- theme
|  |- main.dart
|- test
|- pubspec.yaml
```

- **components**: Contains reusable UI components.
- **models**: Contains data models used in the app.
- **pages**: Includes all the screen widgets (e.g., login, chat, profile).
- **services**: Contains Firebase service classes for authentication, database, and storage.
- **theme**: Contains theme-related files for styling the app.
- **main.dart**: The entry point of the application.

## Contributing

We welcome contributions to enhance the ChatApp! To contribute:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature/your-feature-name`).
3. Commit your changes (`git commit -am 'Add some feature'`).
4. Push to the branch (`git push origin feature/your-feature-name`).
5. Create a new Pull Request.

## Contact

If you have any questions or feedback, feel free to reach out:

- **Name**: Ketan Verma
- **Email**: try.vrmketan@gmail.com
- **GitHub**: [Ketan-Verma21](https://github.com/Ketan-Verma21)

