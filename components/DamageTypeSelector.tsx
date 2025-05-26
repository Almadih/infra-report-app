import colors from "@/constants/colors";
import { useIsOnline } from "@/hooks/useIsOnline";
import { useDamageTypesQuery } from "@/queries/DamageTypes";
import { DamageType } from "@/types/report";
import Icon from "@expo/vector-icons/FontAwesome6";
import React from "react";
import {
  ActivityIndicator,
  Pressable,
  ScrollView,
  StyleSheet,
  Text,
  View,
} from "react-native";

interface DamageTypeSelectorProps {
  selectedType: DamageType | undefined;
  onSelect: (type: DamageType) => void;
}

const getIcon = (name: string) => {
  switch (name) {
    case "school":
      return <Icon name="school" size={24} />;
    case "road":
      return <Icon name="road" size={24} />;
    case "power line":
      return <Icon name="bolt" size={24} />;
    case "water line":
      return <Icon name="droplet-slash" size={24} />;
    case "mosque":
      return <Icon name="mosque" size={24} iconStyle="solid" />;
    case "hospital":
      return;
    default:
      return <Icon name="question" size={24} />;
  }
};

export default function DamageTypeSelector({
  selectedType,
  onSelect,
}: DamageTypeSelectorProps) {
  const isOnline = useIsOnline();
  const { data: damageTypes, isLoading } = useDamageTypesQuery(isOnline);

  if (!damageTypes || isLoading)
    return <ActivityIndicator size="large" color={colors.primary} />;

  return (
    <View style={styles.container}>
      <Text style={styles.label}>Type of Damage</Text>
      <ScrollView
        horizontal={true} // Enable horizontal scrolling
        showsHorizontalScrollIndicator={true} // Optional: hide scrollbar
        indicatorStyle="black"
      >
        {damageTypes.map((item) => (
          <Pressable
            key={item.id}
            style={[
              styles.option,
              selectedType?.name === item.name && styles.selectedOption,
            ]}
            onPress={() => onSelect(item)}
          >
            <View
              style={[
                styles.iconContainer,
                selectedType?.name === item.name &&
                  styles.selectedIconContainer,
              ]}
            >
              {getIcon(item.name.toLowerCase())}
            </View>
            <Text
              style={[
                styles.optionLabel,
                selectedType?.name === item.name && styles.selectedOptionLabel,
              ]}
            >
              {item.name}
            </Text>
          </Pressable>
        ))}
      </ScrollView>
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
  option: {
    paddingHorizontal: 8,
  },
  selectedOption: {},
  iconContainer: {
    width: 60,
    height: 60,
    borderRadius: 12,
    backgroundColor: colors.card,
    justifyContent: "center",
    alignItems: "center",
    marginBottom: 8,
    borderWidth: 1,
    borderColor: colors.border,
  },
  selectedIconContainer: {
    backgroundColor: colors.primary + "20",
    borderColor: colors.primary,
  },
  optionLabel: {
    fontSize: 14,
    color: colors.foreground,
    textAlign: "center",
  },
  selectedOptionLabel: {
    fontWeight: "600",
    color: colors.primary,
  },
});
