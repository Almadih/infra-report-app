import React from "react";
import { StyleSheet, Text, View, Pressable } from "react-native";
import { useRouter } from "expo-router";
import { CheckCircle, TriangleAlert } from "lucide-react-native";
import colors from "@/constants/colors";
import { useIsOnline } from "@/hooks/useIsOnline";

export default function ConfirmationScreen() {
  const router = useRouter();

  const isOnline = useIsOnline();

  const handleViewReports = () => {
    router.push("/history");
  };

  const handleNewReport = () => {
    router.push("/report");
  };

  return (
    <View style={styles.container}>
      <View style={styles.content}>
        <View style={styles.iconContainer}>
          <CheckCircle size={64} color={colors.status.success} />
        </View>

        <Text style={styles.title}>Thank You!</Text>

        <Text style={styles.message}>
          Your report has been successfully submitted. Local authorities will be
          notified about this issue.
        </Text>

        <Text style={styles.subMessage}>
          You can track the status of your report in the History tab.
        </Text>
      </View>

      {!isOnline && (
        <View style={styles.offlineToast}>
          <TriangleAlert color={colors.status.warning} />
          <Text style={styles.offlineToastText}>
            You are offline. Your report has been saved and will be submitted
            automatically when you're back online.
          </Text>
        </View>
      )}

      <View style={styles.buttonContainer}>
        <Pressable
          style={[styles.button, styles.secondaryButton]}
          onPress={handleViewReports}
        >
          <Text style={styles.secondaryButtonText}>View My Reports</Text>
        </Pressable>

        <Pressable
          style={[styles.button, styles.primaryButton]}
          onPress={handleNewReport}
        >
          <Text style={styles.primaryButtonText}>Submit Another</Text>
        </Pressable>
      </View>
    </View>
  );
}

const styles = StyleSheet.create({
  offlineToast: {
    padding: 16,
    borderRadius: 10,
    alignItems: "center",
  },
  offlineToastText: {
    textAlign: "center",
    fontSize: 15,
    color: colors.status.warning,
  },
  container: {
    flex: 1,
    backgroundColor: colors.background,
    padding: 24,
    justifyContent: "space-between",
  },
  content: {
    flex: 1,
    justifyContent: "center",
    alignItems: "center",
  },
  iconContainer: {
    marginBottom: 24,
  },
  title: {
    fontSize: 24,
    fontWeight: "700",
    color: colors.foreground,
    marginBottom: 16,
    textAlign: "center",
  },
  message: {
    fontSize: 16,
    color: colors.foreground,
    textAlign: "center",
    marginBottom: 16,
    lineHeight: 24,
  },
  subMessage: {
    fontSize: 14,
    color: colors.mutedForeground,
    textAlign: "center",
  },
  buttonContainer: {
    marginTop: 32,
  },
  button: {
    borderRadius: 12,
    paddingVertical: 16,
    alignItems: "center",
    justifyContent: "center",
    marginBottom: 12,
  },
  primaryButton: {
    backgroundColor: colors.primary,
  },
  primaryButtonText: {
    color: colors.background,
    fontSize: 16,
    fontWeight: "600",
  },
  secondaryButton: {
    backgroundColor: colors.card,
    borderWidth: 1,
    borderColor: colors.border,
  },
  secondaryButtonText: {
    color: colors.foreground,
    fontSize: 16,
    fontWeight: "600",
  },
});
