import { StatusBar } from 'expo-status-bar';
import React, { useState } from 'react';
import { ScrollView, StyleSheet, Text, TextInput, TouchableOpacity, View } from 'react-native';
import Container from './Container';
import Member from './Member';
import MemberModel from './members.json'

export default function App() {

  const [members, setMembers] = useState(MemberModel)
  const [name,    setName] = useState('')
  const [age,     setAge] = useState(0)
  const [country, setCountry] = useState('')



  const createMember = () => {
    const newMember = {
      id : members.length + 1,
      name : name,
      age : age,
      country : country,
    }

    const editedMembers = [...members, newMember]

    setMembers(editedMembers)
  }

  const deleteMember = (id) => {
    const editedMembers = members.filter(e => e.id != id )
    setMembers(editedMembers)
  }


  return (
    <View style={styles.container}>
      <StatusBar style="auto" />
      <TextInput
        style={styles.input}
        placeholder = '이름을 입력하세요'
        onChangeText={textValue => {
          console.log(textValue)
          setName(textValue)
        }}
        value={name}
      />
      <TextInput
        style={styles.input}
        placeholder = '나이를 입력하세요'
        onChangeText={textValue => {
          console.log(textValue)
          setAge(textValue)
        }}
        value={age}
      />
      <TextInput
        style={styles.input}
        placeholder = '국적을 입력하세요'
        onChangeText={textValue => {
          console.log(textValue)
          setCountry(textValue)
        }}
        value={country}
      />

      <TouchableOpacity
        onPress={()=>{
          createMember()
        }}
      >
        <View>
          <Text>생성</Text>
        </View>
      </TouchableOpacity>

      <TouchableOpacity>
        <View>
          <Text>수정</Text>
        </View>
      </TouchableOpacity>

      <ScrollView>
        {members.map(member =>
            <Member
              key={member.id}
              id={member.id}
              name={member.name}
              age={member.age}
              country={member.country}
              selected={member.selected}
              deleteMember={deleteMember}
            />
          )}
      </ScrollView>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
  },
});
