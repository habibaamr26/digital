

A simple Flutter news application that fetches the latest news articles from NewsAPI. 
The app demonstrates API integration, clean UI design, Cubit/Bloc state management, and navigation between screens.
Features

Onboarding Screen:
Explains how to use the app.
First screen user sees when opening the app.

Login Page:
Simple login screen with no backend integration.
Email input requires a specific format (e.g., ***@gmail.com).
Password field is mandatory.
Successful login navigates to the Home Page.

Home Page:
Displays the latest news articles .
Each articles shows:
Article title
Brief description
Thumbnail image
Published date

Pull-to-refresh to reload articles.

Article Detail Page:
Shows full title, full content, and article image.
Button to open the full article in the external browser.

State Management:
Implemented using Cubit/Bloc to handle API calls, loading, and error states.

Error Handling:
Displays friendly error messages on API failure.
Shows "No articles available" if the API returns no data.

Setup Instructions
Clone the repository
git clone https://github.com/habibaamr26/digital.git
Install dependencies
flutter pub get

my apiKey const String apiKey="14cae4ffc650405e9dc96b956f5b3b14";
flutter run
cupertino_icons: ^1.0.2 – Provides icons for a better look on Cupertino widgets.
dio: ^5.9.0 –  HTTP client for making API requests.
flutter_bloc: ^9.1.1 – For Cubit/Bloc state management.
device_preview: ^1.0.0 – run app on multiple device sizes for testing responsiveness.
url_launcher: ^6.1.13 – To open articles in the external browser.
flutter_launcher_icons: ^0.13.0 – Automatically generates app launcher icons for Android and iOS.

