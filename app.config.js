export default {
  expo: {
    name: "Infra Report",
    slug: "infra-report",
    version: "1.0.0",
    orientation: "portrait",
    icon: "./assets/images/icon.png",
    scheme: "myapp",
    userInterfaceStyle: "automatic",
    newArchEnabled: true,
    ios: {
      supportsTablet: true,
      bundleIdentifier: "almadih.dev.infraReport",
    },
    android: {
      config: {
        googleMaps: {
          apiKey: process.env.GOOGLE_MAPS_API_KEY,
        },
      },
      edgeToEdgeEnabled: true,
      googleServicesFile: "./google-services.json",
      adaptiveIcon: {
        foregroundImage: "./assets/images/icon.png",
        backgroundColor: "#ffffff",
      },
      package: "almadih.dev.infraReport",
    },
    plugins: [
      [
        "expo-splash-screen",
        {
          backgroundColor: "#ffffff",
          image: "./assets/images/icon.png",
          imageWidth: 200,
        },
      ],
      [
        "expo-router",
        {
          origin: "https://rork.app/",
        },
      ],
      [
        "react-native-edge-to-edge",
        {
          android: {
            parentTheme: "Default",
            enforceNavigationBarContrast: false,
          },
        },
      ],
      [
        "./plugins/test.js",
        {
          existingName: "com.google.android.geo.API_KEY",
          newName: "com.google.android.maps.v2.API_KEY",
        },
      ],
    ],
    experiments: {
      typedRoutes: true,
    },
    extra: {
      router: {
        origin: "https://rork.app/",
      },
      eas: {
        projectId: "9400d64a-4252-4299-b90c-6f2212b34e25",
      },
    },
  },
};
