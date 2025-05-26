import colors from "@/constants/colors";
import { useReportStore } from "@/store/reportStore";
import { UserLocation } from "@/types/report";
import { reverseGeocode } from "@/utils/location";
import { Stack, useRouter } from "expo-router";
import React, { useState } from "react";
import { Pressable, StyleSheet, Text, View } from "react-native";
import MapView, { Marker, PROVIDER_GOOGLE } from "react-native-maps";

export default function LocationModal() {
  const router = useRouter();
  const [selectedLocation, setSelectedLocation] = useState<
    UserLocation | undefined
  >(undefined);

  const { userLocation, setCurrentReport } = useReportStore();

  const handleMapPress = async (event: any) => {
    const { latitude, longitude } = event.nativeEvent.coordinate;
    // In a real app, you might want to reverse geocode to get an address
    const address = await reverseGeocode(latitude, longitude);

    setSelectedLocation({
      latitude,
      longitude,
      address,
    });
  };

  const handleConfirmLocation = () => {
    if (selectedLocation) {
      setCurrentReport({ location: selectedLocation });
      router.back(); // Close the modal
    }
  };

  return (
    <View style={styles.container}>
      <Stack.Screen
        options={{ title: "Select Location", presentation: "modal" }}
      />
      {/* Use MapView component here */}
      <MapView
        style={styles.map}
        onPress={handleMapPress}
        provider={PROVIDER_GOOGLE}
        camera={{
          zoom: 12,
          center: {
            latitude: userLocation?.latitude!,
            longitude: userLocation?.longitude!,
          },
          heading: 0,
          pitch: 0,
        }}
        initialRegion={{
          latitude: userLocation?.latitude!,
          longitude: userLocation?.longitude!,
          latitudeDelta: 0.0922,
          longitudeDelta: 0.0421,
        }}
        showsUserLocation
        showsMyLocationButton
      >
        {selectedLocation && (
          <Marker
            coordinate={{
              latitude: selectedLocation.latitude,
              longitude: selectedLocation.longitude,
            }}
            pinColor={colors.primary}
          />
        )}
      </MapView>

      {selectedLocation && (
        <View style={styles.confirmButtonContainer}>
          <Pressable
            style={styles.confirmButton}
            onPress={handleConfirmLocation}
          >
            <Text style={styles.confirmButtonText}>Confirm Location</Text>
          </Pressable>
        </View>
      )}
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
  map: {
    flex: 1,
  },
  confirmButtonContainer: {
    position: "absolute",
    bottom: 20,
    left: 20,
    right: 20,
  },
  confirmButton: {
    backgroundColor: colors.primary,
    borderRadius: 12,
    paddingVertical: 16,
    alignItems: "center",
    justifyContent: "center",
  },
  confirmButtonText: {
    color: colors.background,
    fontSize: 16,
    fontWeight: "600",
  },
});
