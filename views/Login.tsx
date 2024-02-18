import React, {useState} from 'react';
import { View, StyleSheet } from 'react-native';
import { CustomButton, CustomInput } from '../components';

const LoginScreen = () => {
  const authLogin = () => {
    console.log('Button pressed!');
  };
  const [inputEmail, setEmail] = useState('');
  const [inputPassword, setPassword] = useState('');

  return (
    <View style={styles.container}>
         <CustomInput
        value={inputEmail}
        onChangeText={setEmail}
        placeholder="Enter Your Email"
        // Additional props like `secureTextEntry` or `keyboardType` can be passed here
      />
        <CustomInput
        value={inputPassword}
        onChangeText={setPassword}
        placeholder="Enter Your Password"
        secureTextEntry={true}
      />
      <CustomButton
        onPress={authLogin}
        title="Login"
        backgroundColor="orange" // Google Green
        textColor="white" // White
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

export default LoginScreen;