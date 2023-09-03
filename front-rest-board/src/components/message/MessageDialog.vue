<template>
  <v-dialog v-model="dialog" width="500">
    <template v-slot:activator="{ on, attrs }">
      <v-btn v-bind="attrs" v-on="on">
        {{ message.title }}
      </v-btn>
    </template>

    <v-card>
      <v-card-title class="text grey lighten-2">
        <div v-if="user.no === message.userFrom">
          To. {{ getNickname(message.userTo) }}
        </div>
        <div v-else>
          From. {{ getNickname(message.userFrom) }}
        </div></v-card-title
      >

      <v-card-text class="ma-3">
        <div>제목 : {{ message.title }}</div>
        <div>내용 : {{ message.context }}</div>
        <br />
        <div>전달 시간 : {{ message.sendDate }}</div>
      </v-card-text>

      <!-- <v-divider></v-divider> -->

      <v-card-actions>
        <v-spacer></v-spacer>
        <v-btn color="primary" text @click="dialog = false"> 닫기 </v-btn>
      </v-card-actions>
    </v-card>
  </v-dialog>
</template>

<script>
import { mapGetters } from "vuex";
export default {
  props: ["message", "user"],
  data() {
    return {
      dialog: false,
    };
  },
  computed: {
    ...mapGetters(["messagesFrom"]),
    ...mapGetters(["messagesTo"]),
    ...mapGetters(["user"]),
    ...mapGetters(["users"]),
  },
  methods: {
    getNickname(no) {
      for (let i = 0; i < this.users.length; i++) {
        if (this.users[i].no === no) {
          return this.users[i].nickname;
        }
      }
    },
  },
};
</script>
