import { Severity } from "@/types/report";
import axios from "@/utils/axios";
import { useQuery } from "@tanstack/react-query";

const fetchSeverities = async () => {
  const res = await axios.get("severities");
  return res.data;
};

export const useSeveritiesQuery = (isOnline: boolean) => {
  return useQuery<Severity[]>({
    queryKey: ["severities"],
    queryFn: fetchSeverities,
    staleTime: Infinity,
    enabled: isOnline,
  });
};
