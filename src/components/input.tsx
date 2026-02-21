import { TextInput, StyleSheet, TextInputProps } from "react-native";

export function Input({ ...props }: TextInputProps) {
  return <TextInput style={styles.input} {...props} />;
}

const styles = StyleSheet.create({
  input: {
    width: "100%",
    height: 48,
    borderWidth: 1,
    borderColor: "#c0baa3",
    borderRadius: 8,
    fontSize: 16,
    paddingLeft: 12,
  },
});
