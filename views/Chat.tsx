import React, {useState} from 'react';
import { View, StyleSheet, Text } from 'react-native';
import { CustomButton, CustomInput } from '../components';

const ChatScreen = () => {
  return (
    <View style={styles.container}>
        <Text>Chat Screen</Text>
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

export default ChatScreen;