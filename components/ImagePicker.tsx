import React, { useState } from "react";
import { View, Text, StyleSheet, Pressable, Platform } from "react-native";
import { Image } from "expo-image";
import { Camera, Image as ImageIcon, X } from "lucide-react-native";
import * as ImagePickerExpo from "expo-image-picker";
import colors from "@/constants/colors";
import ImagePickerScrollPreview from "./ImagePickerScrollPreview";
import { getSupportedMediaTypeList } from "react-native-device-info";

interface ImagePickerProps {
  image: ImagePickerExpo.ImagePickerAsset[];
  onImageSelected: (images: ImagePickerExpo.ImagePickerAsset[]) => void;
  onImageRemoved: (image: ImagePickerExpo.ImagePickerAsset) => void;
}

export default function ImagePicker({
  image,
  onImageSelected,
  onImageRemoved,
}: ImagePickerProps) {
  const [loading, setLoading] = useState(false);

  const pickImage = async () => {
    try {
      setLoading(true);

      const result = await ImagePickerExpo.launchImageLibraryAsync({
        mediaTypes: ["images"],
        quality: 0.8,
        allowsMultipleSelection: true,
      });

      if (!result.canceled && result.assets && result.assets.length > 0) {
        onImageSelected(result.assets);
      }
    } catch (error) {
      console.error("Error picking image:", error);
    } finally {
      setLoading(false);
    }
  };

  const takePhoto = async () => {
    try {
      setLoading(true);

      const cameraPermission =
        await ImagePickerExpo.requestCameraPermissionsAsync();

      if (cameraPermission.status !== "granted") {
        alert("Sorry, we need camera permissions to make this work!");
        return;
      }

      const result = await ImagePickerExpo.launchCameraAsync({
        allowsMultipleSelection: true,
        quality: 0.8,
      });

      if (!result.canceled && result.assets && result.assets.length > 0) {
        onImageSelected(result.assets);
      }
    } catch (error) {
      console.error("Error taking photo:", error);
    } finally {
      setLoading(false);
    }
  };

  return (
    <View style={styles.container}>
      <Text style={styles.label}>Photo of Damages</Text>

      {image?.length > 0 ? (
        <ImagePickerScrollPreview
          images={image}
          onImageRemoved={onImageRemoved}
        />
      ) : (
        <View style={styles.buttonContainer}>
          <Pressable
            style={styles.button}
            onPress={pickImage}
            disabled={loading}
          >
            <ImageIcon size={24} color={colors.primary} />
            <Text style={styles.buttonText}>Select Photos</Text>
          </Pressable>
        </View>
      )}
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
  imageContainer: {
    position: "relative",
    height: 200,
    borderRadius: 12,
    overflow: "hidden",
  },
  image: {
    width: "100%",
    height: "100%",
  },
  removeButton: {
    position: "absolute",
    top: 8,
    right: 8,
    backgroundColor: "rgba(0, 0, 0, 0.6)",
    borderRadius: 20,
    width: 32,
    height: 32,
    justifyContent: "center",
    alignItems: "center",
  },
  buttonContainer: {
    flexDirection: "row",
    justifyContent: "space-between",
  },
  button: {
    flex: 1,
    height: 120,
    justifyContent: "center",
    alignItems: "center",
    backgroundColor: colors.card,
    borderRadius: 12,
    borderWidth: 1,
    borderColor: colors.border,
    marginHorizontal: 4,
  },
  buttonText: {
    marginTop: 8,
    fontSize: 14,
    color: colors.primary,
    fontWeight: "500",
  },
});
