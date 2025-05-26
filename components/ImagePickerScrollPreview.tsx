import colors from "@/constants/colors";
import { ImagePickerAsset } from "expo-image-picker";
import { X } from "lucide-react-native";
import React from "react";
import {
  Dimensions,
  Image,
  Pressable,
  ScrollView,
  StyleSheet,
  View,
} from "react-native";

const { width: windowWidth } = Dimensions.get("window");

type ImagePickerScrollPreviewProps = {
  images: ImagePickerAsset[];
  onImageRemoved: (image: ImagePickerAsset) => void;
};

const ImagePickerScrollPreview = ({
  images,
  onImageRemoved,
}: ImagePickerScrollPreviewProps) => {
  return (
    <View style={styles.container}>
      <ScrollView
        horizontal={true} // Enable horizontal scrolling
        showsHorizontalScrollIndicator={true} // Optional: hide scrollbar
        pagingEnabled={true} // Optional: makes the scroll snap to items
        style={styles.scrollView}
      >
        {images.map((image) => (
          <View style={styles.imageContainer} key={image.uri}>
            <Image source={{ uri: image.uri }} style={styles.image} />
            <Pressable
              style={styles.removeButton}
              onPress={() => onImageRemoved(image)}
            >
              <X size={20} color={colors.background} />
            </Pressable>
          </View>
        ))}
      </ScrollView>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: "center",
    alignItems: "center",
    marginTop: 10,
    marginBottom: 10,
  },
  scrollView: {
    // The ScrollView itself doesn't need a fixed width for horizontal scrolling
    // but you might want to constrain its height
    height: "auto", // Example height
  },
  image: {
    width: windowWidth * 0.8, // Each image takes 80% of screen width
    height: 200, // Fixed height for images
    borderRadius: colors.radius,
    marginHorizontal: 10, // Spacing between images
  },
  imageContainer: {
    position: "relative",
    height: 200,
    borderRadius: 12,
    overflow: "hidden",
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
});

export default ImagePickerScrollPreview;
