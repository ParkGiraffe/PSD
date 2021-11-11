// import { StatusBar } from 'expo-status-bar';
import React, { useState } from 'react';
import { StyleSheet, Text, TouchableOpacity, View } from 'react-native';
import Container from './Container';

const Member = (props) => {
    
    //비구조화를 통한 props 처리
    const { id, name, age, country, selected, selectMember, deleteMember } = props

    //props, state, logic 처리 영역



    //화면/뷰 렌더링 영역
    return (
        <TouchableOpacity onPress={() => {
            //눌렀을때의 처리 로직을 화살표 함수로 표현해준다
            console.log('member.name: ', name)
            selectMember(id)
        }}>
            <View style={selected === true ? styles.selectedContainer : styles.container}>
                <Text style={styles.title}>{id}</Text>
                <Text style={styles.title}>{name}</Text>
                <Text style={styles.age}>{age}</Text>
                <Text style={styles.title}>{country}</Text>
                <TouchableOpacity onPress={() => {
                    deleteMember(id)
                }}>
                    <Text>X</Text>
                </TouchableOpacity>
            </View>
        </TouchableOpacity>
    )
}

const styles = StyleSheet.create({
    container: {
        width: 150,
        height: 90,
        backgroundColor: 'white',
        alignItems: 'center',
        justifyContent: 'center',
        margin: 3,
        padding: 3,
        borderWidth: 1
    },
    selectedContainer: {
        width: 150,
        height: 90,
        //backgroundColor: 'white',
        alignItems: 'center',
        justifyContent: 'center',
        margin: 3,
        padding: 3,
        borderWidth: 1,
        backgroundColor: 'pink'
    },
    title: {
        padding: 1,
        color: 'blue'
    },
    age: {
        color: 'red'
    }
});

export default Member