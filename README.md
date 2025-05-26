# Infra Report App

## Overview

Infra Report is a mobile application designed to facilitate the reporting and management of infrastructure issues. The app allows users to submit detailed reports about infrastructure problems, including location data and images, helping organizations to track and address these issues efficiently.

## Technology Stack

- **React Native** with Expo for cross-platform mobile app development
- **TypeScript** for type-safe JavaScript development
- **Expo Router** for navigation and routing within the app
- **Google Maps API** for location services and map integration
- **Toastify React Native** for user notifications and toasts
- **EAS (Expo Application Services)** for build and deployment
- **React Query** for data fetching and caching.
- **Zustand** for state management.

## Getting Started

### Prerequisites

- Node.js (recommended version 16 or later)
- Expo CLI (`npm install -g expo-cli`)
- Android Studio or Xcode for device emulation (optional, for testing on simulators)
- A physical device or emulator for running the app

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/Almadih/infra-report-app
   cd infra-report-app
   ```

2. Install dependencies:

   ```bash
   npm install
   ```

3. Configure environment variables:

   - Copy `.env.example` to `.env` and update with your configuration if needed.

4. Run the app:
   ```bash
   npm run prebuild
   npm run start-android
   ```
   This will start the Expo development server. You can then run the app on a connected device or emulator using the Expo Go app or through the simulator.

### Additional Configuration

- Google Maps API key is configured in `.env` and referenced in `app.config.js` for Android.

## Project Structure

- `app/` - Main application source code and screens
- `components/` - Reusable UI components
- `utils/` - Utility functions and helpers
- `store/` - State management stores
- `plugins/` - Expo plugins and custom configurations
- `assets/` - Images and other static assets
- `app.config.js` - Expo configuration file

## Contributing

Contributions are welcome! Please open issues or submit pull requests for improvements or bug fixes.

## License

This project is licensed under the MIT License.
