import colors from "@/constants/colors";
import { Report } from "@/types/report";
import { formatDate } from "@/utils/helpers";
import React from "react";
import { StyleSheet, Text, View } from "react-native";

type ReportStatusProps = {
  report: Report;
};

const statusOrder = ["pending", "under_review", "verified", "resolved"];

function getStatusIndex(statusName: string) {
  return statusOrder.indexOf(statusName);
}

export default function ReportStatus({ report }: ReportStatusProps) {
  const currentStatusIndex = getStatusIndex(report?.status.name || "pending");

  return (
    <View style={styles.section}>
      <Text style={styles.sectionTitle}>Status Updates</Text>

      <View style={styles.timelineContainer}>
        {/* Report Submitted */}
        <View style={styles.timelineItem}>
          <View
            style={[
              styles.timelineDot,
              { backgroundColor: colors.status.success },
            ]}
          />
          <View style={styles.timelineContent}>
            <Text style={styles.timelineTitle}>Report Submitted</Text>
            <Text style={styles.timelineDate}>
              {formatDate(report?.created_at!)}
            </Text>
          </View>
        </View>

        {/* Connector to Pending */}
        <View
          style={[
            styles.timelineConnector,
            {
              backgroundColor:
                currentStatusIndex >= 0
                  ? colors.status.success
                  : colors.gray[300],
            },
          ]}
        />

        {/* Pending */}
        <View style={styles.timelineItem}>
          <View
            style={[
              styles.timelineDot,
              {
                backgroundColor:
                  currentStatusIndex >= 0
                    ? colors.status.success
                    : colors.gray[300],
              },
            ]}
          />
          <View style={styles.timelineContent}>
            <Text
              style={[
                styles.timelineTitle,
                {
                  color:
                    currentStatusIndex >= 0
                      ? colors.foreground
                      : colors.gray[400],
                },
              ]}
            >
              Pending
            </Text>
            <Text style={styles.timelineDate}>
              {currentStatusIndex === 0 ? "Pending" : "Completed"}
            </Text>
          </View>
        </View>

        {/* Connector to Under Review */}
        <View
          style={[
            styles.timelineConnector,
            {
              backgroundColor:
                currentStatusIndex >= 1
                  ? colors.status.success
                  : colors.gray[300],
            },
          ]}
        />

        {/* Under Review */}
        <View style={styles.timelineItem}>
          <View
            style={[
              styles.timelineDot,
              {
                backgroundColor:
                  currentStatusIndex >= 1
                    ? colors.status.success
                    : colors.gray[300],
              },
            ]}
          />
          <View style={styles.timelineContent}>
            <Text
              style={[
                styles.timelineTitle,
                {
                  color:
                    currentStatusIndex >= 1
                      ? colors.foreground
                      : colors.gray[400],
                },
              ]}
            >
              Under Review
            </Text>
            <Text style={styles.timelineDate}>
              {currentStatusIndex === 1
                ? "In progress"
                : currentStatusIndex > 1
                ? "Completed"
                : "Pending"}
            </Text>
          </View>
        </View>

        {/* Connector to Verified */}
        <View
          style={[
            styles.timelineConnector,
            {
              backgroundColor:
                currentStatusIndex >= 2
                  ? colors.status.success
                  : colors.gray[300],
            },
          ]}
        />

        {/* Verified */}
        <View style={styles.timelineItem}>
          <View
            style={[
              styles.timelineDot,
              {
                backgroundColor:
                  currentStatusIndex >= 2
                    ? colors.status.success
                    : colors.gray[300],
              },
            ]}
          />
          <View style={styles.timelineContent}>
            <Text
              style={[
                styles.timelineTitle,
                {
                  color:
                    currentStatusIndex >= 2
                      ? colors.foreground
                      : colors.gray[400],
                },
              ]}
            >
              Verified
            </Text>
            <Text style={styles.timelineDate}>
              {currentStatusIndex === 2
                ? "In progress"
                : currentStatusIndex > 2
                ? "Completed"
                : "Pending"}
            </Text>
          </View>
        </View>

        {/* Connector to Resolved */}
        <View
          style={[
            styles.timelineConnector,
            {
              backgroundColor:
                currentStatusIndex >= 3
                  ? colors.status.success
                  : colors.gray[300],
            },
          ]}
        />

        {/* Resolved */}
        <View style={styles.timelineItem}>
          <View
            style={[
              styles.timelineDot,
              {
                backgroundColor:
                  currentStatusIndex >= 3
                    ? colors.status.success
                    : colors.gray[300],
              },
            ]}
          />
          <View style={styles.timelineContent}>
            <Text
              style={[
                styles.timelineTitle,
                {
                  color:
                    currentStatusIndex >= 3
                      ? colors.foreground
                      : colors.gray[400],
                },
              ]}
            >
              Resolved
            </Text>
            <Text style={styles.timelineDate}>
              {currentStatusIndex === 3 ? "Completed" : "Not resolved"}
            </Text>
          </View>
        </View>
      </View>
    </View>
  );
}

const styles = StyleSheet.create({
  section: {
    marginBottom: 20,
  },
  timelineContainer: {
    marginTop: 8,
    marginLeft: 8,
    borderLeftWidth: 2,
    borderLeftColor: colors.gray[200],
    paddingLeft: 12,
  },
  timelineItem: {
    flexDirection: "row",
    alignItems: "center",
    marginBottom: 12,
  },
  timelineDot: {
    width: 12,
    height: 12,
    borderRadius: 6,
    marginRight: 12,
  },
  timelineContent: {
    flex: 1,
  },
  timelineTitle: {
    fontSize: 14,
    fontWeight: "600",
    color: colors.foreground,
  },
  timelineDate: {
    fontSize: 12,
    color: colors.mutedForeground,
  },
  timelineConnector: {
    width: 2,
    height: 24,
    marginLeft: 5,
    backgroundColor: colors.gray[200],
  },
  sectionTitle: {
    fontSize: 16,
    fontWeight: "600",
    color: colors.foreground,
    marginBottom: 8,
  },
});
