import React, { useState, useEffect } from 'react';
import * as Location from 'expo-location';

export default function () {
  const [location, setLocation] = useState<Location.LocationObject | null>(null);
  const [errorMsg, setErrorMsg] = useState<string | null>(null);

  useEffect(() => {
    (async () => {
      let { status } = await Location.requestForegroundPermissionsAsync();
      if (status !== 'granted') {
        setErrorMsg('Permission to access location was denied');
        return;
      }

      let location = await Location.getCurrentPositionAsync({});
      setLocation(location);
    })();
  }, []);

  let location_text = 'Waiting..';
  if (errorMsg) {
    location_text = errorMsg;
  } else if (location) {
    location_text = JSON.stringify(location);
  }

  return location_text;
}
