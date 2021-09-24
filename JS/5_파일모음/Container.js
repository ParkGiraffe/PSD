import React from 'react';
import { ScrollView, StyleSheet, View } from 'react-native';

const Container = (props) => {

    //render
    return (
        <View style={styles.container}>
            <ScrollView>
                {props.children}
            </ScrollView>
        </View>
    )

}

const styles = StyleSheet.create({
    container: {
        flex: 1,
        backgroundColor: 'white',
        alignItems: 'center',
        justifyContent: 'center',
        paddingVertical: 10,
        borderRadius: 5,
        borderWidth: 3
    },
});

export default Container