import React from "react";
import { StyleSheet, View, Text, Platform, Dimensions } from "react-native";
import MapView, { Marker, PROVIDER_GOOGLE } from "react-native-maps";
import { Report } from "@/types/report";
import { getSeverityColor } from "@/utils/helpers";
import colors from "@/constants/colors";

interface MapViewComponentProps {
  reports: Report[];
  userLocation: {
    latitude: number;
    longitude: number;
  } | null;
  onMarkerPress?: (report: Report) => void;
}

const WebMapFallback = ({ reports }: { reports: Report[] }) => (
  <View style={styles.webFallback}>
    <Text style={styles.webFallbackText}>
      {reports.length} reports found in your area
    </Text>
    <Text style={styles.webFallbackSubtext}>
      Map view is only available on mobile devices
    </Text>
  </View>
);

export default function MapViewComponent({
  reports,
  userLocation,
  onMarkerPress,
}: MapViewComponentProps) {
  // Return a fallback component for web
  if (Platform.OS === "web") {
    return <WebMapFallback reports={reports} />;
  }
  if (!userLocation) {
    return (
      <View style={styles.loadingContainer}>
        <Text style={styles.loadingText}>Loading map...</Text>
      </View>
    );
  }

  return (
    <View style={styles.container}>
      <MapView
        style={styles.map}
        provider={PROVIDER_GOOGLE}
        camera={{
          zoom: 10,
          center: {
            latitude: userLocation.latitude,
            longitude: userLocation.longitude,
          },
          heading: 0,
          pitch: 0,
        }}
        initialRegion={{
          latitude: userLocation.latitude,
          longitude: userLocation.longitude,
          latitudeDelta: 0.0922,
          longitudeDelta: 0.0421,
        }}
        showsUserLocation
        showsMyLocationButton
      >
        {/* User location marker */}

        {/* Report markers */}
        {reports.map((report) => (
          <Marker
            pinColor={getSeverityColor(report.severity.name)}
            key={report.id}
            coordinate={{
              latitude: report.location.coordinates[1],
              longitude: report.location.coordinates[0],
            }}
            title={report.damage_type.name}
            description={
              report.description?.substring(0, 30) +
              (report.description && report.description.length > 30
                ? "..."
                : "")
            }
            onPress={() => onMarkerPress && onMarkerPress(report)}
          />
        ))}
      </MapView>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    height: "auto",
    flex: 1,
    width: "100%",
    borderRadius: 12,
    overflow: "hidden",
  },
  map: {
    ...StyleSheet.absoluteFillObject,
  },
  loadingContainer: {
    height: 300,
    width: "100%",
    justifyContent: "center",
    alignItems: "center",
    backgroundColor: colors.card,
    borderRadius: 12,
    marginBottom: 16,
  },
  loadingText: {
    fontSize: 16,
    color: colors.mutedForeground,
  },
  webFallback: {
    height: 200,
    width: "100%",
    justifyContent: "center",
    alignItems: "center",
    backgroundColor: colors.card,
    borderRadius: 12,
    marginBottom: 16,
    borderWidth: 1,
    borderColor: colors.border,
  },
  webFallbackText: {
    fontSize: 16,
    fontWeight: "600",
    color: colors.foreground,
    marginBottom: 8,
  },
  webFallbackSubtext: {
    fontSize: 14,
    color: colors.mutedForeground,
  },
});
