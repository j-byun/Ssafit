<template>
  <div>
    <div style="font-size: 20px; font-weight: 900">리뷰 작성</div>
    <br />
    <fieldset>
      <v-row justify="center">
        <v-col cols="12">
          <v-text-field
            clearable
            label="리뷰 내용을 작성해주세요."
            id="context"
            cols="50"
            rows="10"
            v-model="context"
            :append-icon="'mdi-send'"
            @click:append="createReview"
            @keyup.enter="createReview"
          ></v-text-field
        ></v-col>
      </v-row>
    </fieldset>
  </div>
</template>

<script>
// 리뷰 : 제목 없고 내용만 존재함
// 영상 넘버와 작성자 유저 넘버 존재

export default {
  name: "VideoReviewCreate",
  data() {
    return {
      writerNo: "",
      videoNo: "",
      context: "",
    };
  },

  methods: {
    createReview() {
      if (!this.$store.state.user) {
        alert("로그인 한 사용자만 리뷰를 등록할 수 있습니다.");
        return;
      }
      if (this.context === "") {
        alert("리뷰 내용을 입력해주세요.");
        return;
      }
      let review = {
        writerNo: this.$store.state.user.no,
        videoNo: this.$store.state.video.no,
        context: this.context,
      };
      if (confirm("리뷰를 등록하시겠습니까?")) {
        this.$store.dispatch("createReview", review);
        this.$store.dispatch("plusExp", review.writerNo);
      }
    },
  },
};
</script>

<style lang="scss" scoped></style>
