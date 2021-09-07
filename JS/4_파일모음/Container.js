import React from "react"
import { ScrollView, View, StyleSheet } from "react-native"

const Container = (props) => {


    return(
        <View style={styles.container}>
            <ScrollView >
                {props.children} 
                {/* props.children의 경우 <></>사이에 있는 값을 자동으로 children으로 인식한다. */}
            </ScrollView>
        </View>
    )
}



const styles = StyleSheet.create({
    container: {
      flex: 1,
      backgroundColor: '#fff',
      alignItems: 'center',
      justifyContent: 'center',
      paddingVertical: 65,
      borderRadius: 5,
      borderWidth:3,

    },
});

export default Container

  