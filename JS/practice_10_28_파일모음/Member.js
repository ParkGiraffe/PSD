import React from 'react'
import { TouchableOpacity, StyleSheet, View, Text } from 'react-native'

const Member = (props) => {
    const { id, name, age, country, selected, deleteMember, selectMember } = props
    
    return(
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