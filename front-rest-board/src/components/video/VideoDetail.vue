<template>
  <v-main>
    <v-container>
      <!-- <div style="font-size: 30px; font-weight: 900">영상 상세 정보</div> -->
      <h3>영상 상세 정보</h3>
      <br />
      <v-row>
        <v-col>
          <iframe
            width="560"
            height="315"
            :src="src"
            title="YouTube video player"
            frameborder="0"
            allow="accelerometer; autoplay; clipboard-write; 
    encrypted-media; gyroscope; picture-in-picture"
            allowfullscreen
          >
          </iframe> </v-col
        ><v-col>
          <div style="font-size: large; font-weight: bold">
            {{ video.title }}
          </div>
          <hr />
          <div>{{ video.channel }}</div>
          <br />
          <div>{{ video.description }}</div>
          <br />
          <div>등록일 : {{ video.regDate }}</div>
          <v-row
            ><v-col>
              <div>좋아요 : {{ video.likeCnt }}</div> </v-col
            ><v-col>
              <div v-if="!user"></div>
              <div v-else-if="!isLiked()">
                <v-icon color="#FF1744" @click="like">mdi-heart-outline</v-icon>
              </div>
              <div v-else>
                <v-icon color="#FF1744" @click="dislike">mdi-heart</v-icon>
              </div>
            </v-col>
          </v-row>
        </v-col>
      </v-row>
      <br />
      <video-review-list></video-review-list>
    </v-container>
  </v-main>
</template>

<script>
import VideoReviewList from "@/components/video/review/VideoReviewList.vue";
import { mapGetters } from "vuex";

export default {
  name: "VideoDetail",
  components: {
    VideoReviewList,
  },
  computed: {
    ...mapGetters(["user"]),
    ...mapGetters(["video"]),
    ...mapGetters(["likes"]),
    src() {
      return `https://www.youtube.com/embed/${this.video.id}`;
    },
  },
  methods: {
    isLiked() {
      let flag = false;
      for (let i = 0; i < this.likes.length; i++) {
        if (this.likes[i].no == this.video.no) {
          flag = true;
          break;
        }
      }
      return flag;
    },
    like() {
      let like = { userNo: this.user.no, videoNo: this.video.no };
      this.$store.dispatch("addLikes", like);
      this.$store.dispatch("plusLikeCnt", this.video.no);
    },
    dislike() {
      let like = { userNo: this.user.no, videoNo: this.video.no };
      this.$store.dispatch("removeLikes", like);
      this.$store.dispatch("minusLikeCnt", this.video.no);
    },
  },
  created() {
    const pathName = new URL(document.location).pathname.split("/");
    const no = pathName[pathName.length - 1];
    this.$store.dispatch("getVideo", no);
    this.$store.dispatch("getReviews", no);
    if (this.user) {
      this.$store.dispatch("getLikes", this.user.no);
    }
  },
};
</script>

<style lang="scss" scoped></style>
