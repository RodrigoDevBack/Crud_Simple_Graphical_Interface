import {
  Image,
  ScrollView,
  StyleSheet,
  Text,
  View,
  KeyboardAvoidingView,
} from "react-native";

import { Input } from "@/components/input";
import { Button } from "@/components/button";

export default function Index() {
  return (
    <View style={styles.container}>
      <KeyboardAvoidingView behavior="height" enabled>
        <ScrollView overScrollMode="always" decelerationRate="fast">
          <Image
            source={require("@/assets/login.png")}
            style={styles.illustration}
          />

          <Text style={styles.title}>Login</Text>
          <Text style={styles.subtitle}>
            Acesse sua conta com <Text style={styles.bold}>e-mail</Text> e{" "}
            <Text style={styles.bold}>senha</Text>.
          </Text>
          <View style={styles.form}>
            <Input placeholder="E-mail" keyboardType="email-address" />
            <Input placeholder="Senha" secureTextEntry />
            <Button label="Entrar"></Button>
          </View>
        </ScrollView>
      </KeyboardAvoidingView>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#d1d6cf",
    padding: 16,
  },
  bold: {
    fontWeight: "600",
  },
  illustration: {
    width: "100%",
    height: 330,
    resizeMode: "contain",
    marginTop: 62,
  },
  title: {
    fontSize: 36,
    fontWeight: 900,
  },
  subtitle: {
    fontSize: 18,
  },
  form: {
    marginTop: 24,
    gap: 12,
  },
});
