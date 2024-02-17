// App.tsx or any other component/screen
import React, {useState} from 'react';
import { View, StyleSheet } from 'react-native';
import { CustomButton, CustomInput } from './components';

const App = () => {
  const handlePress = () => {
    console.log('Button pressed!');
  };
  const [inputValue, setInputValue] = useState('');

  return (
    <View style={styles.container}>
      <CustomButton
        onPress={handlePress}
        title="Click Me"
        backgroundColor="#34A853" // Google Green
        textColor="yellow" // White
      />

<CustomInput
        value={inputValue}
        onChangeText={setInputValue}
        placeholder="Enter text here"
        secureTextEntry={true}
        // Additional props like `secureTextEntry` or `keyboardType` can be passed here
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
