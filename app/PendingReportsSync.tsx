import { useEffect } from "react";
import NetInfo from "@react-native-community/netinfo";
import { useReportStore } from "@/store/reportStore";
import { createReport } from "@/queries/reports";
import { Platform } from "react-native";

export default function PendingReportsSync() {
  const {
    pendingReports,
    removePendingReport,
    clearPendingReports,
    resetCurrentReport,
  } = useReportStore();

  useEffect(() => {
    const unsubscribe = NetInfo.addEventListener(async (state) => {
      if (state.isConnected && pendingReports.length > 0) {
        // Try to send all pending reports
        for (let i = 0; i < pendingReports.length; i++) {
          const report = pendingReports[i];
          try {
            const formData = new FormData();
            report.images.forEach((imageAsset) => {
              let localUri = imageAsset.uri;
              let filename =
                imageAsset.fileName ||
                localUri?.split("/").pop() ||
                `image_${Date.now()}`;
              let type = imageAsset.mimeType;
              if (!type) {
                const extension = filename?.split(".").pop()?.toLowerCase();
                if (extension === "jpg" || extension === "jpeg")
                  type = "image/jpeg";
                else if (extension === "png") type = "image/png";
                else if (extension === "gif") type = "image/gif";
                else type = "application/octet-stream";
              }
              formData.append("images[]", {
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
              report.location?.latitude?.toString() || ""
            );
            formData.append(
              "location[lng]",
              report.location?.longitude?.toString() || ""
            );
            formData.append(
              "address",
              report.location?.address.fullAddress || ""
            );
            formData.append("city", report.location?.address.city || "");
            formData.append(
              "damage_type_id",
              report.damageType?.id?.toString() || ""
            );
            formData.append(
              "severity_id",
              report.severity?.id?.toString() || ""
            );
            formData.append("description", report.description || "");
            await createReport(formData);
            removePendingReport(i);
          } catch (e) {
            // If any fail, stop and try again next time
            break;
          }
        }
      }
    });
    return () => unsubscribe();
  }, [pendingReports, removePendingReport]);
  return null;
}
