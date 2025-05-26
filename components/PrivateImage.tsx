import {
  ActivityIndicator,
  Image,
  ImageStyle,
  StyleSheet,
  Text,
} from "react-native";
import { Image as ImageType } from "@/types/report";
import { getImageUrl } from "@/utils/helpers";
import { useAuthStore } from "@/store/authStore";
import React, { useEffect, useState } from "react";
import axios from "@/utils/axios";

type PrivateImageProps = {
  image: ImageType;
  style: ImageStyle;
};

export default function PrivateImage({ image, style }: PrivateImageProps) {
  const [error, setError] = useState<string | null>(null);
  const [imageBase64, setImageBase64] = useState<string | ArrayBuffer | null>(
    null
  );
  const [isLoading, setIsLoading] = useState<boolean>(false);

  useEffect(() => {
    async function fetchImage() {
      if (!image) return;
      setIsLoading(true);
      const url = getImageUrl(image);
      const response = await axios.get(url, {
        responseType: "blob",
      });

      const blob = await response.data;
      const reader = new FileReader();
      reader.onloadend = () => {
        setImageBase64(reader.result); // This will be the base64 data URI
        setIsLoading(false);
      };
      reader.onerror = () => {
        setError("Failed to convert image blob to base64.");
        setIsLoading(false);
      };
      reader.readAsDataURL(blob);
    }

    fetchImage();
  }, [image]);

  if (isLoading) return <ActivityIndicator size="large" />;
  if (error) return <Text>Error: {error}</Text>;
  if (!imageBase64 && !isLoading) return <Text>No image to display.</Text>;

  return (
    <Image
      source={{
        uri: imageBase64?.toString(),
      }}
      style={style}
    />
  );
}
