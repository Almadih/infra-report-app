import EmptyState from "@/components/EmptyState";
import ReportCard from "@/components/ReportCard";
import colors from "@/constants/colors";
import { useIsOnline } from "@/hooks/useIsOnline";
import { useMyReportsQuery } from "@/queries/reports";
import { ClipboardList } from "lucide-react-native";
import React from "react";
import { FlatList, RefreshControl, StyleSheet, Text, View } from "react-native";

export default function HistoryScreen() {
  const isOnline = useIsOnline();
  const { data: reports, isLoading, refetch } = useMyReportsQuery(isOnline);

  if (!isLoading && reports?.length === 0) {
    return (
      <EmptyState
        title="No Reports Yet"
        message="You haven't submitted any reports yet. Tap the Report tab to report infrastructure damage."
        icon={<ClipboardList size={48} color={colors.mutedForeground} />}
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
        renderItem={({ item }) => <ReportCard report={item} />}
        contentContainerStyle={styles.listContent}
        ListHeaderComponent={
          <Text style={styles.headerText}>
            {reports?.length} {reports?.length === 1 ? "Report" : "Reports"}{" "}
            Submitted
          </Text>
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
