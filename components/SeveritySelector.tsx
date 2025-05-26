import colors from "@/constants/colors";
import { useIsOnline } from "@/hooks/useIsOnline";
import { useSeveritiesQuery } from "@/queries/severities";
import { Severity } from "@/types/report";
import { getSeverityColor } from "@/utils/helpers";
import React from "react";
import {
  ActivityIndicator,
  Pressable,
  StyleSheet,
  Text,
  View,
} from "react-native";

interface SeveritySelectorProps {
  selectedSeverity: Severity | undefined;
  onSelect: (severity: Severity) => void;
}

export default function SeveritySelector({
  selectedSeverity,
  onSelect,
}: SeveritySelectorProps) {
  const isOnline = useIsOnline();
  const { data: severityLevels, isLoading } = useSeveritiesQuery(isOnline);

  if (!severityLevels || isLoading) {
    return <ActivityIndicator size="large" color={colors.primary} />;
  }

  return (
    <View style={styles.container}>
      <Text style={styles.label}>Severity Level</Text>
      <View style={styles.optionsContainer}>
        {severityLevels.map((item) => (
          <Pressable
            key={item.id}
            style={[
              styles.option,
              { borderColor: getSeverityColor(item.name) },
              selectedSeverity?.name === item.name && {
                backgroundColor: getSeverityColor(item.name) + "20",
              },
            ]}
            onPress={() => onSelect(item)}
          >
            <View
              style={[
                styles.indicator,
                { backgroundColor: getSeverityColor(item.name) },
              ]}
            />
            <Text
              style={[
                styles.optionLabel,
                styles.capitalize,
                selectedSeverity?.name === item.name && {
                  color: getSeverityColor(item.name),
                  fontWeight: "600",
                },
              ]}
            >
              {item.name}
            </Text>
          </Pressable>
        ))}
      </View>
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
  optionsContainer: {
    flexDirection: "row",
    justifyContent: "space-between",
  },
  capitalize: {
    textTransform: "capitalize",
  },
  option: {
    flexDirection: "row",
    alignItems: "center",
    justifyContent: "center",
    paddingVertical: 12,
    marginHorizontal: 4,
    borderRadius: colors.radius,
    borderWidth: 1,
    width: "23%",
  },
  indicator: {
    width: 8,
    height: 8,
    borderRadius: 4,
    marginRight: 8,
  },
  optionLabel: {
    fontSize: 14,
    color: colors.foreground,
  },
});
