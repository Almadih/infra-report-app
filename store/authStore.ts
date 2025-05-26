import { User } from "@/types/user";
import AsyncStorage from "@react-native-async-storage/async-storage";
import { create } from "zustand";
import { createJSONStorage, persist } from "zustand/middleware";

interface AuthState {
  user: User | null;
  token: string;
  isLoggedIn: boolean;
  FCMToken: string;

  // Actions
  login: (user: User, token: string) => void;
  logout: () => void;
  setFCMToken: (token: string) => void;
}

export const useAuthStore = create<AuthState>()(
  persist(
    (set) => ({
      user: null,
      token: "",
      isLoggedIn: false,
      FCMToken: "",

      login: (user, token) => set({ user, token, isLoggedIn: true }),
      logout: () => set({ user: null, token: "", isLoggedIn: false }),
      setFCMToken: (token) => set({ FCMToken: token }),
    }),
    {
      name: "user-storage",
      storage: createJSONStorage(() => AsyncStorage),
      partialize: (state) => ({
        user: state.user,
        token: state.token,
        isLoggedIn: state.isLoggedIn,
        FCMToken: state.FCMToken,
      }),
    }
  )
);
