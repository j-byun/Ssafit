import Vue from "vue";
import Vuex from "vuex";
import axios from "axios";
import router from "@/router";
import createPersistedState from "vuex-persistedstate";

Vue.use(Vuex);

// 사용할 주소 미리 저장하기
const REST_API = "http://localhost:9999";

export default new Vuex.Store({
  plugins: [createPersistedState()],
  state: {
    boards: [],
    // 전체 게시글
    board: null,
    // 단일 게시글
    myBoards: [],
    // 내가 작성한 게시글

    reviews: [],
    // 특정 영상에 해당하는 리뷰들
    review: null,

    message: null,
    // 단일 메세지
    messagesTo: [],
    messagesFrom: [],
    // 나에게 온 메세지들
    receiver: null,

    user: null,
    // 로그인 된 사용자
    users: [],
    // 전체 사용자

    followees: [],
    // 현재 사용자가 팔로우 하는 사용자 목록
    followers: [],
    // 현재 사용자를 팔로우 하는 사용자 목록

    getUser: null,
    // 번호를 통해 조회한 사용자 상세

    videos: [],
    // 전체 영상 목록
    video: null,
    // 단일 영상
    likes: [],
    // 좋아요 목록
  },
  getters: {
    video: function (state) {
      return state.video;
    },
    reviews: function (state) {
      return state.reviews;
    },
    likes: function (state) {
      return state.likes;
    },
    user: function (state) {
      return state.user;
    },
    users: function (state) {
      return state.users;
    },
    followees: function (state) {
      return state.followees;
    },
    followers: function (state) {
      return state.followers;
    },
    messagesTo: function (state) {
      return state.messagesTo;
    },
    messagesFrom: function (state) {
      return state.messagesFrom;
    },
    message: function (state) {
      return state.message;
    },
  },
  mutations: {
    // * 사용자 관련 mutations 항목
    SIGNUP(state, user) {
      state.users.push(user);
    },

    LOGIN(state, user) {
      state.user = user;
    },

    LOGOUT(state) {
      state.user = null;
      state.reviews = [];
      state.messagesTo = [];
      state.messagesFrom = [];
      state.followees = [];
      state.followers = [];
      state.likes = [];
    },

    GET_USER(state, user) {
      state.getUser = user;
    },

    GET_USERS(state, users) {
      state.users = users;
    },

    UPDATE_USER(state, updateUser) {
      state.user = updateUser;
    },

    DELETE_USER(state) {
      state.user = null;
    },

    FOLLOWEES(state, followees) {
      state.followees = followees;
    },

    FOLLOWERS(state, followers) {
      state.followers = followers;
    },

    // * 게시판 관련 mutations 항목

    CREATE_BOARD(state, board) {
      state.boards.push(board);
    },

    GET_BOARDS(state, boards) {
      state.boards = boards;
    },
    GET_BOARD(state, board) {
      state.board = board;
    },
    UPDATE_BOARD(state, board) {
      state.board = board;
    },

    MY_BOARD(state, myBoards) {
      state.myBoards = myBoards;
    },

    // * 영상 관련 mutations 항목
    GET_VIDEOS(state, videos) {
      state.videos = videos;
    },

    GET_VIDEO(state, video) {
      // console.log(video);
      state.video = video;
    },

    GET_LIKES(state, likes) {
      state.likes = likes;
    },

    PLUS_LIKECNT(state) {
      state.video.likeCnt += 1;
    },

    MINUS_LIKECNT(state) {
      state.video.likeCnt -= 1;
    },

    // * 메세지 관련 mutations 항목
    GO_MESSAGE(state, no) {
      state.receiver = no;
    },

    CREATE_MESSAGE(state) {
      state.receiver = null;
    },

    GET_MESSAGES_FROM_ME(state, messages) {
      state.messagesFrom = messages;
    },
    GET_MESSAGES_TO_ME(state, messages) {
      state.messagesTo = messages;
    },

    GET_MESSAGE(state, message) {
      state.message = message;
    },

    // * 리뷰 관련 mutations 항목
    GET_REVIEWS(state, reviews) {
      state.reviews = reviews;
    },

    PLUS_EXP(state, params) {
      state.user.exp += params.exp;
    },
  },
  actions: {
    // * 사용자 관련 action 항목

    // # 전체 사용자 목록 조회 :: /userapi/user :: GET
    // # 회원가입 :: /userapi/user :: POST
    // # 회원정보 수정 :: /userapi/user :: PUT
    // # 사용자 상세 정보 조회 :: /userapi/user/{no} :: GET
    // # 사용자 경험치 획득 :: /userapi/user/{no} :: PUT
    // 회원 탈퇴 :: /userapi/user/{no} :: DELETE
    // # 팔로우 사용자 목록 조회 :: /userapi/user/follow/{userNo} :: GET

    // 회원가입 :: /userapi/user :: POST
    signup({ commit }, user) {
      // console.log(user.name);
      const API_URL = `${REST_API}/userapi/user`;
      axios({
        url: API_URL,
        method: "POST",
        data: user,
      })
        .then(() => {
          commit("SIGNUP", user);
          alert("회원가입 완료");
          router.push({ name: "userLogin" });
        })
        .catch((err) => {
          console.log(err);
        });
    },

    // 회원정보 수정 :: /userapi/user :: PUT
    updateUser({ commit }, updateUser) {
      const API_URL = `${REST_API}/userapi/user`;
      axios({
        url: API_URL,
        method: "PUT",
        data: updateUser,
      })
        .then(() => {
          commit("UPDATE_USER", updateUser);
          alert("수정이 완료되었습니다.");
          router.push({ name: "userMyPage" });
        })
        .catch((err) => {
          console.log(err);
        });
    },

    // 회원 탈퇴 :: /userapi/user/{no} :: DELETE
    deleteUser({ commit }, no) {
      const API_URL = `${REST_API}/userapi/user/${no}`;
      axios({
        url: API_URL,
        method: "DELETE",
      })
        .then(() => {
          commit("DELETE_USER", no);
          alert(
            "탈퇴가 완료되었습니다.\n그동안 SSAFIT 서비스를 이용해주셔서 감사합니다."
          );
          router.push("/");
        })
        .catch((err) => {
          console.log(err);
        });
    },

    // 사용자 경험치 획득 :: /userapi/user/{no} :: PUT
    plusExp({ commit }, no) {
      const API_URL = `${REST_API}/userapi/user/${no}`;
      const params = { exp: 3 };
      axios({
        url: API_URL,
        method: "PUT",
        params,
      }).then(() => {
        commit("PLUS_EXP", params);
      });
    },

    // 사용자 상세 정보 조회 :: /userapi/user/{no} :: GET

    // ### 로그인
    userLogin(context, user) {
      let matched = false;
      let loginUser = null;
      for (let i = 0; i < context.state.users.length; i++) {
        if (
          user.id === context.state.users[i].id &&
          user.password === context.state.users[i].password
        ) {
          matched = true;
          loginUser = context.state.users[i];
          break;
        }
      }
      if (matched) {
        context.commit("LOGIN", loginUser);
        alert("로그인 성공");
        router.push("/");
      } else {
        alert("로그인 실패 : 아이디와 비밀번호를 확인해주세요.");
      }
    },
    // ### 로그아웃
    userLogout({ commit }) {
      commit("LOGOUT");
      alert("로그아웃 완료");
      router.push("/");
    },

    // 전체 사용자 목록 조회 :: /userapi/user :: GET
    getUsers({ commit }) {
      const API_URL = `${REST_API}/userapi/user`;
      axios({
        url: API_URL,
        method: "GET",
      }).then((res) => {
        commit("GET_USERS", res.data);
      });
    },

    // ### 번호로 사용자 정보 가져오기
    // 사용자 상세 정보 조회 :: /userapi/user/{no} :: GET
    getUser({ commit }, no) {
      const API_URL = `${REST_API}/userapi/user/${no}`;
      axios({
        url: API_URL,
        method: "GET",
      }).then((res) => {
        commit("GET_USER", res.data);
      });
    },

    // 팔로우 사용자 목록 조회 :: /userapi/user/follow/{userNo} :: GET
    followees({ commit }, no) {
      const API_URL = `${REST_API}/userapi/user/follow/${no}`;
      const params = { mode: "follower" };
      axios({
        url: API_URL,
        method: "GET",
        params,
      }).then((res) => {
        commit("FOLLOWEES", res.data);
      });
    },
    followers({ commit }, no) {
      const API_URL = `${REST_API}/userapi/user/follow/${no}`;
      const params = { mode: "followee" };
      axios({
        url: API_URL,
        method: "GET",
        params,
      }).then((res) => {
        commit("FOLLOWERS", res.data);
      });
    },

    // ### 팔로우 실행!
    follow({ commit }, follow) {
      const API_URL = `${REST_API}/followapi/follow`;
      axios({
        url: API_URL,
        method: "POST",
        data: follow,
      })
        .then((res) => {
          commit;
          if (res.data === "success") {
            alert("팔로우 완료!");
          } else {
            alert("팔로우에 실패했습니다.");
          }
          router.push({ name: "userList" });
        })
        .catch((err) => {
          console.log(err);
        });
    },

    // ### 언팔로우 실행!
    unfollow({ commit }, follow) {
      const API_URL = `${REST_API}/followapi/follow`;
      axios({
        url: API_URL,
        method: "DELETE",
        data: follow,
      })
        .then((res) => {
          commit;
          if (res.data === "success") {
            alert("팔로우를 취소했습니다.");
          } else {
            alert("언팔로우에 실패했습니다.");
          }
          router.push({ name: "userList" });
        })
        .catch((err) => {
          console.log(err);
        });
    },

    // * 게시판 관련 action 항목

    // # 전체 게시글 목록 조회 :: /boardapi/board :: GET
    // # 게시글 등록하기 :: /boardapi/board :: POST
    // # 게시글 상세정보 조회 :: /boardapi/board/{no} :: GET
    // # 게시글 수정하기 :: /boardapi/board/{no} :: PUT
    // # 게시글 삭제하기 :: /boardapi/board/{no} :: DELETE
    // # 내가 작성한 게시글 목록 :: /boardapi/board/myboard/{writerNo} :: GET

    // 게시글 등록하기 :: /boardapi/board :: POST
    createBoard({ commit }, board) {
      // 게시글을 등록하려면?
      // localhost:9999/boardapi 에 POST 요청을 했어야 했다
      const API_URL = `${REST_API}/boardapi/board`;
      axios({
        url: API_URL,
        method: "POST",
        params: board,
      })
        // commit();
        // 그럼 이제 저기서 제목쓰니내용 등록하면?
        .then(() => {
          commit("CREATE_BOARD", board);
          // 여기서 커밋하면 mutation으로 보내는 거니까
          router.push(`${REST_API}/boardapi/board`);
        })
        // 에러 발생시 캐치
        .catch((err) => {
          console.log(err);
        });
    },

    // 게시글 상세정보 조회 :: /boardapi/board/{no} :: GET
    getBoard({ commit }, id) {
      // 인자로 id가 들어오니까
      const API_URL = `${REST_API}/boardapi/board/${id}`;
      axios({
        url: API_URL,
        method: "GET",
      })
        .then((res) => {
          commit("GET_BOARD", res.data);
        })
        .catch((err) => {
          console.log(err);
        });
    },

    // 전체 게시글 목록 조회 :: /boardapi/board :: GET
    getBoards({ commit }) {
      // 딱히 인자로 들어올 건 없음
      const API_URL = `${REST_API}/boardapi/board`;
      axios({
        url: API_URL,
        method: "GET",
      })
        .then((res) => {
          commit("GET_BOARDS", res.data);
          // router.push({ name: "boardList" });
        })
        .catch((err) => {
          console.log(err);
        });
    },

    // 게시글 수정하기 :: /boardapi/board/{no} :: PUT
    updateBoard({ commit }, board) {
      const API_URL = `${REST_API}/boardapi/board`;
      axios({
        url: API_URL,
        method: "PUT",
        params: board,
      }).then(() => {
        commit("UPDATE_BOARD", board);
        router.push({ name: "boardDetail", params: { id: board.id } });
      });
    },

    // 게시글 삭제하기 :: /boardapi/board/{no} :: DELETE
    deleteBoard({ commit }, id) {
      const API_URL = `${REST_API}/boardapi/board/${id}`;
      axios({
        url: API_URL,
        method: "DELETE",
      })
        .then(() => {
          commit;
          router.push({ name: "boardList" });
        })
        .catch((err) => {
          console.log(err);
        });
    },

    // 내가 작성한 게시글 목록 :: /boardapi/board/myboard/{writerNo} :: GET
    myBoard({ commit }, no) {
      const API_URL = `${REST_API}/boardapi/board/myboard/${no}`;
      axios({
        url: API_URL,
        method: "GET",
      })
        .then((res) => {
          commit("MY_BOARD", res.data);
          router.push({ name: "myBoardList" });
        })
        .catch((err) => {
          console.log(err);
        });
    },

    // * 메세지 관련 action 항목
    // # 메세지 전송하기 :: /messageapi/message :: POST
    // # 메세지 상세정보 조회 :: /messageapi/message/{no} :: GET
    // # 나에게 온/ 내가 보낸 메세지 리스트 조회 :: /messageapi/message/mymessage/{userNo} :: GET
    // # 메세지 읽음 표시하기 :: localhost:9999/messageapi/message/{no} ::PUT

    // ### 메세지 전송 대상자 등록 용도, createMessage 이전 실행
    goMessage({ commit }, no) {
      commit("GO_MESSAGE", no);
      router.push({ name: "messageCreate" });
    },

    // 메세지 전송하기 :: /messageapi/message :: POST
    createMessage({ commit }, message) {
      const API_URL = `${REST_API}/messageapi/message`;
      axios({
        url: API_URL,
        method: "POST",
        data: message,
      })
        .then((res) => {
          if (res.data === "success") {
            alert("메세지를 전송했습니다.");
            commit;
            router.push({ name: "userMyPage" });
          } else {
            alert("메세지 전송을 실패했습니다.");
          }
        })
        .catch((err) => {
          console.log(err);
        });
    },
    // 나에게 온/ 내가 보낸 메세지 리스트 조회 :: /messageapi/message/mymessage/{userNo} :: GET
    getMessagesFromMe({ commit }, user) {
      const API_URL = `${REST_API}/messageapi/message/mymessage/${user.no}`;
      const params = { mode: "from" };
      axios({
        url: API_URL,
        method: "GET",
        params,
      })
        .then((res) => {
          commit("GET_MESSAGES_FROM_ME", res.data);
        })
        .catch((err) => {
          console.log(err);
        });
    },
    getMessagesToMe({ commit }, user) {
      const API_URL = `${REST_API}/messageapi/message/mymessage/${user.no}`;
      const params = { mode: "to" };
      axios({
        url: API_URL,
        method: "GET",
        params,
      })
        .then((res) => {
          commit("GET_MESSAGES_TO_ME", res.data);
        })
        .catch((err) => {
          console.log(err);
        });
    },

    // 메세지 상세정보 조회 :: /messageapi/message/{no} :: GET
    getMessage({ commit }, no) {
      const API_URL = `${REST_API}/messageapi/message/${no}`;
      axios({
        url: API_URL,
        method: "GET",
      })
        .then((res) => {
          commit("GET_MESSAGE", res.data);
        })
        .catch((err) => {
          console.log(err);
        });
    },

    // # 메세지 읽음 표시하기 :: localhost:9999/messageapi/message/{no} ::PUT
    readMessage({ commit }, no) {
      const API_URL = `${REST_API}/messageapi/message/${no}`;
      axios({
        url: API_URL,
        method: "PUT",
      })
        .then(() => {
          commit;
        })
        .catch((err) => {
          console.log(err);
        });
    },

    // * 영상 관련 action 항목
    // # 전체 영상 목록 조회 :: /videoapi/video :: GET
    // # 비디오 상세 정보 조회 :: /videoapi/video/{no} :: GET
    // 좋아요 DB에 추가/삭제 :: /likeapi/like :: POST/DELETE
    // 좋아요 수 증가/ 감소 :: /videoapi/video/{no} :: PUT
    // 사용자가 좋아요 한 영상 리스트 조회 :: /videoapi/video/likelist/{userNo} :: GET

    // 전체 영상 목록 조회 :: /videoapi/video :: GET
    getVideos({ commit }) {
      const API_URL = `${REST_API}/videoapi/video`;
      axios({
        url: API_URL,
        method: "GET",
      })
        .then((res) => {
          commit("GET_VIDEOS", res.data);
        })
        .catch((err) => {
          console.log(err);
        });
    },

    // 비디오 상세 정보 조회 :: /videoapi/video/{no} :: GET
    getVideo({ commit }, no) {
      const API_URL = `${REST_API}/videoapi/video/${no}`;
      axios({
        url: API_URL,
        method: "GET",
      })
        .then((res) => {
          commit("GET_VIDEO", res.data);
        })
        .catch((err) => {
          console.log(err);
        });
    },

    // 좋아요 DB에 추가/삭제 :: /likeapi/like :: POST/DELETE
    addLikes({ commit }, like) {
      const API_URL = `${REST_API}/likeapi/like`;
      axios({
        url: API_URL,
        method: "POST",
        data: like,
      })
        .then(() => {
          commit;
        })
        .catch((err) => {
          console.log(err);
        });
    },

    removeLikes({ commit }, like) {
      const API_URL = `${REST_API}/likeapi/like`;
      axios({
        url: API_URL,
        method: "DELETE",
        data: like,
      })
        .then(() => {
          commit;
        })
        .catch((err) => {
          console.log(err);
        });
    },

    // 좋아요 수 증가/ 감소 :: /videoapi/video/{no} :: PUT
    plusLikeCnt({ commit }, no) {
      const API_URL = `${REST_API}/videoapi/video/${no}`;
      let params = { mode: "plus" };
      axios({
        url: API_URL,
        method: "PUT",
        params,
      })
        .then(() => {
          commit("PLUS_LIKECNT");
          alert("좋아요 한 영상에 추가되었습니다.");
          router.push(`/video/detail/${no}`);
        })
        .catch((err) => {
          console.log(err);
        });
    },

    minusLikeCnt({ commit }, no) {
      const API_URL = `${REST_API}/videoapi/video/${no}`;
      let params = { mode: "minus" };
      axios({
        url: API_URL,
        method: "PUT",
        params,
      })
        .then(() => {
          commit("MINUS_LIKECNT", no);
          alert("좋아요가 취소되었습니다.");
          router.push(`/video/detail/${no}`);
        })
        .catch((err) => {
          console.log(err);
        });
    },

    // 사용자가 좋아요 한 영상 리스트 조회 :: /videoapi/video/likelist/{userNo} :: GET
    getLikes({ commit }, userNo) {
      const API_URL = `${REST_API}/videoapi/video/likelist/${userNo}`;
      axios({
        url: API_URL,
        method: "GET",
      })
        .then((res) => {
          commit("GET_LIKES", res.data);
        })
        .catch((err) => {
          console.log(err);
        });
    },

    // * 리뷰 관련 action 항목
    // # 리뷰 등록하기 :: /reviewapi/review :: POST
    // 리뷰 수정하기 :: /reviewapi/review/{no} :: PUT
    // 리뷰 삭제하기 :: /reviewapi/review/{no} :: DELETE
    // # 영상에 등록된 전체 리뷰 리스트 가져오기 :: /reviewapi/review/{videoNo} :: GET

    // 리뷰 등록하기 :: /reviewapi/review :: POST
    createReview({ commit }, review) {
      const API_URL = `${REST_API}/reviewapi/review`;
      axios({
        url: API_URL,
        method: "POST",
        data: review,
      })
        .then((res) => {
          commit;
          if (res.data === "success") {
            alert("리뷰가 정상적으로 등록되었습니다.");
          } else {
            alert("리뷰가 정상적으로 등록되지 않았습니다.");
          }
          router.push(`/video/detail/${review.videoNo}`);
        })
        .catch((err) => {
          console.log(err);
        });
    },

    // 리뷰 삭제하기 :: /reviewapi/review/{no} :: DELETE
    deleteReview({ commit }, review) {
      const API_URL = `${REST_API}/reviewapi/review/${review.no}`;
      axios({
        url: API_URL,
        method: "DELETE",
      })
        .then((res) => {
          commit;
          if (res.data === "success") {
            alert("리뷰가 삭제되었습니다.");
          } else {
            alert("리뷰 삭제에 실패했습니다.");
          }
          router.push(`/video/detail/${review.videoNo}`);
        })
        .catch((err) => {
          console.log(err);
        });
    },

    // 영상에 등록된 전체 리뷰 리스트 가져오기 :: /reviewapi/review/{videoNo} :: GET
    getReviews({ commit }, no) {
      // 조회된 비디오에 해당하는 리뷰 목록 모두 가져오기
      const API_URL = `${REST_API}/reviewapi/review/${no}`;
      axios({
        url: API_URL,
        method: "GET",
      })
        .then((res) => {
          commit("GET_REVIEWS", res.data);
        })
        .catch((err) => {
          console.log(err);
        });
    },
  },
  modules: {},
});
