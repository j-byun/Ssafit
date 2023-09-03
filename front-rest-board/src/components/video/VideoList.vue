<template>
  <v-main>
    <v-container>
      <!-- <div style="font-size: 20px; font-weight: 900">영상 리스트</div> -->
      <h3>영상 리스트</h3>
      <br />
      <div>
        <v-card class="transparent" flat>
          <v-card-title>
            <v-text-field
              v-model="search"
              append-icon="mdi-magnify"
              label="검색어를 입력하세요."
              single-line
              hide-details
            ></v-text-field>
          </v-card-title>
          <v-data-table
            :headers="headers"
            :items="videos"
            :items-per-page="10"
            class="elevation-1 transparent"
            :search="search"
          >
            <template v-slot:item="{ item, index }">
              <tr @click="goVideoDetail(item)">
                <td>{{ index + 1 }}</td>
                <td>
                  <v-card class="ma-3">
                    <v-img :src="getVideoId(item.id)" width="300"
                  /></v-card>
                </td>
                <td>
                  {{ item.title }}
                </td>
                <td>{{ item.channel }}</td>
                <td>{{ item.reviewCnt }}</td>
                <td>{{ item.likeCnt }}</td>
                <td>{{ item.viewCnt }}</td>
              </tr>
            </template>
          </v-data-table>
        </v-card>
      </div>
    </v-container>
  </v-main>
</template>

<script>
// 영상 리스트
import { mapState } from "vuex";

export default {
  name: "VideoList",
  computed: {
    ...mapState(["videos"]),
  },
  data() {
    return {
      search: "",
      headers: [
        { text: "번호", value: "index", width: "10%", align: "center" },
        { text: "썸네일", value: "thumbnails", align: "center" },
        { text: "제목", value: "title", width: "40%", align: "center" },
        { text: "채널", value: "channel", width: "20%", align: "center" },
        { text: "댓글", value: "reviewCnt", width: "10%", align: "center" },
        { text: "좋아요", value: "likeCnt", width: "10%", align: "center" },
        { text: "조회수", value: "viewCnt", width: "10%", align: "center" },
      ],
    };
  },
  created() {
    this.$store.dispatch("getVideos");
  },
  methods: {
    getVideoId(id) {
      return `https://img.youtube.com/vi/${id}/maxresdefault.jpg`;
    },
    goVideoDetail(item) {
      this.$router.push(`/video/detail/${item.no}`);
    },
  },
};
</script>

<style lang="scss" scoped></style>
