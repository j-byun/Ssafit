<template>
  <div>
    <div>
      <div class="font-weight-bold">FOLLOWER</div>
      <div v-if="followers">
        <div>팔로워 : {{ followers.length }}명</div>
        <!-- <table>
          <tr>
            <th>닉네임</th>
          </tr>

          <tr v-for="(user, index) in followers" :key="index">
            <th>{{ user.nickname }}</th>
          </tr>
        </table> -->
        <div class="text-left">
          <v-menu offset-y>
            <template v-slot:activator="{ on, attrs }">
              <v-btn
                outlined
                color="indigo accent-1"
                dark
                v-bind="attrs"
                v-on="on"
              >
                FOLLOWER LIST
              </v-btn>
            </template>
            <v-list>
              <v-list-item v-for="(user, index) in followers" :key="index">
                <v-list-item-title>{{ user.nickname }}</v-list-item-title>
              </v-list-item>
            </v-list>
          </v-menu>
        </div>
      </div>
      <div v-else>나를 팔로우 하고있는 사용자가 없습니다.</div>
    </div>
  </div>
</template>

<script>
import { mapGetters } from "vuex";

export default {
  name: "UserFollower",
  computed: {
    ...mapGetters(["followers"]),
  },
};
</script>

<style scoped>
tr {
  display: block;
  float: left;
}
th,
td {
  display: block;
}
</style>
