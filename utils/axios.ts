import { useAuthStore } from "@/store/authStore";
import axios from "axios";
import { Toast } from "toastify-react-native";
import { BASE_URL } from "@/consts";

const instance = axios.create({
  baseURL: BASE_URL + "/api",
  headers: {
    Accept: "application/json",
    "Content-Type": "application/json",
    Authorization: "Bearer token",
  },
});

instance.interceptors.response.use(
  function (response) {
    if (response.data.message) {
      Toast.success(response.data.message);
    }
    return response;
  },
  function (error) {
    let data;
    if (error.response) {
      if (error.response.data.message) {
        data = error.response.data.message;
      } else {
        data = "Server Error";
      }

      Toast.error(data);

      if (error.response.status === 401) {
        //TODO
      }
    }
    return Promise.reject(error);
  }
);

instance.interceptors.request.use(function (config) {
  const { token } = useAuthStore.getState();
  config.headers.Authorization = `Bearer ${token}`;
  console.log(config);
  return config;
});

export default instance;
