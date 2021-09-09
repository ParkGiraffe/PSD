import { StatusBar } from 'expo-status-bar';
import React from 'react';
import { ScrollView, StyleSheet, Text, View, TextInput, TouchableOpacity } from 'react-native';
import Member from './Member'
import Container  from './Container';

//컴포넌트 단위에서는 이름을 대문자로 시작한다.
//함수 레벨에서는 소문자로 시작.


//멤버를 관리하는 앱을 만들어보자.


//컴포넌트에 function이 붙는 이유 : 업데이트되는 리액트의 기준을 따라 컴포너트는 함수형 컴포넌트로 만들어준다. (에전에는 클래스 형식이었는데 요즘은 함수형 컴포넌트로 만드는 게 대새이다.)
//함수형으로 가지면, 깔끔하고 간결하고 통일성을 줄 수 있어서이다.
export default function App() {

  //props, state, logic 관리

  //model (dummy data, 가상데이터)
  const members = [
    {
      id: 1,
      name: "Jerry",
      age: 30,
      country: "Korea"
    },
    {
      id: 2,
      name: "Joseph",
      age: 22,
      country: "Korea"
    },
    {
      id: 3,
      name: "Minsu",
      age: 21,
      country: "Korea"
    },
    {
      id: 4,
      name: "Paul",
      age: 45,
      country: "USA"
    },
    {
      id: 6,
      name: "Xi feng",
      age: 38,
      country: "China"
    },
    {
      id: 7,
      name: "Daniel",
      age: 38,
      country: "USA"
    },
    {
      id: 8,
      name: "Jojo",
      age: 38,
      country: "Germany"
    },
    {
      id: 10,
      name: "Hyeju",
      age: 23,
      country: "Korea"
    },
    {
      id: 5,
      name: "Xi feng",
      age: 38,
      country: "China"
    },
  ]



  //render (화면 표시 영역)
  return (
    // 무의식중에 써왔던 Props 예시 - style 안의 프롭을 쓰는 블록
    <View style={styles.container}>
      <StatusBar style="auto"/>

      <TextInput 
        style={{ borderWidth: 1, width: 160, height: 35, marginBottom: 3}}
        // string은 jsx를 생략할 수 있다. 감싸도 상관은 없음
        placeholder='이름을 입력하세요.'
        onChangeText={textValue => {
          console.log(textValue)
        }}
      />

      <TextInput 
        style={{ borderWidth: 1, width: 160, height: 35, marginBottom: 3}}
        // string은 jsx를 생략할 수 있다. 감싸도 상관은 없음
        placeholder='나이를 입력하세요.'
        onChangeText={textValue => {
          console.log(textValue)
        }}
      />

      <TextInput 
        style={{ borderWidth: 1, width: 160, height: 35, marginBottom: 3}}
        // string은 jsx를 생략할 수 있다. 감싸도 상관은 없음
        placeholder='국적을 입력하세요.'
        onChangeText={textValue => {
          console.log(textValue)
        }}
      />

      <TouchableOpacity 
        onPress = {() => {
          console.log("생성 완료")
        }}
      >
        <View style={{borderWidth: 1, width: 160, height: 35, marginBottom: 3, justifyContent:'center' }}>
          <Text style={{ textAlign: 'center', }}>
            생성
          </Text>
        </View>  
      </TouchableOpacity>


      <Container>
        {/* 이 안의 값은 직접만든 <Container>안에 포함된 부분으로 children으로 인식한다. */}
        { 
        //render 내에서 JS 코드를 처리할 때 중괄호를 사용한다.
        //JSX : Javascript Expression
          members.map(member => {
            //block 내 처리일 경우 return을 써줘야 한다. 단줄 처리일 때만 return 생략.
            return <Member 
                    key={member.id}
                    id={member.id}
                    name={member.name} 
                    age={member.age}
                    country={member.country}  
                  />
          })
        }
      </Container>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
    paddingVertical: 65,
  },
});
