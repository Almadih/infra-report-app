import { ImagePickerAsset } from "expo-image-picker";

export type SeverityLevel = "low" | "medium" | "high";

export interface Location {
  type: string;
  coordinates: number[];
}
export interface UserLocation {
  longitude: number;
  latitude: number;
  address: {
    city: string | null;
    fullAddress: string;
  };
}
export interface Report {
  id: string;
  address: string;
  location: Location;
  severity: Severity;
  status: Status;
  damage_type: DamageType;
  created_at: string;
  updated_at: string;
  user_id: number;
  severity_id: number;
  status_id: number;
  damage_type_id: number;
  description: string;
  images: Image[];
}

export type Image = {
  id: number;
  url: string;
  report_id: number;
  created_at: string;
  updated_at: string;
};

export interface Severity {
  id: number;
  name: string;
}

export interface Status {
  id: number;
  name: string;
  created_at: string;
  updated_at: string;
}

export interface DamageType {
  id: number;
  name: string;
}

export interface NewReport {
  images: ImagePickerAsset[];
  location?: UserLocation;
  damageType?: DamageType;
  severity?: Severity;
  description?: string;
}
