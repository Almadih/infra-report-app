import EmptyState from "@/components/EmptyState";
import MapViewComponent from "@/components/MapView";
import colors from "@/constants/colors";
import { useIsOnline } from "@/hooks/useIsOnline";
import { useReportQuery } from "@/queries/reports";
import { useReportStore } from "@/store/reportStore";
import { Report } from "@/types/report";
import { getCurrentLocation } from "@/utils/location";
import { onlineManager } from "@tanstack/query-core";
import { useRouter } from "expo-router";
import { MapPin } from "lucide-react-native";
import React, { useEffect, useState } from "react";
import { ActivityIndicator, StyleSheet, Text, View } from "react-native";

export default function DashboardScreen() {
  const router = useRouter();
  const { setUserLocation, userLocation } = useReportStore();
  const [locationError, setLocationError] = useState(false);
  const [radiusMeters] = useState(20000); // 5km radius
  const isOnline = useIsOnline();

  useEffect(() => {
    onlineManager.setOnline(isOnline);
  }, [isOnline]);
  const {
    data: reports,
    isLoading,
    refetch,
  } = useReportQuery(
    radiusMeters,
    isOnline,
    userLocation?.latitude,
    userLocation?.longitude
  );

  const loadLocation = async () => {
    try {
      const location = await getCurrentLocation();
      if (!location) return;
      setUserLocation(location);
      setLocationError(false);
      return location;
    } catch (error) {
      setLocationError(true);
      return null;
    }
  };

  useEffect(() => {
    loadLocation();
  }, []);

  const handleMarkerPress = (report: Report) => {
    router.push(`/report-details/${report.id}`);
  };

  if (isLoading) {
    return (
      <View style={styles.loadingContainer}>
        <ActivityIndicator size="large" color={colors.primary} />
        <Text style={styles.loadingText}>Loading dashboard...</Text>
      </View>
    );
  }

  if (locationError || !userLocation) {
    return (
      <EmptyState
        title="Location Access Required"
        message="Please enable location services to view nearby reports and submit new ones."
        icon={<MapPin size={48} color={colors.mutedForeground} />}
      />
    );
  }

  return (
    <View style={styles.container}>
      <View style={styles.header}>
        <Text style={styles.title}>
          {reports?.length} {reports?.length === 1 ? "Report" : "Reports"}{" "}
          Nearby
        </Text>
        <View style={styles.radiusContainer}>
          <Text style={styles.radiusText}>Within {radiusMeters / 1000}km</Text>
        </View>
      </View>

      <MapViewComponent
        reports={reports ?? []}
        userLocation={userLocation}
        onMarkerPress={handleMarkerPress}
      />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: colors.background,
    padding: 16,
  },
  contentContainer: {
    padding: 16,
  },
  loadingContainer: {
    flex: 1,
    justifyContent: "center",
    alignItems: "center",
    backgroundColor: colors.background,
  },
  loadingText: {
    marginTop: 12,
    fontSize: 16,
    color: colors.mutedForeground,
  },
  header: {
    flexDirection: "row",
    justifyContent: "space-between",
    alignItems: "center",
    marginBottom: 16,
  },
  title: {
    fontSize: 24,
    fontWeight: "700",
    color: colors.foreground,
  },
  radiusContainer: {
    backgroundColor: colors.primary + "10",
    paddingHorizontal: 12,
    paddingVertical: 6,
    borderRadius: 16,
  },
  radiusText: {
    color: colors.primary,
    fontWeight: "600",
    fontSize: 14,
  },
  listHeader: {
    flexDirection: "row",
    justifyContent: "space-between",
    alignItems: "center",
    marginBottom: 12,
  },
  listTitle: {
    fontSize: 18,
    fontWeight: "600",
    color: colors.foreground,
  },
  filterButton: {
    flexDirection: "row",
    alignItems: "center",
    backgroundColor: colors.card,
    paddingHorizontal: 12,
    paddingVertical: 6,
    borderRadius: 16,
    borderWidth: 1,
    borderColor: colors.border,
  },
  filterText: {
    color: colors.primary,
    fontWeight: "500",
    fontSize: 14,
    marginLeft: 4,
  },
  emptyContainer: {
    padding: 24,
    alignItems: "center",
    justifyContent: "center",
    backgroundColor: colors.card,
    borderRadius: 12,
    borderWidth: 1,
    borderColor: colors.border,
  },
  emptyText: {
    fontSize: 14,
    color: colors.mutedForeground,
    textAlign: "center",
  },
});
