// App.tsx or any other component/screen
import React, {useState, FC} from 'react';
import { View, StyleSheet, SafeAreaView, Image } from 'react-native';
import {NavigationContainer} from '@react-navigation/native';
import { createBottomTabNavigator } from '@react-navigation/bottom-tabs';
import Icon from 'react-native-vector-icons/FontAwesome';
import HomeScreen from './views/Home';
import SettingsScreen from './views/Settings';
import { SettingsIcon } from './Icons';
import ChatScreen from './views/Chat';
import CalenderScreen from './views/Calender';

const Tab = createBottomTabNavigator();

const App: FC = () => {
  return (
    <SafeAreaView style={{flex: 1}}>
      <NavigationContainer>
        <Tab.Navigator
          screenOptions={({route}) => ({
            tabBarIcon: ({focused, color, size}) => {
              let iconName: string = '';
              if (route.name === 'Home') {
                iconName = 'home';
              }
              if (route.name === 'Settings') {
                iconName = 'cog';
              }
              if(route.name === 'Chat'){
                iconName = 'comment';
              }
              if (route.name === 'Calendar') {
                iconName = 'calendar';
              }
              return <Icon name={iconName} size={size} color={color} />;
            },
          })}
        >
          <Tab.Screen name="Home" component={HomeScreen} />
          <Tab.Screen name="Chat" component={ChatScreen} />
          <Tab.Screen name="Calendar" component={CalenderScreen} />
          <Tab.Screen name="Settings" component={SettingsScreen} />
        </Tab.Navigator>
      </NavigationContainer>
    </SafeAreaView>
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
