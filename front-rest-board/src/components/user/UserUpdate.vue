<template>
  <!-- <v-main>
    <h3>사용자 정보 수정</h3>
    <fieldset>
      <label for="id">아이디 : {{ user.id }}</label
      ><br />
      <label for="password">비밀번호 : </label>
      <input type="password" id="password" v-model="user.password" /><br />
      <label for="name">이름 : {{ user.name }}</label
      ><br />
      <label for="email">메일 : {{ user.email }}</label
      ><br />
      <label for="nickname">닉네임 : {{ user.nickname }}</label
      ><br />
      <label for="exp">경험치 : {{ user.exp }}</label
      ><br />
      <label for="age">나이 : </label>
      <input type="number" id="age" v-model="user.age" /><br />
      <label for="height">키 : </label>
      <input type="number" id="height" v-model="user.height" /><br />
      <label for="weight">몸무게 : </label>
      <input type="number" id="weight" v-model="user.weight" /><br />
      <button @click="update">수정</button>
    </fieldset>
  </v-main> -->
  <v-main>
    <v-container>
      <v-layout wrap>
        <v-flex sm12 md6 offset-md3>
          <v-card elevation="4" light tag="section">
            <v-card-title>
              <h3>사용자 정보 수정</h3>
            </v-card-title>
            <v-card-text>
              <v-form>
                <v-text-field
                  :model-value="user.id"
                  :label="user.id"
                  type="text"
                  disabled></v-text-field>

                <v-text-field
                  v-model="user.password"
                  label="PASSWORD"
                  type="password"></v-text-field>
                <v-text-field
                  :model-value="user.name"
                  :label="user.name"
                  type="text"
                  disabled></v-text-field>
                <v-text-field
                  :model-value="user.email"
                  :label="user.email"
                  type="email"
                  disabled></v-text-field>
                <v-text-field
                  :model-value="user.nickname"
                  :label="user.nickname"
                  type="text"
                  disabled></v-text-field>
                <v-text-field
                  v-model="user.age"
                  label="age"
                  type="number"></v-text-field>
                <v-text-field
                  v-model="user.height"
                  label="height"
                  type="number"></v-text-field>
                <v-text-field
                  v-model="user.weight"
                  label="weight"
                  type="number"></v-text-field>
              </v-form>
            </v-card-text>

            <v-card-actions :class="{ 'pa-3': $vuetify.breakpoint.smAndUp }">
              <v-spacer></v-spacer>

              <v-btn
                @click="update"
                color="cyan lighten-4"
                :large="$vuetify.breakpoint.smAndUp"
                >수정</v-btn
              >
            </v-card-actions>
          </v-card>
        </v-flex>
      </v-layout>
    </v-container>
  </v-main>
</template>

<script>
import { mapState } from "vuex";
export default {
  name: "UserUpdate",
  computed: {
    ...mapState(["user"]),
  },
  methods: {
    update() {
      if (
        this.user.password === "" ||
        this.user.age === "" ||
        this.user.height === "" ||
        this.user.weight === ""
      ) {
        alert("모든 내용을 입력해주세요");
        return;
      }
      let updateUser = {
        no: this.user.no,
        id: this.user.id,
        password: this.user.password,
        name: this.user.name,
        email: this.user.email,
        nickname: this.user.nickname,
        exp: this.user.exp,
        age: this.user.age,
        height: this.user.height,
        weight: this.user.weight,
      };
      if (confirm("회원정보를 수정하시겠습니까?")) {
        this.$store.dispatch("updateUser", updateUser);
      }
    },
  },
};
</script>

<style></style>
