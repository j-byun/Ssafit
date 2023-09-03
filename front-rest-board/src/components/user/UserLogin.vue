<template>
  <!-- <v-app id="inspire"> -->
  <v-main>
    <v-container>
      <v-layout wrap>
        <v-flex sm12 md6 offset-md3>
          <v-card elevation="4" light tag="section">
            <v-card-title>
              <h3>로그인</h3>
            </v-card-title>
            <v-card-text>
              <v-form>
                <v-text-field
                  v-model="user.id"
                  label="ID"
                  type="text"
                  @keyup.enter="login"></v-text-field>

                <v-text-field
                  v-model="user.password"
                  label="PASSWORD"
                  type="password"
                  @keyup.enter="login"></v-text-field>
              </v-form>
            </v-card-text>

            <v-card-actions :class="{ 'pa-3': $vuetify.breakpoint.smAndUp }">
              <v-spacer></v-spacer>
              <v-btn
                @click="login"
                color="cyan lighten-4"
                :large="$vuetify.breakpoint.smAndUp">
                LOGIN
              </v-btn>
            </v-card-actions>
          </v-card>
        </v-flex>
      </v-layout>
    </v-container>
  </v-main>
  <!-- </v-app> -->
</template>

<script>
export default {
  name: "UserLogin",
  data() {
    return {
      user: {
        id: "",
        password: "",
      },
    };
  },
  methods: {
    login() {
      let user = {
        id: this.user.id,
        password: this.user.password,
      };
      this.$store.dispatch("userLogin", user);
    },
  },
  created() {
    this.$store.dispatch("getUsers");
  },
};
</script>

<style></style>
