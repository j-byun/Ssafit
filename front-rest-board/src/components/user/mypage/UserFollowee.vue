<template>
  <div>
    <div>
      <div class="font-weight-bold">FOLLOWING</div>
      <div v-if="followees">
        <div>팔로잉 : {{ followees.length }}명</div>
        <!-- <v-simple-table>
          <tr>
            <th>닉네임</th>
            <th>메세지</th>
          </tr>

          <tr v-for="(user, index) in followees" :key="index">
            <th>{{ user.nickname }}</th>
            <td>
              <button @click="goMessage(user.no)">DM</button>
            </td>
          </tr>
        </v-simple-table> -->

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
                FOLLOW LIST
              </v-btn>
            </template>
            <v-list>
              <v-list-item link v-for="(user, index) in followees" :key="index">
                <v-list-item-title @click="goMessage(user.no)">
                  <v-icon small>{{ icons.mdiPencilPlus }}</v-icon>
                  {{ user.nickname }}</v-list-item-title
                >
              </v-list-item>
            </v-list>
          </v-menu>
        </div>
      </div>
      <div v-else>팔로우 중인 사용자가 없습니다.</div>
    </div>
  </div>
</template>

<script>
import { mapGetters } from "vuex";
import { mdiPencilPlus } from "@mdi/js";

export default {
  name: "UserFollowee",
  computed: {
    ...mapGetters(["followees"]),
  },
  methods: {
    goMessage(no) {
      this.$store.dispatch("goMessage", no);
    },
  },
  data() {
    return {
      icons: {
        mdiPencilPlus,
      },
    };
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
