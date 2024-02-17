// CustomButton.tsx
import React from 'react';
import { TouchableOpacity, Text, StyleSheet } from 'react-native';
import { CustomButtonProps } from '../../types/button';

const CustomButton: React.FC<CustomButtonProps> = ({
    onPress,
    title,
    backgroundColor = '#007bff',
    textColor = '#ffffff',
  }) => {
    return (
      <TouchableOpacity
        onPress={onPress}
        style={[styles.button, { backgroundColor }]}
      >
        <Text style={[styles.text, { color: textColor }]}>
          {title}
        </Text>
      </TouchableOpacity>
    );
  };
  

const styles = StyleSheet.create({
  button: {
    padding: 10,
    margin: 10,
    borderRadius: 5,
    alignItems: 'center',
    justifyContent: 'center',
  },
  text: {
    fontSize: 16,
    fontWeight: 'bold',
  },
});

export default CustomButton;
