import * as Location from "expo-location";
import { Platform } from "react-native";
import { UserLocation as LocationType, Report } from "@/types/report";

export const getCurrentLocation = async () => {
  try {
    const { status } = await Location.requestForegroundPermissionsAsync();

    if (status !== "granted") {
      throw new Error("Permission to access location was denied");
    }

    const location = await Location.getCurrentPositionAsync({
      accuracy: Location.Accuracy.Balanced,
    });

    const address = await reverseGeocode(
      location.coords.latitude,
      location.coords.longitude
    );

    return {
      latitude: location.coords.latitude,
      longitude: location.coords.longitude,
      address: address,
    };
  } catch (error) {}
};

export const reverseGeocode = async (latitude: number, longitude: number) => {
  try {
    const result = await Location.reverseGeocodeAsync({
      latitude,
      longitude,
    });

    if (result.length > 0) {
      const { street, city, region, district, postalCode, country } = result[0];
      const address = {
        city: city ? city : district,
        fullAddress: [street, city, region, postalCode, country]
          .filter(Boolean)
          .join(", "),
      };

      return address;
    }

    return {
      city: "",
      fullAddress: `${latitude.toFixed(6)}, ${longitude.toFixed(6)}`,
    };
  } catch (error) {
    console.error("Error reverse geocoding:", error);
    return {
      city: "",
      fullAddress: `${latitude.toFixed(6)}, ${longitude.toFixed(6)}`,
    };
  }
};

// Calculate distance between two coordinates in kilometers using Haversine formula
export const calculateDistance = (
  lat1: number,
  lon1: number,
  lat2: number,
  lon2: number
): number => {
  const R = 6371; // Radius of the earth in km
  const dLat = deg2rad(lat2 - lat1);
  const dLon = deg2rad(lon2 - lon1);
  const a =
    Math.sin(dLat / 2) * Math.sin(dLat / 2) +
    Math.cos(deg2rad(lat1)) *
      Math.cos(deg2rad(lat2)) *
      Math.sin(dLon / 2) *
      Math.sin(dLon / 2);
  const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
  const distance = R * c; // Distance in km
  return distance;
};

const deg2rad = (deg: number): number => {
  return deg * (Math.PI / 180);
};

// Filter reports within a certain radius (in km) from a location
export const getReportsWithinRadius = (
  reports: any[],
  location: LocationType,
  radiusKm: number = 5
): Report[] => {
  if (!location || !reports.length) return [];

  return reports.filter((report) => {
    const distance = calculateDistance(
      location.latitude,
      location.longitude,
      report.location.latitude,
      report.location.longitude
    );

    return distance <= radiusKm;
  });
};
