import React, { useEffect, useState } from "react";
import { View, Text, StyleSheet, Animated } from "react-native";
import NetInfo from "@react-native-community/netinfo";
import { useIsOnline } from "@/hooks/useIsOnline";

export default function NetworkStatusBanner() {
  const isOnline = useIsOnline();
  const [slideAnim] = useState(new Animated.Value(-50));

  useEffect(() => {
    Animated.timing(slideAnim, {
      toValue: !isOnline ? 0 : -50,
      duration: 300,
      useNativeDriver: true,
    }).start();
  }, [isOnline]);

  if (isOnline) return null;

  return (
    <Animated.View
      style={[styles.banner, { transform: [{ translateY: slideAnim }] }]}
    >
      <Text style={styles.text}>
        You are offline. Some features may be unavailable.
      </Text>
    </Animated.View>
  );
}

const styles = StyleSheet.create({
  banner: {
    position: "absolute",
    top: 0,
    left: 0,
    right: 0,
    backgroundColor: "#d9534f",
    paddingVertical: 10,
    zIndex: 1000,
    alignItems: "center",
    elevation: 10,
  },
  text: {
    color: "#fff",
    fontWeight: "bold",
  },
});
