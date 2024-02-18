import React, {useState} from 'react';
import { View, StyleSheet, Text } from 'react-native';
import { CustomButton, CustomInput } from '../components';

const CalenderScreen = () => {
  return (
    <View style={styles.container}>
        <Text>Calender Screen</Text>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
});

export default CalenderScreen;