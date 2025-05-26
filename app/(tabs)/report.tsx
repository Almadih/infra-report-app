import DamageTypeSelector from "@/components/DamageTypeSelector";
import ImagePicker from "@/components/ImagePicker";
import LocationPicker from "@/components/LocationPicker";
import SeveritySelector from "@/components/SeveritySelector";
import colors from "@/constants/colors";
import { createReport } from "@/queries/reports";
import { useReportStore } from "@/store/reportStore";
import { DamageType, Severity, UserLocation } from "@/types/report";
import NetInfo from "@react-native-community/netinfo";
import { ImagePickerAsset } from "expo-image-picker";
import { useRouter } from "expo-router";
import React, { useState } from "react";
import {
  ActivityIndicator,
  KeyboardAvoidingView,
  Platform,
  Pressable,
  ScrollView,
  StyleSheet,
  Text,
  TextInput,
  View,
} from "react-native";

export default function ReportScreen() {
  const router = useRouter();
  const {
    currentReport,
    setCurrentReport,
    resetCurrentReport,
    addReport,
    addPendingReport,
  } = useReportStore();
  const [submitting, setSubmitting] = useState(false);
  const [errors, setErrors] = useState<Record<string, string>>({});

  const handleImageSelected = (images: ImagePickerAsset[]) => {
    setCurrentReport({ images });
    // validateField("image", uri);
  };

  const handleImageRemoved = (image: ImagePickerAsset) => {
    const updatedImages = currentReport.images.filter(
      (img) => img.uri !== image.uri
    );
    setCurrentReport({ images: updatedImages });
    validateField("image", undefined);
  };

  const handleLocationChange = (location: UserLocation) => {
    setCurrentReport({ location });
    validateField("location", location);
  };

  const handleDamageTypeSelect = (damageType: DamageType) => {
    setCurrentReport({ damageType });
    validateField("damageType", damageType);
  };

  const handleSeveritySelect = (severity: Severity) => {
    setCurrentReport({ severity });
    validateField("severity", severity);
  };

  const handleDescriptionChange = (description: string) => {
    setCurrentReport({ description });
  };

  const validateField = (field: string, value: any) => {
    const newErrors = { ...errors };

    if (!value && field !== "description") {
      newErrors[field] = `${
        field.charAt(0).toUpperCase() + field.slice(1)
      } is required`;
    } else {
      delete newErrors[field];
    }

    setErrors(newErrors);
  };

  const validateForm = () => {
    const newErrors: Record<string, string> = {};

    if (!currentReport.images || currentReport.images.length === 0) {
      newErrors.image = "Photo is required";
    }

    if (!currentReport.location) {
      newErrors.location = "Location is required";
    }

    if (!currentReport.damageType) {
      newErrors.damageType = "Damage type is required";
    }

    if (!currentReport.severity) {
      newErrors.severity = "Severity level is required";
    }

    setErrors(newErrors);
    return Object.keys(newErrors).length === 0;
  };

  const handleSubmit = async () => {
    if (!validateForm()) {
      return;
    }
    setSubmitting(true);
    const netState = await NetInfo.fetch();
    if (!netState.isConnected) {
      // Offline: queue the report
      addPendingReport(currentReport);
      resetCurrentReport();
      setSubmitting(false);
      router.push("/confirmation");
      return;
    }

    const formData = new FormData();
    currentReport.images.forEach((imageAsset, index) => {
      // Extract filename and type
      // asset.uri looks like: 'file:///path/to/image.jpg'
      // asset.fileName might be available, or we derive it.
      // asset.mimeType might be available, or we derive it from extension.

      let localUri = imageAsset.uri;
      let filename = imageAsset.fileName!;
      let type = imageAsset.mimeType; // e.g., 'image/jpeg'

      if (!filename) {
        filename = localUri?.split("/").pop()!; // Get last part of URI
      }

      // Infer type if not available (basic inference)
      if (!type) {
        const extension = filename?.split(".").pop()?.toLowerCase()!;
        if (extension === "jpg" || extension === "jpeg") {
          type = "image/jpeg";
        } else if (extension === "png") {
          type = "image/png";
        } else if (extension === "gif") {
          type = "image/gif";
        } else {
          type = "application/octet-stream"; // Fallback
        }
      }

      // For React Native, the file object needs uri, name, and type
      formData.append("images[]", {
        // 'files' is the field name your server expects.
        // If your server expects an array like 'files[]', use 'files[]'
        // If your server expects one file per field, use 'file0', 'file1' etc.
        uri:
          Platform.OS === "android"
            ? localUri
            : localUri.replace("file://", ""),
        name: filename,
        type: type,
      } as any);
    });

    formData.append(
      "location[lat]",
      currentReport.location?.latitude!.toString()!
    );

    formData.append(
      "location[lng]",
      currentReport.location?.longitude!.toString()!
    );
    formData.append("address", currentReport.location?.address.fullAddress!);
    formData.append("city", currentReport.location?.address.city!);
    formData.append("damage_type_id", currentReport.damageType?.id.toString()!);
    formData.append("severity_id", currentReport.severity?.id.toString()!);
    formData.append("description", currentReport.description!);

    createReport(formData)
      .then(() => {
        resetCurrentReport();
        setSubmitting(false);
        router.push("/confirmation");
      })
      .catch(console.log)
      .finally(() => setSubmitting(false));
  };

  return (
    <KeyboardAvoidingView
      style={styles.container}
      behavior={Platform.OS === "ios" ? "padding" : undefined}
      keyboardVerticalOffset={Platform.OS === "ios" ? 64 : 0}
    >
      <ScrollView
        style={styles.scrollView}
        contentContainerStyle={styles.contentContainer}
        keyboardShouldPersistTaps="handled"
      >
        <Text style={styles.title}>Report Infrastructure Damage</Text>
        <Text style={styles.subtitle}>
          Help your community by reporting infrastructure issues
        </Text>

        <View style={styles.form}>
          <ImagePicker
            image={currentReport.images}
            onImageSelected={handleImageSelected}
            onImageRemoved={handleImageRemoved}
          />
          {errors.image && <Text style={styles.errorText}>{errors.image}</Text>}

          <LocationPicker
            location={currentReport.location}
            onLocationChange={handleLocationChange}
          />
          {errors.location && (
            <Text style={styles.errorText}>{errors.location}</Text>
          )}

          <DamageTypeSelector
            selectedType={currentReport.damageType}
            onSelect={handleDamageTypeSelect}
          />
          {errors.damageType && (
            <Text style={styles.errorText}>{errors.damageType}</Text>
          )}

          <SeveritySelector
            selectedSeverity={currentReport.severity}
            onSelect={handleSeveritySelect}
          />
          {errors.severity && (
            <Text style={styles.errorText}>{errors.severity}</Text>
          )}

          <View style={styles.inputContainer}>
            <Text style={styles.label}>Description (Optional)</Text>
            <TextInput
              style={styles.textInput}
              placeholder="Provide additional details about the damage..."
              placeholderTextColor={colors.mutedForeground}
              multiline
              numberOfLines={4}
              textAlignVertical="top"
              value={currentReport.description}
              onChangeText={handleDescriptionChange}
            />
          </View>
        </View>
      </ScrollView>

      <View style={styles.footer}>
        <Pressable
          style={[
            styles.submitButton,
            submitting && styles.submitButtonDisabled,
          ]}
          onPress={handleSubmit}
          disabled={submitting}
        >
          {submitting ? (
            <ActivityIndicator size="small" color={colors.primaryForeground} />
          ) : (
            <Text style={styles.submitButtonText}>Submit Report</Text>
          )}
        </Pressable>
      </View>
    </KeyboardAvoidingView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: colors.background,
  },
  scrollView: {
    flex: 1,
  },
  contentContainer: {
    padding: 16,
    paddingBottom: 100,
  },
  title: {
    fontSize: 24,
    fontWeight: "700",
    color: colors.foreground,
    marginBottom: 8,
  },
  subtitle: {
    fontSize: 16,
    color: colors.mutedForeground,
    marginBottom: 24,
  },
  form: {
    marginBottom: 24,
  },
  inputContainer: {
    marginBottom: 20,
  },
  label: {
    fontSize: 16,
    fontWeight: "600",
    color: colors.foreground,
    marginBottom: 12,
  },
  textInput: {
    borderWidth: 1,
    borderColor: colors.border,
    borderRadius: 12,
    padding: 12,
    fontSize: 16,
    color: colors.foreground,
    backgroundColor: colors.card,
    height: 150,
  },
  errorText: {
    color: colors.destructive,
    fontSize: 14,
    marginTop: 4,
    marginBottom: 12,
  },
  footer: {
    position: "absolute",
    bottom: 0,
    left: 0,
    right: 0,
    padding: 16,
    backgroundColor: colors.background,
    borderTopWidth: 1,
    borderTopColor: colors.border,
  },
  submitButton: {
    backgroundColor: colors.primary,
    paddingVertical: 16,
    borderRadius: 12,
    alignItems: "center",
  },
  submitButtonDisabled: {
    backgroundColor: colors.muted,
  },
  submitButtonText: {
    color: colors.primaryForeground,
    fontSize: 16,
    fontWeight: "600",
  },
  offlineToast: {
    position: "absolute",
    bottom: 80,
    left: 20,
    right: 20,
    backgroundColor: "#333",
    padding: 16,
    borderRadius: 10,
    alignItems: "center",
    zIndex: 1000,
  },
  offlineToastText: {
    color: "#fff",
    textAlign: "center",
    fontSize: 15,
  },
});
