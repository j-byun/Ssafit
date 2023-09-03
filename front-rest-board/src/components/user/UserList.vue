<template>
  <!-- <v-app id="inspire"> -->
  <v-main>
    <v-container>
      <h3>사용자 목록</h3>
      <v-card class="transparent" flat>
        <v-card-title>
          <v-text-field
            v-model="search"
            append-icon="mdi-magnify"
            label="검색어를 입력하세요."
            single-line
            hide-details
          ></v-text-field>
        </v-card-title>
        <v-data-table
          :headers="headers"
          :items="users"
          :items-per-page="5"
          class="elevation-5"
          rounded="lg"
          :search="search"
        >
          <template v-slot:item="{ item, index }">
            <tr>
              <td align="center">{{ index + 1 }}</td>
              <td align="center">{{ item.nickname }}</td>
              <td align="center">{{ item.exp }}</td>

              <td v-if="item.no == user.no"></td>
              <td align="center" v-else-if="checkFollow(item.no)">
                <v-btn color="amber lighten-3" small @click="unFollow(item.no)"
                  >언팔로우</v-btn
                >
              </td>
              <td align="center" v-else>
                <v-btn
                  color="deep-purple lighten-4"
                  small
                  @click="goFollow(item.no)"
                  >팔로우</v-btn
                >
              </td>
            </tr>
          </template>
        </v-data-table>
      </v-card>
    </v-container>
  </v-main>
  <!-- </v-app> -->
</template>

<script>
import { mapGetters } from "vuex";

export default {
  name: "UserList",
  data() {
    return {
      search: "",
      headers: [
        { text: "번호", value: "index", align: "center" },
        { text: "닉네임", value: "nickname", align: "center" },
        { text: "경험치", value: "exp", align: "center" },
        { text: "팔로우", value: "actions", align: "center" },
      ],
    };
  },
  computed: {
    ...mapGetters(["users"]),
    ...mapGetters(["user"]),
    ...mapGetters(["followees"]),
  },
  created() {
    this.$store.dispatch("followees", this.user.no);
  },
  methods: {
    checkFollow(no) {
      // 현재 팔로우 여부 체크.
      let check = false;

      for (let i = 0; i < this.followees.length; i++) {
        if (this.followees[i].no == no) {
          check = true;
          break;
        }
      }
      return check;
    },
    goFollow(no) {
      // 팔로우 하기
      if (confirm("팔로우 하시겠습니까?")) {
        let follow = {
          followee: no,
          follower: this.user.no,
        };
        this.$store.dispatch("follow", follow);
      }
    },
    unFollow(no) {
      if (confirm("언팔로우 하시겠습니까?")) {
        let follow = {
          followee: no,
          follower: this.user.no,
        };
        this.$store.dispatch("unfollow", follow);
      }
    },
  },
};
</script>

<style scoped></style>
