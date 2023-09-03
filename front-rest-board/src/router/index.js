import Vue from "vue";
import VueRouter from "vue-router";

import HomeView from "@/views/HomeView.vue";
import BoardView from "@/views/BoardView.vue";
import MessageView from "@/views/MessageView.vue";
import UserView from "@/views/UserView.vue";
import ReviewView from "@/views/ReviewView.vue";
import VideoView from "@/views/VideoView.vue";

import BoardCreate from "@/components/board/BoardCreate.vue";
import BoardList from "@/components/board/BoardList.vue";
import BoardDetail from "@/components/board/BoardDetail.vue";
import BoardUpdate from "@/components/board/BoardUpdate.vue";

import MessageCreate from "@/components/message/MessageCreate.vue";
import MessageList from "@/components/message/MessageList.vue";
import MessageDetail from "@/components/message/MessageDetail.vue";

import UserSignup from "@/components/user/UserSignup.vue";

import UserMyPage from "@/components/user/UserMyPage.vue";
import UserLogin from "@/components/user/UserLogin.vue";
import UserList from "@/components/user/UserList.vue";
import UserUpdate from "@/components/user/UserUpdate.vue";

// router 처리가 아닌 상위 vue에서 components 처리
// import ReviewCreate from "@/components/review/include/ReviewCreate.vue";
// import ReviewList from "@/components/review/ReviewList.vue";
// import VideoReviewList from "@/components/video/review/VideoReviewList.vue";

import VideoDetail from "@/components/video/VideoDetail.vue";
import VideoList from "@/components/video/VideoList.vue";

Vue.use(VueRouter);

const routes = [
  {
    path: "/",
    name: "home",
    component: HomeView,
  },
  {
    path: "/board",
    name: "boardView",
    component: BoardView,
    children: [
      {
        path: "",
        name: "boardList",
        component: BoardList,
      },
      {
        path: "create",
        name: "boardCreate",
        component: BoardCreate,
      },
      {
        path: ":id",
        name: "boardDetail",
        component: BoardDetail,
      },
      {
        path: "update",
        name: "boardUpdate",
        component: BoardUpdate,
      },
    ],
  },
  {
    path: "/video",
    component: VideoView,
    children: [
      {
        path: "",
        name: "videoList",
        component: VideoList,
      },
      {
        path: "detail/:no",
        name: "videoDetail",
        component: VideoDetail,
      },
    ],
  },
  {
    path: "/review",
    component: ReviewView,
  },
  {
    path: "/message",
    component: MessageView,
    children: [
      {
        path: "",
        name: "messageList",
        component: MessageList,
      },
      {
        path: "detail/:no",
        name: "messageDetail",
        component: MessageDetail,
      },
      {
        path: "create",
        name: "messageCreate",
        component: MessageCreate,
      },
    ],
  },
  {
    path: "/user",
    component: UserView,
    children: [
      {
        path: "myPage",
        name: "userMyPage",
        component: UserMyPage,
      },
      {
        path: "",
        name: "userList",
        component: UserList,
      },
      {
        path: "login",
        name: "userLogin",
        component: UserLogin,
      },
      {
        path: "signup",
        name: "userSignup",
        component: UserSignup,
      },
      {
        path: "update",
        name: "userUpdate",
        component: UserUpdate,
      },
    ],
  },
];

const router = new VueRouter({
  mode: "history",
  base: process.env.BASE_URL,
  routes,
});
const originalPush = VueRouter.prototype.push;
VueRouter.prototype.push = function push(location) {
  return originalPush.call(this, location).catch(() => {
    return window.location.reload();
  });
};

export default router;
