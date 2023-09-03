<template>
  <div>
    <v-container>
      <h3 class="pb-6 pt-2">&nbsp;My Page</h3>

      <div class="font-weight-black">{{ user.nickname }}님</div>
      <div class="font-weight-black">환영합니다!</div> </v-container
    ><br />
    <!-- <div>{{ user.exp }}</div>
    <div>{{ user.age }}</div>
    <div>{{ user.height }}</div>
    <div>{{ user.weight }}</div> -->

    <v-container>
      <v-simple-table>
        <!-- <template v-slot:default> -->
        <tr>
          <th>경험치</th>
          <th>{{ user.exp }}</th>
        </tr>
        <tr>
          <th>나이</th>
          <th>{{ user.age }}세</th>
        </tr>
        <tr>
          <th>키</th>
          <th>{{ user.height }}</th>
        </tr>
        <tr>
          <th>몸무게</th>
          <th>{{ user.weight }}</th>
        </tr>
        <!-- </template> -->
      </v-simple-table>
    </v-container>
    <br />
    <v-container>
      <button @click="goMessageList">MESSAGE 관리</button><br />
      <button @click="updateUser" small>EDIT</button>
      <br />
      <button @click="deleteUser(user.no)" small>회원탈퇴</button>
      <br />
    </v-container>
  </div>
</template>

<script>
import { mapGetters } from "vuex";
export default {
  name: "UserDetail",
  computed: {
    ...mapGetters(["user"]),
  },
  methods: {
    goMessageList() {
      this.$router.push({ name: "messageList" });
    },
    updateUser() {
      this.$router.push({ name: "userUpdate" });
    },
    deleteUser(no) {
      if (confirm("탈퇴하시겠습니까?")) {
        if (confirm("정말 탈퇴하시겠습니까?")) {
          if (confirm("정말요?")) {
            if (confirm("마지막으로 묻겠습니다.\n정말 탈퇴하실건가요?")) {
              this.$store.dispatch("deleteUser", no);
            }
          }
        }
      }
    },
  },
};
</script>

<style></style>
