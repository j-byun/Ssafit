<template>
  <v-app>
    <v-app-bar app color="transparent" flat>
      <!-- <v-spacer></v-spacer> -->

      <v-icon
        color="white"
        class="ml-6 mt-10"
        @click.stop="drawer = !drawer"
        x-large
        >{{ icons.mdiMenu }}
      </v-icon>
    </v-app-bar>
    <v-navigation-drawer
      :width="400"
      v-model="drawer"
      temporary
      clipped
      fixed
      app
      height="100vh"
    >
      <template v-if="user">
        <v-list-item v-for="(item, i) in itemUser" :key="i" :to="item.to">
          <v-list-item-content>
            <v-list-item-title
              id="navText"
              v-text="item.text"
            ></v-list-item-title>
          </v-list-item-content>
        </v-list-item>
        <v-list-item-action id="navText" @click="logout"
          >로그아웃</v-list-item-action
        >
      </template>

      <template v-else>
        <v-list-item v-for="(item, i) in itemNoUser" :key="i" :to="item.to">
          <v-list-item-content>
            <v-list-item-title
              id="navText"
              v-text="item.text"
            ></v-list-item-title>
          </v-list-item-content>
        </v-list-item>
      </template>
      <v-footer class="justify-center pl-0" inset app>
        <span>&copy; HyeHyeHye</span>
      </v-footer>
    </v-navigation-drawer>

    <v-main class="indigo lighten-5">
      <!-- <header-nav></header-nav> -->
      <router-view />
      <!-- <button @click="logout">로그아웃</button> -->
    </v-main>
    <v-footer class="indigo lighten-5 text-center d-flex flex-column">
      <v-divider></v-divider>
      <div><strong>팀 HyeHyeHye</strong></div>
      <div>
        <a href="https://github.com/j-byun"
          ><span style="color: #000000">변지혜</span></a
        >
        &nbsp;
        <a href="https://github.com/hyeii"
          ><span style="color: #000000">윤혜민</span></a
        >
      </div>
      <div>© 2023 HyeHyeHye Corp.</div>
    </v-footer>
  </v-app>
</template>

<script>
import { mapGetters } from "vuex";
import { mdiMenu } from "@mdi/js";
// import HeaderNav from "@/components/common/HeaderNav.vue";
export default {
  name: "App",
  components: {
    // HeaderNav,
  },
  computed: {
    ...mapGetters(["user"]),
  },
  methods: {
    logout() {
      this.$store.dispatch("userLogout");
    },
  },
  created() {
    this.$store.dispatch("getUsers");
  },
  data() {
    return {
      drawer: false,
      icons: {
        mdiMenu,
      },
      itemUser: [
        { text: "HOME", to: "/" },
        { text: "영상 목록", to: "/video/" },
        { text: "사용자 목록", to: "/user/" },
        { text: "마이페이지", to: "/user/myPage" },
      ],
      itemNoUser: [
        { text: "HOME", to: "/" },
        { text: "영상 목록", to: "/video/" },
        { text: "로그인", to: "/user/login" },
        { text: "회원가입", to: "/user/signup" },
      ],
    };
  },
};
</script>

<style>
* {
  font-family: "Dovemayo_gothic";
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

.scrollable {
  height: 100%;
  overflow: auto;
}

.v-navigation-drawer {
  opacity: 0.8;
}

.v-list-item-title {
  font-size: large;
}

#navText {
  font-family: "Dovemayo_gothic";
  font-size: larger;
}

a {
  overflow: hidden;
  position: relative;
  display: inline-block;
  text-decoration: none;
  /* color: #c461f2; */
  font-weight: 200;
  vertical-align: top;
}

a::before,
a::after {
  content: "";
  position: absolute;
  width: 100%;
  left: 0;
}
a::before {
  background-color: #6a57ff;
  height: 2px;
  bottom: 0;
  transform-origin: 100% 50%;
  transform: scaleX(0);
  transition: transform 0.3s cubic-bezier(0.76, 0, 0.24, 1);
}
a::after {
  content: attr(data-replace);
  height: 100%;
  top: 0;
  transform-origin: 100% 50%;
  transform: translate3d(200%, 0, 0);
  transition: transform 0.3s cubic-bezier(0.76, 0, 0.24, 1);
  color: #6a57ff;
}

a:hover::before {
  transform-origin: 0% 50%;
  transform: scaleX(1);
}
a:hover::after {
  transform: translate3d(0, 0, 0);
}

a span {
  display: inline-block;
  transition: transform 0.3s cubic-bezier(0.76, 0, 0.24, 1);
}

a:hover span {
  transform: translate3d(-200%, 0, 0);
}
</style>
