<template>
  <v-main>
    <v-container>
      <v-row
        ><v-col>
          <h3>보낸 메세지 목록</h3>

          <v-card class="transparent" flat>
            <v-card-title>
              <v-text-field
                v-model="searchMessageFrom"
                append-icon="mdi-magnify"
                label="메세지 제목으로 검색하세요."
                single-line
                hide-details
              ></v-text-field>
            </v-card-title>
            <v-data-table
              :headers="headersFrom"
              :items="messagesFrom"
              :items-per-page="5"
              class="elevation-1"
              :search="searchMessageFrom"
            >
              <template v-slot:item="{ item, index }">
                <tr>
                  <td>{{ index + 1 }}</td>

                  <td>
                    {{ getNickname(item.userTo) }}
                  </td>
                  <td><message-dialog :message="item" :user="user" /></td>
                </tr>
              </template>
            </v-data-table>
          </v-card>
        </v-col>
        <v-col>
          <h3>받은 메세지 목록</h3>
          <!-- <input type="checkbox" id="checkbox" v-model="checked" />
            <label for="checkbox"> 안읽은 메세지만 보기</label> -->

          <v-card class="transparent" flat>
            <v-card-title>
              <v-text-field
                v-model="searchMessageTo"
                append-icon="mdi-magnify"
                label="메세지 제목으로 검색하세요."
                single-line
                hide-details
              ></v-text-field>
            </v-card-title>
            <v-data-table
              :headers="headersTo"
              :items="messagesTo"
              :items-per-page="5"
              class="elevation-1"
              :search="searchMessageTo"
            >
              <template v-slot:item="{ item, index }">
                <tr>
                  <td>{{ index + 1 }}</td>

                  <td>
                    {{ getNickname(item.userFrom) }}
                  </td>
                  <td><message-dialog :message="item" :user="user" /></td>
                </tr>
              </template>
            </v-data-table>
          </v-card>
        </v-col>
      </v-row>
    </v-container>
  </v-main>
</template>

<script>
import { mapGetters } from "vuex";
import MessageDialog from "@/components/message/MessageDialog.vue";

export default {
  name: "MessageList",
  data() {
    return {
      checked: false,
      dialog: false,
      searchMessageFrom: "",
      searchMessageTo: "",
      headersFrom: [
        { text: "번호", value: "index" },
        { text: "받는 사람", value: "to" },
        { text: "제목", value: "title" },
      ],
      headersTo: [
        { text: "번호", value: "index" },
        { text: "받는 사람", value: "to" },
        { text: "제목", value: "title" },
      ],
    };
  },
  components: {
    MessageDialog,
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
  created() {
    this.$store.dispatch("getMessagesFromMe", this.$store.state.user);
    this.$store.dispatch("getMessagesToMe", this.$store.state.user);
  },
};
</script>

<style></style>
