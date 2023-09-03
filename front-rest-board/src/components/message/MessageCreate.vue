<template>
  <!-- <div>
    <h3>메세지 작성</h3>
    <fieldset>
      <div>받는 사람 : {{ getUser.nickname }}</div>
      <label for="title">제목 : </label>
      <input type="text" id="title" v-model="title" /><br />
      <label for="context">내용 : </label>
      <textarea id="context" cols="30" rows="10" v-model="context"></textarea>
      <button @click="createMessage">전송</button>
    </fieldset>
  </div> -->
  <!-- <v-app id="inspire"> -->
  <v-main>
    <v-container>
      <v-layout wrap>
        <v-flex sm12 md6 offset-md3>
          <v-card elevation="4" light tag="section">
            <v-card-title>
              <div>받는 사람 : {{ getUser.nickname }}</div>
            </v-card-title>
            <v-card-text>
              <v-form>
                <v-text-field
                  v-model="title"
                  label="제목"
                  type="text"
                  @keyup.enter="createMessage"
                ></v-text-field>

                <v-text-field
                  v-model="context"
                  label="내용"
                  type="text"
                  @keyup.enter="createMessage"
                ></v-text-field>
              </v-form>
            </v-card-text>

            <v-card-actions :class="{ 'pa-3': $vuetify.breakpoint.smAndUp }">
              <v-spacer></v-spacer>
              <!-- <v-btn color="cyan lighten-4"> -->
              <v-icon link @click="createMessage">{{ icons.mdiPencil }}</v-icon>
              <!-- </v-btn> -->
            </v-card-actions>
          </v-card>
        </v-flex>
      </v-layout>
    </v-container>
  </v-main>
  <!-- </v-app> -->
</template>

<script>
import { mapState } from "vuex";
import { mdiPencil } from "@mdi/js";

export default {
  name: "messageCreate",
  data() {
    return {
      // 보내는 사람, 받는 사람, 제목, 내용
      title: "",
      userFrom: "",
      userTo: "",
      context: "",
      icons: {
        mdiPencil,
      },
    };
  },
  computed: {
    ...mapState(["getUser"]),
  },

  methods: {
    createMessage() {
      // 메세지를 보내자~~~
      console.log("send : " + this.$store.state.user.no);
      console.log("receive : " + this.getUser.no);
      let message = {
        title: this.title,
        userFrom: this.$store.state.user.no,
        userTo: this.getUser.no,
        context: this.context,
      };
      //
      this.$store.dispatch("createMessage", message);
    },
  },
  created() {
    this.$store.dispatch("getUser", this.$store.state.receiver);
  },
};
</script>

<style></style>
