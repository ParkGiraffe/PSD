import { StatusBar } from 'expo-status-bar';
import React, {useState} from 'react';
import { StyleSheet, Text, View, TouchableOpacity } from 'react-native';

import { NavigationContainer } from '@react-navigation/native';
import { createNativeStackNavigator } from '@react-navigation/native-stack';

import { useFonts } from 'expo-font'
import AppLoading from 'expo-app-loading'

// Navigation
// Push
// Pop - goBack
// Return to root - navigate, popToTop
// Modal (모달 : 화면을 가리는 특징 -> 전체적으로 가리는 효과. 모달 <=> 알림과는 차이가 있다.)



const Stack = createNativeStackNavigator()
// 근데 왜 '스택'이냐?
// stack -> 하나의 화면인 screen을 겹겹이 쌓는 구조 (그래서 쌓인 스택)
// Push -> 하위에 놓인 화면 위에 새로운 화면을 얹는 구조
// 이전 화면으로 간다 -> 그 올려진 화면을 제거해서 아래 놓인 화면이 나오게 끔 한다.
// 처음 화면으로 간다 -> 첫 화면 위로 올려져 쌓인 화면들 (stack)을 모두 제거해서 첫 화면이 드러나게 한다.

// FIFO -> 먼저 올려진 화면이 먼저 빠진다.






export default function App() {
  // pre-load font-family
  // App()이 실행되기 전에 font loading이 되어야 함.
  const [ fontsLoaded ] = useFonts({ //fontLoaded는 boolean 타입 
    // 어떤 폰트를 가져올지
    // 서체관리자에서 "폰트이름-폰트스타일" 
    'NanumMyeongjo-Regular' : require('./assets/fonts/NanumMyeongjo-Regular.ttf'),
    'BMDoHyeon-OTF-Regular' : require('./assets/fonts/BM_Dohyeon.otf')

  })
 
  // render
  return fontsLoaded ?
    <NavigationContainer>
      <Stack.Navigator>
        <Stack.Group>
          <Stack.Screen 
            name='Root'    
            component={Root}
            options={{ headerShown: false }}
          />
          <Stack.Screen 
            name='Details' 
            component={Details}
            options={{ headerShown: false }}
          />
          <Stack.Screen 
            name='InDepth' 
            component={InDepth}
            options={{ headerShown: false }}
          />
        </Stack.Group>
        <Stack.Group screenOptions={{ presentation: 'modal' }}>
          <Stack.Screen 
            name='Modal' 
            component={Modal}
            options={{ headerShown: false }}
          />
        </Stack.Group>
      </Stack.Navigator>
    </NavigationContainer> :
    <AppLoading/> // font가 로딩이 안 되는 경우 - Apploading : splash 화면 출력
}

const Root = (props) => {

  //props 비구조화
  const { navigation } = props // stack group안에 있으면, 자동으로 navigation props를 전달함.
  const [ toggle, setToggle ] = useState(false)

  const button_styles = StyleSheet.create({
    button_title: {
      fontFamily: 'BMDoHyeon-OTF-Regular',
      fontSize:16,
      color: toggle ? 'white' : 'black'
    },
    button: {
      borderWidth: 1,
      borderRadius: 5,
      margin: 5,
      padding: 5,
      backgroundColor: toggle ? 'black' : 'white'
    },
  });
  

  //render
  return(
    <View style={styles.container}>
      <Text style={styles.title}>Root Screen</Text>
      <View style={{ flexDirection: 'row' }}>  
        <TouchableOpacity 
          style={button_styles.button}
          onPress={() => {
            console.log('상세화면으로 들여보내줘')
            navigation.push('Details', { testParam: '12345' }) // 다음 스택으로 인자를 보내주는 방법.
          }}
        >
          <Text style={button_styles.button_title}>Details</Text>
        </TouchableOpacity>
        <TouchableOpacity 
          style={button_styles.button}
          onPress={() => {
            console.log('모달화면')
            navigation.push('Modal', { testParam:'this is modal' }) // 다음 스택으로 인자를 보내주는 방법.
          }
        }>
          <Text style={button_styles.button_title}>모달 화면</Text>
        </TouchableOpacity>
      </View>
      <TouchableOpacity
        style={ button_styles.button }
        onPress={() => {
          toggle ? setToggle(false) : setToggle(true)
        }}
      >
        <Text
          style={button_styles.button_title}
        >
          Toggle
        </Text>
      </TouchableOpacity>
    </View>
  )
}

const Details = (props) => {
  
  //props 비구조화
  const { navigation, route } = props // stack group안에 있으면, 자동으로 navigation props를 전달함.
  const { testParam } = route.params // 전해준 파라미터를 받아오는 방법.

  console.log('testParams: ', testParam)
  
  //render
  return(
    <View style={styles.container}>
      <Text>Details Screen</Text>
      <TouchableOpacity onPress={() => {
        console.log('뒤로 돌아가기')
        //navigation.push('Details')
        navigation.goBack()
      }}>
        <Text>뒤로 돌아가기</Text>
      </TouchableOpacity>
      <TouchableOpacity onPress={() => {
        console.log('더 깊숙이 들어가기')
        //navigation.push('Details')
        navigation.push('InDepth') // 위에 하나씩 쌓기
      }}>
        <Text>더 깊숙이 들어가기</Text>
      </TouchableOpacity>
    </View>
  )
}

const InDepth = (props) => {
  
  //props 비구조화
  const { navigation } = props // stack group안에 있으면, 자동으로 navigation props를 전달함.

  //render
  return(
    <View style={styles.container}>
      <Text>InDepth Screen</Text>
      <TouchableOpacity onPress={() => {
        console.log('')
        //navigation.push('Details')
        //navigation.navigate('Root') // 지정된 이름을 향해 들어갈 때. 이름에 맞춰서 쌓거나 뺄 때 둘 다 가능
        // 만약에 기존 스택에 페이지가 없을 경우, 자동으로 푸시를 한다.

        navigation.popToTop() // 가장 첫 화면으로 바로 이동.
      }}>
        <Text>첫 화면으로 가기</Text>
      </TouchableOpacity>
    </View>
  )
}


const Modal = (props) => {
  
  //props 비구조화
  const { navigation, route } = props // stack group안에 있으면, 자동으로 navigation props를 전달함.
  const { testParam } = route.params

  console.log('testParams: ', testParam)


  //render
  return(
    <View style={styles.container}>
      <Text>Modal Screen</Text>
      <TouchableOpacity 
        style={styles.button}
        onPress={() => {
          console.log('모달 닫기')
          navigation.goBack() // 모달도 Go back으로 함.
        }}
      >
        <Text>모달 닫기</Text>
      </TouchableOpacity>
    </View>
  )
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: 'ivory',
    alignItems: 'center',
    justifyContent: 'center',
  },
  title: {
    fontFamily: 'NanumMyeongjo-Regular',
    fontSize: 18,
    marginVertical: 20,
  },
});
