import axios from "@/utils/axios";
import { useQuery } from "@tanstack/react-query";

const fetchNotifications = async () => {
  const response = await axios.get("/notifications");

  return response.data;
};

export const readNotifications = async () => {
  await axios.get("/notifications/read-all");
};

export const useNotificationsQuery = (isOnline: boolean) => {
  return useQuery({
    queryKey: ["notifications"],
    queryFn: fetchNotifications,
    staleTime: Infinity,
    enabled: isOnline,
  });
};
