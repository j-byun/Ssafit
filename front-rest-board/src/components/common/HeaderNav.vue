<template>
  <header>
    <nav>
      <router-link to="/">Home</router-link> |
      <router-link :to="{ name: 'boardList' }">게시판 목록</router-link> |
      <router-link :to="{ name: 'videoList' }">영상 목록</router-link> |

      <template v-if="user">
        <router-link :to="{ name: 'userList' }">사용자 목록</router-link> |
        <router-link :to="{ name: 'userMyPage' }">마이페이지</router-link> |
        <button @click="logout">로그아웃</button>
      </template>

      <template v-else>
        <router-link :to="{ name: 'userLogin' }">로그인</router-link> |
        <router-link :to="{ name: 'userSignup' }">회원가입</router-link>
      </template>
    </nav>
  </header>
</template>

<script>
import { mapState } from "vuex";
export default {
  name: "HeaderNav",
  computed: {
    ...mapState(["user"]),
  },
  methods: {
    logout() {
      this.$store.dispatch("userLogout");
    },
  },
};
</script>

<style>
nav {
  padding: 30px;
}

nav a {
  font-weight: bold;
  color: #2c3e50;
}

nav a.router-link-exact-active {
  color: #616dee;
}
</style>
