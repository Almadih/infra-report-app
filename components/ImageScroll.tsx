import { Image as ImageType } from "@/types/report";
import { getImageUrl } from "@/utils/helpers";
import React, { useState } from "react";
import {
  Dimensions,
  Image,
  Modal,
  Platform,
  ScrollView,
  StatusBar,
  StyleSheet,
  Text,
  TouchableOpacity,
  View,
} from "react-native";
import PrivateImage from "./PrivateImage";

const { width: screenWidth, height: screenHeight } = Dimensions.get("window");

type ImageScrollProps = {
  images: ImageType[];
};

const ImageScroll = ({ images }: ImageScrollProps) => {
  const [modalVisible, setModalVisible] = useState(false);
  const [selectedImage, setSelectedImage] = useState<ImageType | null>(null);

  const openImageModal = (image: ImageType) => {
    setSelectedImage(image);
    setModalVisible(true);
  };

  const closeImageModal = () => {
    setModalVisible(false);
    setSelectedImage(null);
  };
  return (
    <View style={styles.container}>
      <ScrollView
        horizontal={true} // Enable horizontal scrolling
        showsHorizontalScrollIndicator={true} // Optional: hide scrollbar
        pagingEnabled={true} // Optional: makes the scroll snap to items
        style={styles.scrollView}
      >
        {images.map((image) => (
          <TouchableOpacity
            key={image.id}
            onPress={() => openImageModal(image)}
            style={styles.thumbnailContainer}
          >
            <PrivateImage image={image} style={styles.thumbnail} />
          </TouchableOpacity>
        ))}
      </ScrollView>

      {selectedImage && (
        <Modal
          animationType="fade" // You can use "slide", "fade", or "none"
          transparent={true}
          visible={modalVisible}
          onRequestClose={closeImageModal} // For Android back button
        >
          <View style={styles.modalContainer}>
            <TouchableOpacity
              style={styles.modalCloseButton}
              onPress={closeImageModal}
              activeOpacity={0.8}
            >
              <Text style={styles.modalCloseButtonText}>✕</Text>
            </TouchableOpacity>
            <PrivateImage
              image={selectedImage}
              style={styles.fullScreenImage}
            />
          </View>
        </Modal>
      )}
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
  thumbnailContainer: {
    marginHorizontal: 5,
    borderRadius: 8,
    overflow: "hidden", // Ensures image respects border radius
    elevation: 3, // Android shadow
    shadowColor: "#000", // iOS shadow
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.1,
    shadowRadius: 2,
  },
  thumbnail: {
    width: 320,
    height: 200,
    resizeMode: "cover",
  },
  modalContainer: {
    flex: 1,
    backgroundColor: "rgba(0, 0, 0, 0.9)", // Semi-transparent black
    justifyContent: "center",
    alignItems: "center",
  },
  fullScreenImage: {
    width: screenWidth,
    height: screenHeight,
    resizeMode: "contain",
  },
  scrollView: {
    // The ScrollView itself doesn't need a fixed width for horizontal scrolling
    // but you might want to constrain its height
    height: "auto", // Example height
  },
  modalCloseButton: {
    position: "absolute",
    top: (Platform.OS === "android" ? StatusBar.currentHeight || 0 : 20) + 20, // Adjust for status bar
    right: 20,
    backgroundColor: "rgba(255, 255, 255, 0.3)",
    padding: 10,
    borderRadius: 20,
    zIndex: 10, // Make sure it's on top
  },
  modalCloseButtonText: {
    color: "white",
    fontSize: 18,
    fontWeight: "bold",
  },
});

export default ImageScroll;
