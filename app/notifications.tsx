import {
  FlatList,
  RefreshControl,
  StyleSheet,
  Text,
  View,
  Button,
  ActivityIndicator,
} from "react-native";
import React, { useState } from "react";
import EmptyState from "@/components/EmptyState";
import { Bell, ClipboardList } from "lucide-react-native";
import colors from "@/constants/colors";
import {
  useNotificationsQuery,
  readNotifications,
} from "@/queries/notifications";
import Notification from "@/components/Notification";
import { useIsOnline } from "@/hooks/useIsOnline";

export default function Notifications() {
  const isOnline = useIsOnline();
  const { data: reports, isLoading, refetch } = useNotificationsQuery(isOnline);
  const [markingRead, setMarkingRead] = useState(false);

  const handleMarkAsRead = async () => {
    setMarkingRead(true);
    try {
      await readNotifications();
      await refetch();
    } finally {
      setMarkingRead(false);
    }
  };

  if (!isLoading && reports?.length === 0) {
    return (
      <EmptyState
        title="No Notifications"
        message="There are no notifications yet."
        icon={<Bell size={48} color={colors.mutedForeground} />}
      />
    );
  }

  return (
    <View style={styles.container}>
      <FlatList
        refreshControl={
          <RefreshControl
            refreshing={isLoading}
            onRefresh={() => {
              if (isOnline) refetch();
            }}
          />
        }
        data={reports}
        keyExtractor={(item) => item.id}
        renderItem={({ item }) => <Notification notification={item} />}
        contentContainerStyle={styles.listContent}
        ListHeaderComponent={
          <View style={styles.headerContainer}>
            <Button
              title={markingRead ? "Marking..." : "Mark as read"}
              onPress={handleMarkAsRead}
              disabled={markingRead}
              color={colors.primary}
            />
            {markingRead && (
              <ActivityIndicator style={styles.loadingIndicator} />
            )}
          </View>
        }
      />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: colors.background,
  },
  listContent: {
    padding: 16,
  },
  headerContainer: {
    marginBottom: 16,
    flexDirection: "row",
    alignItems: "center",
  },
  loadingIndicator: {
    marginLeft: 8,
  },
  headerText: {
    fontSize: 16,
    color: colors.mutedForeground,
    marginBottom: 16,
  },
  contentContainer: {
    padding: 16,
  },
  title: {
    fontSize: 24,
    fontWeight: "700",
    color: colors.foreground,
    marginBottom: 16,
  },
  emptyContainer: {
    flex: 1,
    alignItems: "center",
    justifyContent: "center",
    padding: 24,
  },
  emptyText: {
    fontSize: 16,
    color: colors.mutedForeground,
    textAlign: "center",
    marginTop: 12,
  },
});
