import { ViewStyle } from 'react-native';

type CustomButtonProps = {
    onPress: () => void;
    title: string;
    backgroundColor?: string;
    textColor?: string;
};

type CustomInputProps = {
    value: string;
    onChangeText: (text: string) => void; // Function to update the state with input value
    placeholder?: string;
    secureTextEntry?: boolean; // To handle password inputs
    keyboardType?: 'default' | 'numeric' | 'email-address' | 'phone-pad'; // More types available
    style?: ViewStyle; // Allow custom styling to be passed in
};


export type { CustomButtonProps, CustomInputProps };
