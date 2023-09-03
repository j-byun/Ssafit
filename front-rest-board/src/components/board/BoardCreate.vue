<template>
  <div>
    <h3>게시판 등록</h3>
    <fieldset>
      <legend>등록</legend>
      <label for="title">제목 : </label>
      <input type="text" id="title" v-model="title" /><br />
      <label for="content">내용 : </label>
      <textarea id="content" cols="30" rows="10" v-model="content"></textarea>
      <button @click="createBoard">등록</button>
    </fieldset>
  </div>
</template>

<script>
export default {
  name: "BoardCreate",
  data() {
    return {
      no: "",
      title: "",
      writer: "",
      content: "",
    };
  },
  methods: {
    createBoard() {
      let user = this.$store.state.user;
      const curUser = user.no;

      let board = {
        no: 0,
        title: this.title,
        writer: curUser,
        content: this.content,
      };

      this.$store.dispatch("createBoard", board);
    },
  },
};
</script>

<style></style>
