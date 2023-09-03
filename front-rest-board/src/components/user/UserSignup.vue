<template>
  <!-- <v-app> -->
  <v-main>
    <v-container>
      <v-layout wrap>
        <v-flex sm12 md6 offset-md3>
          <v-card elevation="4" light tag="section">
            <v-card-title>
              <h3>회원가입</h3>
            </v-card-title>
            <v-card-text>
              <v-form>
                <v-text-field
                  v-model="id"
                  label="ID"
                  type="text"></v-text-field>

                <v-text-field
                  v-model="password"
                  label="PASSWORD"
                  type="password"></v-text-field>
                <v-text-field
                  v-model="name"
                  label="이름"
                  type="text"></v-text-field>
                <v-text-field
                  v-model="email"
                  label="이메일"
                  type="email"></v-text-field>
                <v-text-field
                  v-model="nickname"
                  label="nickname"
                  type="text"></v-text-field>
                <v-text-field
                  v-model="age"
                  label="age"
                  type="number"></v-text-field>
                <v-text-field
                  v-model="height"
                  label="height"
                  type="number"></v-text-field>
                <v-text-field
                  v-model="weight"
                  label="weight"
                  type="number"></v-text-field>
              </v-form>
            </v-card-text>

            <v-card-actions :class="{ 'pa-3': $vuetify.breakpoint.smAndUp }">
              <v-spacer></v-spacer>

              <v-btn
                @click="signUp"
                color="cyan lighten-4"
                :large="$vuetify.breakpoint.smAndUp"
                >Sign Up</v-btn
              >
            </v-card-actions>
          </v-card>
        </v-flex>
      </v-layout>
    </v-container>
  </v-main>
  <!-- </v-app> -->
</template>

<script>
import { mapState } from "vuex";
export default {
  name: "UserSignup",
  data() {
    return {
      no: "",
      id: "",
      password: "",
      name: "",
      email: "",
      nickname: "",
      age: "",
      height: "",
      weight: "",
    };
  },
  computed: {
    ...mapState(["users"]),
  },
  methods: {
    signUp() {
      if (
        this.id === "" ||
        this.password === "" ||
        this.name === "" ||
        this.email === "" ||
        this.nickname === "" ||
        this.age === "" ||
        this.height === "" ||
        this.weight === ""
      ) {
        alert("모든 내용을 입력해주세요");
        return;
      }
      let user = {
        no: 0,
        id: this.id,
        password: this.password,
        name: this.name,
        email: this.email,
        nickname: this.nickname,
        age: this.age,
        height: this.height,
        weight: this.weight,
      };
      for (let i = 0; i < this.users.length; i++) {
        if (this.users[i].id === user.id) {
          alert("이미 존재하는 아이디입니다.");
          return;
        }
        if (this.users[i].email === user.email) {
          alert("이미 가입된 이메일입니다.");
          return;
        }
        if (this.users[i].nickname === user.nickname) {
          alert("이미 존재하는 닉네임입니다.");
          return;
        }
      }
      if (
        confirm(
          "회원가입 후에는 닉네임을 변경할 수 없습니다.\n신중히 작성하셨나요?"
        )
      ) {
        this.$store.dispatch("signup", user);
      }
    },
  },
};
</script>

<style></style>
