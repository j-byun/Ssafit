<template>
  <div>
    <div style="font-size: 20px; font-weight: 900">리뷰 목록</div>
    <br />
    <div v-if="reviews">
      <div>등록된 리뷰 : {{ reviews.length }}개</div>
      <v-data-table
        :headers="headers"
        :items="reviews"
        :items-per-page="5"
        class="elevation-1"
      >
        <template v-slot:item="{ item, index }">
          <tr>
            <td>{{ index + 1 }}</td>
            <td>{{ getNickname(item.writerNo) }}</td>
            <td>{{ item.context }}</td>
            <td>{{ item.regDate }}</td>
            <td v-if="item.writerNo == user.no">
              <v-btn
                color="deep-orange lighten-4"
                small
                @click="deleteReview(item)"
                >삭제</v-btn
              >
            </td>
            <td v-else></td>
          </tr>
        </template>
      </v-data-table>
    </div>
    <div v-else>등록된 리뷰가 없습니다.</div>
    <br /><br />
    <video-review-create></video-review-create>
  </div>
</template>

<script>
import VideoReviewCreate from "@/components/video/review/include/VideoReviewCreate.vue";

import { mapGetters } from "vuex";
export default {
  name: "VideoReviewList",
  components: {
    VideoReviewCreate,
  },
  data() {
    return {
      headers: [
        { text: "번호", value: "index" },
        { text: "작성자", value: "writer" },
        { text: "댓글 내용", value: "context" },
        { text: "작성 시간", value: "regDate" },
        { text: "", value: "delete" },
      ],
    };
  },
  computed: {
    ...mapGetters(["user"]),
    ...mapGetters(["users"]),
    ...mapGetters(["reviews"]),
  },
  methods: {
    getNickname(writerNo) {
      for (let i = 0; i < this.users.length; i++) {
        if (this.users[i].no === writerNo) {
          return this.users[i].nickname;
        }
      }
    },
    deleteReview(review) {
      if (this.user == null || this.user.no !== review.writerNo) {
        alert("본인이 작성한 리뷰만 삭제할 수 있습니다.");
        return;
      }
      if (confirm("리뷰를 삭제하시겠습니까?")) {
        this.$store.dispatch("deleteReview", review);
      }
    },
  },
};
</script>

<style lang="scss" scoped></style>
