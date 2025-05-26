import { create } from "zustand";
import { persist, createJSONStorage } from "zustand/middleware";
import AsyncStorage from "@react-native-async-storage/async-storage";
import { Report, NewReport, Location, UserLocation } from "@/types/report";

interface ReportState {
  reports: Report[];
  currentReport: NewReport;
  userLocation: UserLocation | null;
  isLoading: boolean;
  isCompleteBoarding: boolean;
  pendingReports: NewReport[];

  // Actions
  setCurrentReport: (report: Partial<NewReport>) => void;
  resetCurrentReport: () => void;
  addReport: (report: Report) => void;
  setUserLocation: (location: UserLocation) => void;
  setIsLoading: (isLoading: boolean) => void;
  initReports: (reports: Report[]) => void;
  completeBoarding: () => void;
  addPendingReport: (report: NewReport) => void;
  removePendingReport: (index: number) => void;
  clearPendingReports: () => void;
}

export const useReportStore = create<ReportState>()(
  persist(
    (set) => ({
      reports: [],
      currentReport: {
        images: [],
      },
      userLocation: null,
      isLoading: false,
      isCompleteBoarding: false,
      pendingReports: [],

      setCurrentReport: (report) =>
        set((state) => ({
          currentReport: { ...state.currentReport, ...report },
        })),

      resetCurrentReport: () => set({ currentReport: { images: [] } }),
      completeBoarding: () => set({ isCompleteBoarding: true }),

      addReport: (report) =>
        set((state) => ({
          reports: [report, ...state.reports],
        })),
      initReports: (reports) => set({ reports }),

      setUserLocation: (location) => set({ userLocation: location }),

      setIsLoading: (isLoading) => set({ isLoading }),

      addPendingReport: (report) =>
        set((state) => ({ pendingReports: [...state.pendingReports, report] })),
      removePendingReport: (index) =>
        set((state) => {
          const newPending = [...state.pendingReports];
          newPending.splice(index, 1);
          return { pendingReports: newPending };
        }),
      clearPendingReports: () => set({ pendingReports: [] }),
    }),
    {
      name: "report-storage",
      storage: createJSONStorage(() => AsyncStorage),
      partialize: (state) => ({
        reports: state.reports,
        userLocation: state.userLocation,
        isCompleteBoarding: state.isCompleteBoarding,
        pendingReports: state.pendingReports,
      }),
    }
  )
);
