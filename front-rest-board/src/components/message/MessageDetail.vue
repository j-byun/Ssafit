<template>
  <div>
    <h3>상세 메세지</h3>
    <div v-if="user.no === message.userFrom">
      받는 사람 : {{ getNickname(message.userTo) }}
    </div>
    <div v-else>보낸 사람 : {{ getNickname(message.userFrom) }}</div>
    <div>{{ message.title }}</div>
    <div>{{ message.context }}</div>
  </div>
</template>

<script>
import { mapState, mapGetters } from "vuex";
export default {
  name: "MessageDetail",
  computed: {
    ...mapState(["message"]),
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
  created() {
    const pathName = new URL(document.location).pathname.split("/");
    const no = pathName[pathName.length - 1];
    this.$store.dispatch("getMessage", no);
    if (this.message.userTo == this.user.no) {
      this.$store.dispatch("readMessage", no);
    }
  },
};
</script>

<style lang="scss" scoped></style>
