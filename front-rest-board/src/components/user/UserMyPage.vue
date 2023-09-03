<template>
  <!-- <div> -->
  <!-- <h3>마이페이지</h3>
    <user-detail></user-detail>
    <h3>팔로우 리스트</h3>
    <user-followee></user-followee>
    <user-follower></user-follower>
    <button @click="goMessageList">메세지 관리</button>
    <user-likes-list></user-likes-list> -->
  <!-- </div> -->
  <!-- <v-app id="inspire"> -->
  <!-- <v-main> -->
  <!-- 전체 컨테이너 -->
  <v-container>
    <!-- <h3 class="px-5 py-5">My Page</h3> -->
    <!-- row 윗단 :: 사용자 정보, 경험치 및 영상 -->

    <v-row>
      <!-- col 좌측 바 : 사용자 정보 및 메세지 이동 -->
      <v-col cols="2">
        <v-card height="483" rounded="lg" class="elevation-3">
          <user-detail></user-detail>
          <!-- 이거 유저디테일로 옮김 <button @click="goMessageList">메세지 관리</button> -->
        </v-card>
      </v-col>
      <!-- col 우측 컨테이너 : 경험치 관리 및 영상 -->
      <v-col cols="10">
        <v-row>
          <v-col cols="2">
            <v-sheet
              min-height="36"
              rounded="lg"
              class="elevation-3 d-flex align-center justify-center text-center"
            >
              <div class="align-center font-weight-bold">
                {{ user.exp }} EXP
              </div>
            </v-sheet>
          </v-col>
          <v-col cols="10">
            <v-sheet
              min-height="36"
              rounded="lg"
              class="elevation-3 text-center"
            >
              <v-container>
                <v-progress-linear
                  :value="user.exp"
                  color="indigo"
                  striped
                  align-center
                  height="12"
                ></v-progress-linear>
              </v-container>
            </v-sheet>
          </v-col>
        </v-row>

        <!-- <v-sheet min-height="40vh" rounded="lg" class="elevation-3"> -->
        <!-- <v-container height="40vh"> -->
        <v-container>
          <user-likes-list></user-likes-list>
        </v-container>
        <!-- </v-container> -->
        <!-- </v-sheet> -->
      </v-col>
    </v-row>
    <!-- row 아랫단 : 팔로우 리스트 정보 -->
    <v-row>
      <v-col>
        <v-sheet min-height="15vh" rounded="lg" class="elevation-3">
          <v-container>
            <v-row>
              <v-col> <user-followee></user-followee> </v-col>
              <v-col> <user-follower></user-follower></v-col
            ></v-row>
          </v-container>
        </v-sheet>
      </v-col>
    </v-row>
  </v-container>
  <!-- </v-main> -->
  <!-- </v-app> -->
</template>

<script>
// import UserBoard from "@/components/user/UserBoard.vue";
import UserFollowee from "@/components/user/mypage/UserFollowee.vue";
import UserFollower from "@/components/user/mypage/UserFollower.vue";
import UserDetail from "@/components/user/mypage/UserDetail.vue";
import UserLikesList from "@/components/user/mypage/UserLikesList.vue";
import { mapGetters } from "vuex";

export default {
  name: "UserMyPage",
  methods: {
    goMessageList() {
      this.$router.push({ name: "messageList" });
    },
  },
  components: {
    // UserBoard,
    UserFollowee,
    UserFollower,
    UserDetail,
    UserLikesList,
  },
  computed: {
    ...mapGetters(["user"]),
  },
  created() {
    let no = this.$store.getters.user.no;
    this.$store.dispatch("followees", no);
    this.$store.dispatch("followers", no);
  },
};
</script>

<style></style>
