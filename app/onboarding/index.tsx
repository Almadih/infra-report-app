import { useReportStore } from "@/store/reportStore";
import axios from "@/utils/axios";
import { LinearGradient } from "expo-linear-gradient";
import { StatusBar } from "expo-status-bar";
import React, { useRef, useState } from "react";
import {
  Dimensions,
  Image,
  StyleSheet,
  Text,
  TouchableOpacity,
  View,
} from "react-native";
import Animated, {
  interpolate,
  useAnimatedScrollHandler,
  useAnimatedStyle,
  useSharedValue,
} from "react-native-reanimated";
import { useAuthStore } from "@/store/authStore";
import { Toast } from "toastify-react-native";
import { router } from "expo-router";
import colors from "@/constants/colors";
import { getUniqueId } from "react-native-device-info";

const { width, height } = Dimensions.get("window");

const slides = [
  {
    id: 1,
    title: "Welcome to InfraReport",
    description: "Report Infrastructure Issues. Build Safer Communities.",
    image: require("../../assets/photo-22.png"), // You'll need to add these images
  },
  {
    id: 2,
    title: "Report Issues",
    description:
      "Easily report and document issues in your community with photos and location data",
    image: require("../../assets/photo-11.png"),
  },
  {
    id: 3,
    title: "Track Progress",
    description:
      "Stay updated on the status of reported issues and community responses",
    image: require("../../assets/photo-333.png"),
  },
];

export default function OnboardingScreen() {
  const scrollX = useSharedValue(0);
  const [currentIndex, setCurrentIndex] = useState(0);
  const scrollRef = useRef<Animated.ScrollView>(null);
  const [isLoading, setIsLoading] = useState<boolean>(false);
  const { completeBoarding } = useReportStore();
  const scrollHandler = useAnimatedScrollHandler({
    onScroll: (event) => {
      scrollX.value = event.contentOffset.x;
    },
  });

  const { login } = useAuthStore();

  const register = async () => {
    setIsLoading(true);
    const deviceId = await getUniqueId();
    console.log(deviceId);
    const res = await axios.post("/auth", {
      device_id: deviceId,
    });
    setIsLoading(false);
    login(res.data.user, res.data.access_token);
    completeBoarding();
    router.replace("/(tabs)");
  };

  const renderDots = () => {
    return (
      <View style={styles.pagination}>
        {slides.map((_, index) => {
          const dotStyle = useAnimatedStyle(() => {
            const opacity = interpolate(
              scrollX.value,
              [(index - 1) * width, index * width, (index + 1) * width],
              [0.3, 1, 0.3]
            );
            const scale = interpolate(
              scrollX.value,
              [(index - 1) * width, index * width, (index + 1) * width],
              [1, 1.2, 1]
            );
            return {
              opacity,
              transform: [{ scale }],
            };
          });

          return <Animated.View key={index} style={[styles.dot, dotStyle]} />;
        })}
      </View>
    );
  };

  const handleNext = async () => {
    if (currentIndex < slides.length - 1) {
      scrollRef.current?.scrollTo({
        x: (currentIndex + 1) * width,
        animated: true,
      });
    } else {
      await register();
    }
  };

  return (
    <View style={styles.container}>
      <StatusBar style="light" />
      <LinearGradient
        colors={["#0c9e5a", "#076c38", "#034222"]}
        style={styles.gradient}
      >
        <Animated.ScrollView
          ref={scrollRef}
          horizontal
          pagingEnabled
          showsHorizontalScrollIndicator={false}
          onScroll={scrollHandler}
          scrollEventThrottle={16}
          onMomentumScrollEnd={(event) => {
            const index = Math.round(event.nativeEvent.contentOffset.x / width);
            setCurrentIndex(index);
          }}
        >
          {slides.map((slide) => (
            <View key={slide.id} style={styles.slide}>
              <Image
                source={slide.image}
                style={styles.image}
                resizeMode="cover"
              />
              <Text style={styles.title}>{slide.title}</Text>
              <Text style={styles.description}>{slide.description}</Text>
            </View>
          ))}
        </Animated.ScrollView>

        {renderDots()}

        <TouchableOpacity style={styles.button} onPress={handleNext}>
          <Text style={styles.buttonText}>
            {isLoading
              ? "Loading..."
              : currentIndex === slides.length - 1
              ? "Get Started"
              : "Next"}
          </Text>
        </TouchableOpacity>
      </LinearGradient>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
  gradient: {
    flex: 1,
  },
  slide: {
    width,
    height,
    alignItems: "center",
    justifyContent: "center",
    padding: 10,
  },
  image: {
    width: width,
    height: height * 0.6,
    marginBottom: 50,
  },
  title: {
    fontSize: 28,
    fontWeight: "bold",
    color: "#ffffff",
    textAlign: "center",
    marginBottom: 10,
  },
  description: {
    fontSize: 16,
    color: "#ffffff",
    textAlign: "center",
    paddingHorizontal: 20,
    lineHeight: 24,
  },
  pagination: {
    flexDirection: "row",
    justifyContent: "center",
    alignItems: "center",
    marginBottom: 30,
  },
  dot: {
    width: 8,
    height: 8,
    borderRadius: 4,
    backgroundColor: "#ffffff",
    marginHorizontal: 4,
  },
  button: {
    backgroundColor: colors.primary,
    paddingVertical: 10,
    paddingHorizontal: 40,
    borderRadius: 25,
    marginBottom: 50,
    alignSelf: "center",
  },
  buttonText: {
    color: "#ffffff",
    fontSize: 18,
    fontWeight: "600",
  },
});
