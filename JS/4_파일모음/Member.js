import React from "react"
import { View, Text, StyleSheet, TouchableOpacity } from "react-native"

// 무조건 "props"만 써야 함!
const Member = (props) => {
    
    // const props = 
    // {
    //     name: "Jerry"
    // } 가 자동으로 넘어오는 형식.

    //비구조화를 통한 props 처리
    const { name, age, country, id } = props

    //props, state, logic 처리 영역


    //화면/뷰 렌더링영역
    return(
        <TouchableOpacity 
            onPress={() => {
                // 눌렀을 때의 처리 로직을 화살표 함수로 표현해준다.
                console.log("member.name : ", name)
            }}
        >
            <View style={styles.container}>
                {/* <Text>Member {props.name} 입니다.</Text>  <- 비구조화 전의 처리 방식*/} 
                <Text style = {styles.title}>{name}의 나이는 {age} 입니다.</Text>
                <Text style = {styles.title, {color: "red"}}>{id}</Text>
                <Text style = {styles.title}>{country}</Text>
            </View>
        </TouchableOpacity>
    )
}

const styles = StyleSheet.create({
    container: {
        //flex: 1,
        width:150,
        height:100,
        backgroundColor: '#fff',
        alignItems: 'center',
        justifyContent: 'center',
        margin: 5,
        borderWidth: 1,
        padding: 5,
    },
    title: {
        padding: 2,
        color: 'blue'
    }
  });
  

export default Member