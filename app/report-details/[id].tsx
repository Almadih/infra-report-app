import React from "react";
import {
  StyleSheet,
  Text,
  View,
  ScrollView,
  Pressable,
  ActivityIndicator,
} from "react-native";
import { Image } from "expo-image";
import { useLocalSearchParams } from "expo-router";
import { MapPin, Calendar, Clock, AlertTriangle } from "lucide-react-native";
import { useReportStore } from "@/store/reportStore";
import colors from "@/constants/colors";
import {
  formatDate,
  formatTime,
  getSeverityColor,
  getStatusColor,
} from "@/utils/helpers";
import EmptyState from "@/components/EmptyState";
import { useReportDetailsQuery } from "@/queries/reports";
import ImageScroll from "@/components/ImageScroll";
import ReportStatus from "@/components/ReportStatus";
import { useIsOnline } from "@/hooks/useIsOnline";

export default function ReportDetailsScreen() {
  const { id } = useLocalSearchParams<{ id: string }>();
  const isOnline = useIsOnline();
  const { data: report, isLoading } = useReportDetailsQuery(id, isOnline);
  if (!isLoading && !report?.id) {
    return (
      <EmptyState
        title="Report Not Found"
        message="The report you're looking for doesn't exist or has been removed."
        icon={<AlertTriangle size={48} color={colors.mutedForeground} />}
      />
    );
  }

  if (isLoading) {
    return (
      <View style={styles.loadingContainer}>
        <ActivityIndicator size="large" color={colors.primary} />
        <Text style={styles.loadingText}>Loading Report...</Text>
      </View>
    );
  }

  return (
    <ScrollView
      style={styles.container}
      contentContainerStyle={styles.contentContainer}
    >
      <View style={styles.imageContainer}>
        <ImageScroll images={report?.images!} />
      </View>

      <View style={styles.content}>
        <View style={styles.header}>
          <Text style={styles.title}>{report?.damage_type?.name} Damage</Text>
          <View style={styles.badgesContainer}>
            <View
              style={[
                styles.severityIndicator,
                {
                  backgroundColor:
                    getSeverityColor(report?.severity?.name!) + "20",
                },
              ]}
            >
              <Text
                style={[
                  styles.severityText,
                  styles.capitalize,
                  { color: getSeverityColor(report?.severity?.name!) },
                ]}
              >
                {report?.severity?.name}
              </Text>
            </View>
            <View
              style={[
                styles.statusBadge,

                {
                  backgroundColor: getStatusColor(report?.status.name!) + "20",
                },
              ]}
            >
              <Text
                style={[
                  styles.capitalize,
                  styles.statusText,
                  { color: getStatusColor(report?.status.name!) },
                ]}
              >
                {report?.status.name.replace("_", " ")}
              </Text>
            </View>
          </View>
        </View>

        <View style={styles.infoContainer}>
          <View style={styles.infoItem}>
            <MapPin size={18} color={colors.primary} style={styles.infoIcon} />
            <Text style={styles.infoText}>
              {report?.address ||
                `${report?.location.coordinates[1].toFixed(
                  6
                )}, ${report?.location.coordinates[0].toFixed(6)}`}
            </Text>
          </View>

          <View style={styles.infoItem}>
            <Calendar
              size={18}
              color={colors.primary}
              style={styles.infoIcon}
            />
            <Text style={styles.infoText}>
              {formatDate(report?.created_at!)}
            </Text>
          </View>

          <View style={styles.infoItem}>
            <Clock size={18} color={colors.primary} style={styles.infoIcon} />
            <Text style={styles.infoText}>
              {formatTime(report?.created_at!)}
            </Text>
          </View>
        </View>

        <View style={styles.section}>
          <Text style={styles.sectionTitle}>Description</Text>
          <Text style={styles.description}>
            {report?.description || "No description provided."}
          </Text>
        </View>

        <ReportStatus report={report!} />
      </View>

      <View style={styles.buttonContainer}>
        <Pressable style={styles.button}>
          <Text style={styles.buttonText}>Contact Authorities</Text>
        </Pressable>
      </View>
    </ScrollView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: colors.background,
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
  imageContainer: {
    width: "100%",
    height: "auto",
    backgroundColor: colors.gray[200],
    borderRadius: 12,
    overflow: "hidden",
    marginBottom: 16,
  },
  image: {
    width: "100%",
    height: "100%",
    borderRadius: 12,
  },
  content: {
    flex: 1,
  },
  header: {
    marginBottom: 16,
  },
  title: {
    fontSize: 24,
    fontWeight: "700",
    color: colors.foreground,
    marginBottom: 8,
  },
  badgesContainer: {
    flexDirection: "row",
    alignItems: "center",
    gap: 8,
  },
  severityIndicator: {
    paddingHorizontal: 10,
    paddingVertical: 4,
    borderRadius: 8,
    marginRight: 8,
    backgroundColor: colors.muted,
  },
  capitalize: {
    textTransform: "capitalize",
  },
  severityText: {
    fontSize: 12,
    fontWeight: "600",
  },
  statusBadge: {
    width: "auto",
    paddingHorizontal: 10,
    paddingVertical: 4,
    borderRadius: 8,
    backgroundColor: colors.muted,
    marginLeft: 8,
  },
  statusText: {
    fontSize: 12,
    fontWeight: "600",
  },
  infoContainer: {
    marginBottom: 20,
  },
  infoItem: {
    flexDirection: "row",
    alignItems: "center",
    marginBottom: 8,
  },
  infoIcon: {
    marginRight: 8,
  },
  infoText: {
    fontSize: 15,
    color: colors.mutedForeground,
  },
  section: {
    marginBottom: 20,
  },
  sectionTitle: {
    fontSize: 16,
    fontWeight: "600",
    color: colors.foreground,
    marginBottom: 8,
  },
  description: {
    fontSize: 15,
    color: colors.foreground,
    lineHeight: 22,
  },
  buttonContainer: {
    paddingHorizontal: 16,
    marginTop: 8,
  },
  button: {
    backgroundColor: colors.primary,
    borderRadius: 12,
    paddingVertical: 16,
    alignItems: "center",
    justifyContent: "center",
  },
  buttonText: {
    color: colors.background,
    fontSize: 16,
    fontWeight: "600",
  },
});
