import "expo-dev-client";

import FontAwesome from "@expo/vector-icons/FontAwesome";
import { useFonts } from "expo-font";
import { Stack, useRouter } from "expo-router";
import * as SplashScreen from "expo-splash-screen";
import React, { useEffect } from "react";

import { persistOptions, queryClient } from "@/queries/queryClient";
import { useAuthStore } from "@/store/authStore";
import { useReportStore } from "@/store/reportStore";
import { storeFCMToken } from "@/utils/helpers";
import { PersistQueryClientProvider } from "@tanstack/react-query-persist-client";
import * as Notifications from "expo-notifications";
import ToastManager from "toastify-react-native";
import { ErrorBoundary } from "./error-boundary";
import NetworkStatusBanner from "./NetworkStatusBanner";
import PendingReportsSync from "./PendingReportsSync";

export const unstable_settings = {
  initialRouteName: "(tabs)",
};

Notifications.setNotificationHandler({
  handleNotification: async () => ({
    shouldPlaySound: true,
    shouldSetBadge: true,
    shouldShowBanner: true,
    shouldShowList: true,
  }),
});

// Prevent the splash screen from auto-hiding before asset loading is complete.
SplashScreen.preventAutoHideAsync();

export default function RootLayout() {
  const [loaded, error] = useFonts({
    ...FontAwesome.font,
  });

  useEffect(() => {
    if (error) {
      console.error(error);
      throw error;
    }
  }, [error]);

  useEffect(() => {
    if (loaded) {
      SplashScreen.hideAsync();
    }
  }, [loaded]);

  if (!loaded) {
    return null;
  }

  return (
    <ErrorBoundary>
      <RootLayoutNav />
    </ErrorBoundary>
  );
}

function RootLayoutNav() {
  const { isCompleteBoarding } = useReportStore();
  const { isLoggedIn, FCMToken, setFCMToken } = useAuthStore();
  const router = useRouter();
  console.log({ NODE_ENV: process.env.NODE_ENV });

  useEffect(() => {
    const getFCMToken = async () => {
      const token = await Notifications.getDevicePushTokenAsync();
      await storeFCMToken(token.data);
      setFCMToken(token.data);
    };
    if (!FCMToken) {
      getFCMToken();
    }
  }, [FCMToken]);

  useEffect(() => {
    const responseListener =
      Notifications.addNotificationResponseReceivedListener((response) => {
        const reportId = response.notification.request.content.data.report_id;
        if (reportId) {
          router.push(`/report-details/${reportId}`);
        }
      });

    return () => {
      responseListener.remove();
    };
  }, []);

  return (
    <>
      <NetworkStatusBanner />
      <PendingReportsSync />
      <PersistQueryClientProvider
        client={queryClient}
        persistOptions={persistOptions}
      >
        <Stack
          screenOptions={{
            headerBackTitle: "Back",
            headerStyle: {
              backgroundColor: "#FFFFFF",
            },
            headerShadowVisible: false,
          }}
        >
          <Stack.Protected guard={!isCompleteBoarding || !isLoggedIn}>
            <Stack.Screen
              name="onboarding/index"
              options={{ headerShown: false }}
            />
          </Stack.Protected>

          <Stack.Protected guard={isCompleteBoarding || isLoggedIn}>
            <Stack.Screen
              name="(tabs)"
              options={{ headerShown: false, statusBarStyle: "dark" }}
            />
            <Stack.Screen
              name="confirmation"
              options={{
                presentation: "modal",
                title: "Report Submitted",
                headerTitleStyle: {
                  fontWeight: "600",
                },
              }}
            />
            <Stack.Screen
              name="report-details/[id]"
              options={{
                statusBarStyle: "dark",
                title: "Report Details",
                headerTitleStyle: {
                  fontWeight: "600",
                },
              }}
            />
            <Stack.Screen
              name="notifications"
              options={{
                statusBarStyle: "dark",
                title: "Notifications",
                headerTitleStyle: {
                  fontWeight: "600",
                },
              }}
            />
          </Stack.Protected>
        </Stack>
        <ToastManager showProgressBar={false} showCloseIcon={false} />
      </PersistQueryClientProvider>
    </>
  );
}
