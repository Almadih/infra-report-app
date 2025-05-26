import { DamageType } from "@/types/report";
import axios from "@/utils/axios";
import { useQuery } from "@tanstack/react-query";

const fetchDamageTypes = async () => {
  const res = await axios.get("/damage-types");

  return res.data;
};

export const useDamageTypesQuery = (isOnline: boolean) => {
  return useQuery<DamageType[]>({
    queryKey: ["damage-types"],
    queryFn: fetchDamageTypes,
    staleTime: Infinity,
    enabled: isOnline,
  });
};
