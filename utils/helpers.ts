import colors from "@/constants/colors";
import { Image } from "@/types/report";
import { Platform } from "react-native";
import axios from "@/utils/axios";
import { BASE_URL } from "@/consts";

export const generateId = () => {
  return (
    Math.random().toString(36).substring(2, 15) +
    Math.random().toString(36).substring(2, 15)
  );
};

export const formatDate = (timestamp: string) => {
  const date = new Date(timestamp);
  return date.toLocaleDateString("en-US", {
    year: "numeric",
    month: "short",
    day: "numeric",
  });
};

export const formatTime = (timestamp: string) => {
  const date = new Date(timestamp);
  return date.toLocaleTimeString("en-US", {
    hour: "2-digit",
    minute: "2-digit",
  });
};

export const getSeverityColor = (severity: string) => {
  switch (severity) {
    case "low":
      return "#10B981"; // Green
    case "medium":
      return "#efb100"; // Amber
    case "high":
      return "#ff6900"; // Red
    case "critical":
      return "#fb2c36";
    default:
      return "#6B7280"; // Gray
  }
};

// Helper for status badge color
export const getStatusColor = (status: string) => {
  switch (status) {
    case "pending":
      return colors.status.warning;
    case "under_review":
      return colors.status.review;
    case "verified":
      return colors.status.info;
    case "resolved":
      return colors.status.success;
    default:
      return colors.mutedForeground;
  }
};

export const isWeb = Platform.OS === "web";

export const getImageUrl = (image: Image) => {
  return BASE_URL + "/image/" + image.id;
};

export const storeFCMToken = async (token: string) => {
  const response = await axios.post("/fcm-token", {
    fcm_token: token,
  });

  return response.data;
};
