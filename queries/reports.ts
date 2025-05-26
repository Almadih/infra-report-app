import { Report } from "@/types/report";
import axios from "@/utils/axios";
import { useQuery } from "@tanstack/react-query";

const fetchReports = async (radius: number, lat?: number, lng?: number) => {
  const response = await axios.get("/reports", {
    params: {
      lat,
      lng,
      radius,
    },
  });

  return response.data;
};

const fetchMyReports = async () => {
  try {
    const response = await axios.get("/my-reports");

    return response.data;
  } catch (e) {
    console.log("error", e);
    return [];
  }
};

const fetchReport = async (id: string) => {
  try {
    const response = await axios.get(`/reports/${id}`);
    console.log(response.data);
    return response.data;
  } catch (e) {
    console.log("error", e);
    return {};
  }
};

export const createReport = (data: FormData) => {
  return axios.post("/reports", data, {
    headers: {
      "Content-Type": "multipart/form-data",
    },
  });
};

export const useReportQuery = (
  radius: number,
  isOnline: boolean,
  lat?: number,
  lng?: number
) => {
  return useQuery({
    queryKey: ["reports", lat, lng],
    queryFn: () => fetchReports(radius, lat, lng),
    staleTime: Infinity,
    enabled: !!lat && !!lng && isOnline,
  });
};

export const useMyReportsQuery = (isOnline: boolean) => {
  return useQuery({
    queryKey: ["my-reports"],
    queryFn: () => fetchMyReports(),
    enabled: isOnline,
    staleTime: Infinity,
  });
};

export const useReportDetailsQuery = (id: string, isOnline: boolean) => {
  return useQuery<Report>({
    queryKey: ["report-details", id],
    queryFn: () => fetchReport(id),
    enabled: isOnline,
    staleTime: Infinity,
  });
};
