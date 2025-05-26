import { Notification as NotificationType } from "@/types/notification";
import { useRouter } from "expo-router";
import { Bell } from "lucide-react-native";
import React from "react";
import { View, Text, StyleSheet, Image, Pressable } from "react-native";

type NotificationProps = {
  notification: NotificationType;
};

export default function Notification({ notification }: NotificationProps) {
  const isRead = notification.read_at !== null;
  const router = useRouter();

  const handlePress = () => {
    const report_id = notification.data.data.report_id;
    if (report_id) {
      router.push(`/report-details/${report_id}`);
    }
  };

  return (
    <Pressable onPress={handlePress}>
      <View style={[styles.container, isRead ? styles.read : styles.unread]}>
        <Bell style={styles.icon} />
        <View style={styles.textContainer}>
          <Text style={styles.title}>{notification.data.title}</Text>
          <Text style={styles.body}>{notification.data.body}</Text>
          <Text style={styles.date}>
            {new Date(notification.created_at).toLocaleString()}
          </Text>
        </View>
      </View>
    </Pressable>
  );
}

const styles = StyleSheet.create({
  container: {
    flexDirection: "row",
    backgroundColor: "#f0f0f0",
    padding: 12,
    borderRadius: 8,
    marginVertical: 6,
    shadowColor: "#000",
    shadowOffset: { width: 0, height: 1 },
    shadowOpacity: 0.1,
    shadowRadius: 2,
    elevation: 2,
    alignItems: "center",
  },
  read: {
    backgroundColor: "#e0e0e0",
  },
  unread: {
    backgroundColor: "#d1e7dd",
  },
  icon: {
    width: 40,
    height: 40,
    marginRight: 12,
  },
  textContainer: {
    flex: 1,
  },
  title: {
    fontWeight: "bold",
    fontSize: 16,
    marginBottom: 4,
  },
  body: {
    fontSize: 14,
    color: "#333",
  },
  date: {
    marginTop: 6,
    fontSize: 12,
    color: "#666",
    textAlign: "right",
  },
});
