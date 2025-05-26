import React, { useEffect } from "react";
import { StyleSheet, Text, View, Pressable, ScrollView } from "react-native";
import { Image } from "expo-image";
import {
  User,
  Settings,
  Bell,
  HelpCircle,
  LogOut,
  ChevronRight,
} from "lucide-react-native";
import colors from "@/constants/colors";
import { useAuthStore } from "@/store/authStore";
import { router, useRouter } from "expo-router";
import { useNotificationStore } from "@/store/notificationStore";
import { useNotificationsQuery } from "@/queries/notifications";
import { useIsOnline } from "@/hooks/useIsOnline";
import { Toast } from "toastify-react-native";

export default function ProfileScreen() {
  const { user } = useAuthStore();
  const { notifications, setNotifications } = useNotificationStore();
  const isOnline = useIsOnline();
  const { data } = useNotificationsQuery(isOnline);
  const router = useRouter();

  useEffect(() => {
    if (data?.length) {
      setNotifications(data);
    }
  }, [data]);

  const { logout } = useAuthStore();
  const handelLogout = () => {
    logout();
    router.replace("/onboarding");
  };

  const notImplemented = () => {
    Toast.info("Not implemented yet");
  };

  return (
    <ScrollView
      style={styles.container}
      contentContainerStyle={styles.contentContainer}
    >
      <View style={styles.header}>
        <View style={styles.avatarContainer}>
          <User size={40} color={colors.mutedForeground} />
        </View>
        <Text style={styles.name}>{user?.name}</Text>
      </View>

      <View style={styles.section}>
        <Text style={styles.sectionTitle}>Account</Text>

        <View style={styles.menuContainer}>
          <Pressable style={styles.menuItem} onPress={notImplemented}>
            <View style={styles.menuItemLeft}>
              <View
                style={[
                  styles.iconContainer,
                  { backgroundColor: colors.primary + "10" },
                ]}
              >
                <User size={20} color={colors.primary} />
              </View>
              <Text style={styles.menuItemText}>Personal Information</Text>
            </View>
            <ChevronRight size={20} color={colors.mutedForeground} />
          </Pressable>

          <Pressable
            style={styles.menuItem}
            onPress={() => router.push("/notifications")}
          >
            <View style={styles.menuItemLeft}>
              <View
                style={[
                  styles.iconContainer,
                  { backgroundColor: colors.status.warning + "10" },
                ]}
              >
                <Bell size={20} color={colors.status.warning} />
              </View>
              <Text style={styles.menuItemText}>Notifications</Text>
            </View>
            <View style={{ flexDirection: "row", alignItems: "center" }}>
              <View style={styles.badge}>
                <Text style={styles.badgeText}>
                  {
                    notifications.filter(
                      (notification) => notification.read_at === null
                    ).length
                  }
                </Text>
              </View>
              <ChevronRight size={20} color={colors.mutedForeground} />
            </View>
          </Pressable>

          <Pressable style={styles.menuItem} onPress={notImplemented}>
            <View style={styles.menuItemLeft}>
              <View
                style={[
                  styles.iconContainer,
                  { backgroundColor: colors.gray[100] },
                ]}
              >
                <Settings size={20} color={colors.gray[500]} />
              </View>
              <Text style={styles.menuItemText}>Settings</Text>
            </View>
            <ChevronRight size={20} color={colors.mutedForeground} />
          </Pressable>
        </View>
      </View>

      <View style={styles.section}>
        <Text style={styles.sectionTitle}>Support</Text>

        <View style={styles.menuContainer}>
          <Pressable style={styles.menuItem} onPress={notImplemented}>
            <View style={styles.menuItemLeft}>
              <View
                style={[
                  styles.iconContainer,
                  { backgroundColor: colors.status.success + "10" },
                ]}
              >
                <HelpCircle size={20} color={colors.status.success} />
              </View>
              <Text style={styles.menuItemText}>Help & Support</Text>
            </View>
            <ChevronRight size={20} color={colors.mutedForeground} />
          </Pressable>

          <Pressable style={styles.menuItem} onPress={handelLogout}>
            <View style={styles.menuItemLeft}>
              <View
                style={[
                  styles.iconContainer,
                  { backgroundColor: colors.status.error + "10" },
                ]}
              >
                <LogOut size={20} color={colors.status.error} />
              </View>
              <Text style={styles.menuItemText}>Sign Out</Text>
            </View>
          </Pressable>
        </View>
      </View>

      <Text style={styles.versionText}>Version 1.0.0</Text>
    </ScrollView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: colors.background,
  },
  contentContainer: {
    padding: 16,
  },
  badge: {
    marginRight: 12,
    width: 24,
    height: 24,
    borderRadius: 20,
    justifyContent: "center",
    alignItems: "center",
    backgroundColor: colors.primary,
  },
  badgeText: {
    fontSize: 12,
    fontWeight: "600",
    color: colors.primaryForeground,
  },
  header: {
    alignItems: "center",
    marginBottom: 24,
  },
  avatarContainer: {
    width: 80,
    height: 80,
    borderRadius: 40,
    backgroundColor: colors.gray[100],
    justifyContent: "center",
    alignItems: "center",
    marginBottom: 16,
  },
  name: {
    fontSize: 24,
    fontWeight: "700",
    color: colors.foreground,
    marginBottom: 8,
  },
  email: {
    fontSize: 16,
    color: colors.mutedForeground,
  },
  loginButton: {
    backgroundColor: colors.primary,
    paddingHorizontal: 24,
    paddingVertical: 10,
    borderRadius: 20,
    marginTop: 12,
  },
  loginButtonText: {
    color: colors.primaryForeground,
    fontWeight: "600",
    fontSize: 14,
  },
  section: {
    marginBottom: 24,
  },
  sectionTitle: {
    fontSize: 18,
    fontWeight: "600",
    color: colors.foreground,
    marginBottom: 16,
  },
  menuContainer: {
    backgroundColor: colors.card,
    borderRadius: 12,
    overflow: "hidden",
    borderWidth: 1,
    borderColor: colors.border,
  },
  menuItem: {
    flexDirection: "row",
    alignItems: "center",
    justifyContent: "space-between",
    padding: 16,
    backgroundColor: colors.card,
    borderBottomWidth: 1,
    borderBottomColor: colors.border,
  },
  menuItemLeft: {
    flexDirection: "row",
    alignItems: "center",
  },
  iconContainer: {
    width: 36,
    height: 36,
    borderRadius: 8,
    justifyContent: "center",
    alignItems: "center",
    marginRight: 12,
  },
  menuItemText: {
    fontSize: 16,
    color: colors.foreground,
  },
  versionText: {
    textAlign: "center",
    color: colors.mutedForeground,
    fontSize: 14,
    marginTop: 16,
  },
});
