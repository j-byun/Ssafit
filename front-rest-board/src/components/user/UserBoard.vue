<template>
  <div>
    <h3>내가 작성한 게시글 목록</h3>
    <div>
      <table>
        <thead>
          <tr>
            <th>번호</th>
            <th>제목</th>
            <th>작성시간</th>
            <th>조회수</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="(board, index) in myBoardList" :key="index">
            <th>{{ index + 1 }}</th>
            <th>{{ board.title }}</th>
            <th>{{ board.title }}</th>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</template>

<script>
export default {
  name: "UserBoard",
  computed: {
    myBoardList() {
      let no = this.$store.state.user.no;
      return this.$store.dispatch("myBoard", no);
    },
  },
};
</script>

<style lang="scss" scoped></style>
