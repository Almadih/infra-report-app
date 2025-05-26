import { Notification } from "@/types/notification";
import { create } from "zustand";

interface NotificationState {
  notifications: Notification[];

  // Actions
  setNotifications: (notifications: Notification[]) => void;
  readNotifications: () => void;
}

export const useNotificationStore = create<NotificationState>()((set) => ({
  notifications: [],
  setNotifications: (notifications) => set({ notifications }),
  readNotifications: () => {
    set((state) => ({
      notifications: state.notifications.map((notification) => ({
        ...notification,
        read_at: new Date().toISOString(),
      })),
    }));
  },
}));
