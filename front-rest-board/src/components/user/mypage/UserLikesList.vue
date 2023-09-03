<template>
  <div>
    <div v-if="likes">
      <!-- <div class="ml-3 mt-8">
        {{ user.nickname }}님이 좋아하는 {{ likes.length }}개의 영상들을
        보여드릴게요!
      </div> -->
      <br />

      <!-- <v-row> -->
      <!-- <v-container v-if="likes.length > 1">
        <v-row>
          <v-col cols="6">
            <v-card style="height: 340px">
              <v-img :src="src1" />
              <v-card-text> {{ likes[likes.length - 1].title }}</v-card-text>
              <v-card-actions>
                <v-btn
                  text
                  color="indigo"
                  @click="
                    $router.push('/video/detail/${likes[likes.length - 1].no}`')
                  ">
                  바로가기
                </v-btn>
              </v-card-actions>
            </v-card>
          </v-col>
          <v-col cols="6">
            <v-card style="height: 340px">
              <v-img :src="src2" />
              <v-card-text> {{ likes[likes.length - 2].title }}</v-card-text>
              <v-card-actions>
                <v-btn
                  text
                  color="indigo"
                  @click="
                    $router.push('/video/detail/${likes[likes.length - 2].no}`')
                  ">
                  바로가기
                </v-btn>
              </v-card-actions>
            </v-card>
          </v-col>
        </v-row>
      </v-container>
      <v-container v-else>
        <v-row>
          <v-col cols="6">
            <v-card style="height: 340px">
              <v-img :src="src1" />
              <v-card-text> {{ likes[likes.length - 1].title }}</v-card-text>
              <v-card-actions>
                <v-btn
                  text
                  color="indigo"
                  @click="
                    $router.push('/video/detail/${likes[likes.length - 1].no}`')
                  ">
                  바로가기
                </v-btn>
              </v-card-actions>
            </v-card>
          </v-col>
        </v-row>
      </v-container> -->
      <v-sheet height="412" rounded="lg" class="elevation-3">
        <div class="px-5 pt-3">
          {{ user.nickname }}님이 좋아하는 {{ likes.length }}개의 영상들을
          보여드릴게요!
        </div>
        <v-slide-group v-model="model" show-arrows>
          <v-slide-group-item v-for="(item, index) in likes" :key="index">
            <!-- <v-col cols="6"> -->
            <v-card class="mx-6 my-8" max-width="374">
              <v-img :src="src(item.id)" />
              <v-card-text> {{ item.title }}</v-card-text>
              <v-card-actions>
                <v-btn text color="indigo" @click="goToVideo(item.no)">
                  바로가기
                </v-btn>
              </v-card-actions>
            </v-card>
            <!-- </v-col> -->
          </v-slide-group-item>
        </v-slide-group>
      </v-sheet>
      <!-- </v-row> -->
    </div>
    <div v-else>
      <v-sheet height="412" rounded="lg" class="elevation-3">
        {{ user.nickname }}님은 아직 좋아요를 누른 영상이 없습니다!</v-sheet
      >
    </div>
    <!-- <ol>
        <li v-for="(like, index) in likes" :key="index">
          <span>{{ like.title }}</span>
        </li>
      </ol> -->
  </div>
</template>

<script>
import { mapGetters } from "vuex";

export default {
  name: "UserLikesList",
  data: () => ({
    model: null,
  }),
  methods: {
    goToVideo(no) {
      this.$router.push(`/video/detail/${no}`);
    },
    src(id) {
      return `http://img.youtube.com/vi/${id}/maxresdefault.jpg`;
    },
  },
  computed: {
    ...mapGetters(["user"]),
    ...mapGetters(["likes"]),
    src1() {
      return `https://img.youtube.com/vi/${
        this.likes[this.likes.length - 1].id
      }/maxresdefault.jpg`;
    },
    src2() {
      return `http://img.youtube.com/vi/${
        this.likes[this.likes.length - 2].id
      }/maxresdefault.jpg`;
    },
  },
  created() {
    this.$store.dispatch("getLikes", this.user.no);
  },
};
</script>

<style>
.v-slide-group__content {
  justify-content: center;
}
</style>
