import { StyleSheet, Text, View } from "react-native";
import React from "react";
import colors from "@/constants/colors";
import { Location, UserLocation } from "@/types/report";
import MapView, { Marker, PROVIDER_GOOGLE } from "react-native-maps";

export default function LocationPickerMapPreview({
  location,
}: {
  location: UserLocation | undefined;
}) {
  if (!location)
    return (
      <View style={styles.mapPlaceholder}>
        <Text style={styles.mapPlaceholderText}>
          Map preview will appear here
        </Text>
      </View>
    );
  return (
    <View style={styles.container}>
      <MapView
        style={styles.map}
        provider={PROVIDER_GOOGLE}
        pitchEnabled={false}
        scrollEnabled={false}
        zoomEnabled={false}
        camera={{
          zoom: 15,
          center: {
            latitude: location.latitude,
            longitude: location.longitude,
          },
          heading: 0,
          pitch: 0,
        }}
        initialRegion={{
          latitude: location.latitude,
          longitude: location.longitude,
          latitudeDelta: 0.0922,
          longitudeDelta: 0.0421,
        }}
      >
        <Marker
          coordinate={{
            latitude: location.latitude,
            longitude: location.longitude,
          }}
          pinColor={colors.primary}
        />
      </MapView>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    borderRadius: 5,
    overflow: "hidden",
    marginTop: 12,
  },
  map: {
    height: 120,
    backgroundColor: colors.card,
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
