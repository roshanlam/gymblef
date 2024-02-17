// App.tsx or any other component/screen
import React from 'react';
import { View, StyleSheet } from 'react-native';
import CustomButton from './components/Button';

const App = () => {
  const handlePress = () => {
    console.log('Button pressed!');
  };

  return (
    <View style={styles.container}>
      <CustomButton
        onPress={handlePress}
        title="Click Me"
        backgroundColor="#34A853" // Google Green
        textColor="yellow" // White
      />
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

export default App;
