// CustomInput.tsx
import React from 'react';
import { TextInput, StyleSheet, ViewStyle } from 'react-native';
import { CustomInputProps } from '../../types';

const CustomInput: React.FC<CustomInputProps> = ({
  value,
  onChangeText,
  placeholder = '',
  secureTextEntry = false,
  keyboardType = 'default',
  style = {},
}) => {
  return (
    <TextInput
      value={value}
      onChangeText={onChangeText}
      placeholder={placeholder}
      secureTextEntry={secureTextEntry}
      keyboardType={keyboardType}
      style={[styles.input, style]} // Apply default and custom styles
    />
  );
};

const styles = StyleSheet.create({
  input: {
    height: 40,
    width: '55%',
    margin: 12,
    borderWidth: 1,
    padding: 10,
    borderRadius: 5,
    borderColor: '#cccccc', // Default border color
    backgroundColor: '#ffffff', // Default background color
  },
});

export default CustomInput;
