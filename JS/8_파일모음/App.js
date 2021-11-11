import { StatusBar } from 'expo-status-bar'
import React, { useState } from 'react'
import { ScrollView, StyleSheet, View, Text, TextInput, TouchableOpacity } from 'react-native'
import Member from './Member'
import Container from './Container'

import MemberModel from './members.json'

//joseph님 스케쥴
//수업전: 
//대면수업 시작일: 10월 4일 예정
//9월 27~30 사이에 서울
//선호시간대: 월요일 피하고 화, 수, 목, 금 (오후)

/*

- props / children
- functional component
- style (styles 객체 / inline-styling)
- scrollView
- view
- text
- textInput
- useState (hooks)
--------------------
- create
- update
- delete

*/

//컴포넌트 단위에서는 이름을 대문자로 시작한다
//함수 레벨에서는 소문자로 시작

//멤버를 관리하는 앱을 만들어보자


//model (dummy-data, mock-data 가상 데이터)






//업데이트되는 리액트의 기준을 따라 컴포넌트는 [함수형 컴포넌트]로 만들어준다
export default function App() {
  

  //props, state, logic 관리
  
  // useState는 배열을 리턴, 그 배열을 첫 번째 값이 인자로 넣은 타입의 접근자 값, 두 번째 값은 첫 번째 값을 변형시킬 수 있는 함수가 반환된다.
  // 첫 번째 값인 name은 read-only이므로 'name = textValue'가 안 된다. 무조건 setName을 이용해야 한다.
  const [members, setMembers] = useState(MemberModel)
  const [name,    setName]    = useState('') 
  const [age,     setAge]     = useState(0) 
  const [country, setCountry] = useState('') 
  const [editingId, setEditingId] = useState(0)

  //select (update) logic
  const selectMember = (id) => {
    // const selectedMember = members[id - 1]
    // console.log('selectedMember: ', selectedMember)

    // selectedMember.selected = !selectedMember.selected

    // console.log('selectedMember: ', selectedMember)
    console.log('selectedId: ', id)
    setEditingId(id)
//  () => { 함수 블록
//  } 



    //update members
    const updatedMembers = members.map(member => 
      member.id === id ? {
        ...member,
        selected: member.selected ? false : true
      } : member
    )
    
    const selectedMember = members.find(e => e.id === id)
    console.log('selectedMember : ', selectedMember)

    setName(selectedMember.name)
    setAge(selectedMember.age)
    setCountry(selectedMember.country)

    // const restParamFunc = (...args) => {
    //   return args.length
    // }

    console.log('updatedMembers: ', updatedMembers)

    //set members
    setMembers(updatedMembers)
    

  }

  const deleteMember = (id) => {
    console.log('id : ', id)
    
    const filteredMembers = members.filter(member => member.id !== id)

    console.log('filteredMembers : ', filteredMembers)

    setMembers(filteredMembers)

  }




  
  // api : application (app) programming interface
  // 데이터를 주고받는 과정의 총체적인 방법. 
  

  //render (화면 표시 영역)
  return (
    <View style={styles.container}>
      <StatusBar style="auto" />
      <TextInput
        style={styles.input}
        placeholder='이름을 입력하세요'
        onChangeText={textValue => {
          console.log('textValue: ', textValue)
          setName(textValue)
        }}
        value={name}
      />
      <TextInput
        style={styles.input}
        placeholder='나이를 입력하세요'
        onChangeText={textValue => {
          console.log('textValue: ', textValue)
          setAge(Number(textValue))  
        }}
        value={age}
      />
      <TextInput
        style={styles.input}
        placeholder='국적을 입력하세요'
        onChangeText={textValue => {
          console.log('textValue: ', textValue)
          setCountry(textValue)
        }}
        value={country}
      />
      {editingId === 0 ?
      <TouchableOpacity onPress={() => {
        //create new member
        const newMember = {
          id: members.length + 1,
          name: name,
          age: age,
          country: country
        }
        
        //새로운 배열 생성 (전개 연산자 이용해서 기존 배열의 요소들을 모두 끌어오고, 말미에는 새로운 객체 추가)
        const newMembers = [...members, newMember]
        
        //members 재설정
        //useState의 값 변형 함수(set~)가 호출이 되면 화면(view)를 다시 그린다 (re-rendering 발생)
        //set함수는 비동기적으로 호출된다. (async)
        setMembers(newMembers)

        //mebers 요소 검사
        console.log("members : ", members) //그런데 새로 생성된 요소가 출력이 되지 않는다.
        //set함수가 비동기로 호출되기 때문에, set함수가 끝나는 것을 기다리지 않고 그냥 바로 console호출이 된다. 그래서 출력이 되지 않는 게 맞다.
        //멤버스가 추가되어서 화면에 반영되는 속도 < console에 찍히는 속도

        console.log("members : " , newMembers) // 따라서 요소 검사를 하고 싶으면, setMembers에 적용하려고 만든 배열을 찍으면 된다.

      }}>
        <View style={{ borderWidth: 1, width: 160, height: 35, marginBottom: 3 }}>
          <Text style={{ textAlign: 'center' }}>생성</Text>
        </View>
      </TouchableOpacity> :

      
      <TouchableOpacity
        onPress={() => {

          const updatedMembers = members.map(member => 
            member.id === editingId ? {
              ...member,
              name: name,
              age: age,
              country: country
            } : member
          )
          setMembers(updatedMembers)

          //후속처리
          setName('')
          setAge(0)
          setCountry('')
          setEditingId(0)
        }}
      >
        <View style={{ borderWidth: 1, width: 160, height: 35, marginBottom: 3 }}>

          <Text style={{ textAlign: 'center' }}>Edit</Text>
        </View>
      </TouchableOpacity>
      }

      <Container>
        {members.map(member =>
          <Member
            key={member.id}
            id={member.id}
            name={member.name}
            age={member.age}
            country={member.country}
            selected={member.selected}
            selectMember={selectMember}
            deleteMember={deleteMember}
          />
        )}
      </Container>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: 'white',
    alignItems: 'center',
    justifyContent: 'center',
    paddingVertical: 65,
  },
  input: {
    borderWidth: 1, 
    width: 160, 
    height: 35, 
    marginBottom: 3,
  },
});
