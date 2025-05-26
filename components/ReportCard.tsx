import React from "react";
import { View, Text, StyleSheet, Pressable } from "react-native";
import { Image } from "expo-image";
import { MapPin, Clock } from "lucide-react-native";
import { useRouter } from "expo-router";
import { Report } from "@/types/report";
import colors from "@/constants/colors";
import {
  formatDate,
  getImageUrl,
  getSeverityColor,
  getStatusColor,
} from "@/utils/helpers";
import PrivateImage from "./PrivateImage";

interface ReportCardProps {
  report: Report;
  compact?: boolean;
}

export default function ReportCard({
  report,
  compact = false,
}: ReportCardProps) {
  const router = useRouter();

  const handlePress = () => {
    router.push(`/report-details/${report.id}`);
  };

  return (
    <Pressable style={[styles.container]} onPress={handlePress}>
      <View style={styles.imageContainer}>
        <PrivateImage image={report.images[0]} style={styles.image} />
      </View>

      <View style={styles.content}>
        <Text style={styles.damageType}>{report.damage_type.name} Damage</Text>

        <View style={styles.locationContainer}>
          <MapPin size={14} color={colors.mutedForeground} />
          <Text style={styles.locationText} numberOfLines={1}>
            {report.address || "Unknown location"}
          </Text>
        </View>

        <View style={styles.footer}>
          <View style={styles.dateContainer}>
            <Clock size={14} color={colors.mutedForeground} />
            <Text style={styles.dateText}>{formatDate(report.created_at)}</Text>
          </View>

          <View style={{ flexDirection: "row", gap: 8 }}>
            <View
              style={[
                styles.severityIndicator,
                {
                  backgroundColor:
                    getSeverityColor(report?.severity.name!) + "20",
                },
              ]}
            >
              <Text
                style={[
                  styles.statusText,
                  styles.capitalize,
                  { color: getSeverityColor(report?.severity.name!) },
                ]}
              >
                {report?.severity.name}
              </Text>
            </View>
            <View
              style={[
                styles.statusBadge,
                {
                  backgroundColor: getStatusColor(report.status.name) + "20",
                },
              ]}
            >
              <Text
                style={[
                  styles.statusText,
                  styles.capitalize,
                  {
                    color: getStatusColor(report.status.name),
                  },
                ]}
              >
                {report.status.name.replace("_", " ")}
              </Text>
            </View>
          </View>
        </View>
      </View>
    </Pressable>
  );
}

const styles = StyleSheet.create({
  capitalize: {
    textTransform: "capitalize",
  },
  container: {
    flexDirection: "column",
    backgroundColor: colors.card,
    borderRadius: colors.radius,
    marginBottom: 12,
    shadowColor: colors.shadow.dark,
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.1,
    shadowRadius: 8,
    elevation: 2,
    borderWidth: 1,
    borderColor: colors.border,
  },
  imageContainer: {
    height: 200,
    width: "100%",
    position: "relative",
  },
  image: {
    width: "100%",
    height: "100%",
    borderTopLeftRadius: 12,
    borderTopRightRadius: 12,
  },
  severityIndicator: {
    paddingHorizontal: 10,
    paddingVertical: 4,
    borderRadius: 8,
    marginRight: 8,
  },
  content: {
    flex: 1,
    padding: 12,
    justifyContent: "space-between",
  },
  damageType: {
    fontSize: 16,
    fontWeight: "600",
    color: colors.foreground,
    marginBottom: 4,
  },
  locationContainer: {
    flexDirection: "row",
    alignItems: "center",
    marginBottom: 8,
  },
  locationText: {
    fontSize: 14,
    color: colors.mutedForeground,
    marginLeft: 4,
  },
  footer: {
    flexDirection: "row",
    justifyContent: "space-between",
    alignItems: "center",
  },
  dateContainer: {
    flexDirection: "row",
    alignItems: "center",
  },
  dateText: {
    fontSize: 12,
    color: colors.mutedForeground,
    marginLeft: 4,
  },
  statusBadge: {
    paddingHorizontal: 10,
    paddingVertical: 4,
    borderRadius: 8,
    marginRight: 8,
  },
  statusText: {
    fontSize: 12,
    fontWeight: "500",
  },
});
