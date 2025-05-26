import React, { useEffect, useState } from "react";
import {
  View,
  Text,
  StyleSheet,
  Pressable,
  ActivityIndicator,
  Platform,
} from "react-native";
import { MapPin, RefreshCw } from "lucide-react-native";
import colors from "@/constants/colors";
import { Location, UserLocation } from "@/types/report";
import { getCurrentLocation } from "@/utils/location";
import { useReportStore } from "@/store/reportStore";
import { useRouter } from "expo-router";
import LocationPickerMapPreview from "./LocationPickerMapPreview";

interface LocationPickerProps {
  location: UserLocation | undefined;
  onLocationChange: (location: UserLocation) => void;
}

export default function LocationPicker({
  location,
  onLocationChange,
}: LocationPickerProps) {
  const router = useRouter();
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const { userLocation } = useReportStore();

  const fetchLocation = async () => {
    try {
      setLoading(true);
      setError(null);
      const currentLocation = await getCurrentLocation();
      if (!currentLocation) return;
      onLocationChange(currentLocation);
    } catch (err) {
      setError("Could not get your location. Please try again.");
      console.error(err);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    if (!location && userLocation) {
      onLocationChange(userLocation);
    } else if (!location && !userLocation) {
      fetchLocation();
    }
  }, []);

  return (
    <View style={styles.container}>
      <Text style={styles.label}>Location</Text>

      <View style={styles.locationContainer}>
        <View style={styles.locationContent}>
          <MapPin size={20} color={colors.primary} style={styles.icon} />

          {loading ? (
            <ActivityIndicator size="small" color={colors.primary} />
          ) : location ? (
            <Text style={styles.locationText} numberOfLines={2}>
              {location.address.fullAddress}
            </Text>
          ) : (
            <Text style={styles.placeholderText}>
              {error || "Tap to get your current location"}
            </Text>
          )}
        </View>

        <Pressable
          style={styles.refreshButton}
          onPress={fetchLocation}
          disabled={loading}
        >
          <RefreshCw
            size={18}
            color={loading ? colors.gray[300] : colors.primary}
          />
        </Pressable>
      </View>

      {/* Manual Select Button */}
      <Pressable
        style={styles.manualSelectButton}
        onPress={() => {
          router.push({
            pathname: "/location-modal",
            params: {
              onLocationChange: JSON.stringify(onLocationChange), // Pass the function as a string (will need to handle this in modal)
            },
          });
        }}
      >
        <Text style={styles.manualSelectButtonText}>Select Manually</Text>
      </Pressable>

      <LocationPickerMapPreview location={location} />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    marginBottom: 20,
  },
  label: {
    fontSize: 16,
    fontWeight: "600",
    color: colors.foreground,
    marginBottom: 12,
  },
  locationContainer: {
    flexDirection: "row",
    alignItems: "center",
    justifyContent: "space-between",
    borderWidth: 1,
    borderColor: colors.border,
    borderRadius: 12,
    padding: 12,
    backgroundColor: colors.card,
  },
  locationContent: {
    flexDirection: "row",
    alignItems: "center",
    flex: 1,
  },
  icon: {
    marginRight: 8,
  },
  locationText: {
    fontSize: 14,
    color: colors.foreground,
    flex: 1,
  },
  placeholderText: {
    fontSize: 14,
    color: colors.mutedForeground,
  },
  refreshButton: {
    padding: 8,
    borderRadius: 8,
    backgroundColor: colors.card,
  },
  manualSelectButton: {
    marginTop: 12,
    paddingVertical: 10,
    paddingHorizontal: 12,
    borderRadius: 8,
    backgroundColor: colors.primary,
    alignItems: "center",
  },
  manualSelectButtonText: {
    color: colors.background,
    fontSize: 14,
    fontWeight: "600",
  },
  mapPlaceholder: {
    height: 120,
    backgroundColor: colors.card,
    borderRadius: 12,
    marginTop: 12,
    justifyContent: "center",
    alignItems: "center",
    borderWidth: 1,
    borderColor: colors.border,
    borderStyle: "dashed",
  },
  mapPlaceholderText: {
    color: colors.mutedForeground,
    fontSize: 14,
  },
});
