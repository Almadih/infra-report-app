import { useState, useEffect } from "react";
import NetInfo from "@react-native-community/netinfo";

export function useIsOnline() {
  const [isOnline, setIsOnline] = useState<boolean>(true); // Assume online initially

  useEffect(() => {
    const unsubscribe = NetInfo.addEventListener((state) => {
      setIsOnline(
        state.isConnected && state.isInternetReachable ? true : false
      );
    });

    // Initial check
    NetInfo.fetch().then((state) => {
      setIsOnline(
        state.isConnected && state.isInternetReachable ? true : false
      );
    });

    return () => {
      unsubscribe();
    };
  }, []);

  return isOnline;
}
