<template>
  <div class="home">
    <v-img src="@/assets/kike-vega-F2qh3yjz6Jk-unsplash.jpg" class="full" />
    <v-img src="@/assets/ssafit_2.png" class="logo" />
    <!-- <router-view /> -->
  </div>
</template>

<script>
export default {
  name: "HomeView",
};
</script>

<style>
.full {
  /* min-width: 100%; */
  min-height: 100%;
  left: 0;
  right: 0;
  top: 0;
  bottom: 0;
  margin: auto;
  overflow: hidden;
  position: fixed;
}

.full::-webkit-scrollbar {
  display: none;
}

.logo {
  width: 100%;
  animation: fadein 7s ease 3s;
  -webkit-animation: fadein 7s; /* Safari and Chrome */
}
@keyframes fadein {
  from {
    opacity: 0;
  }
  to {
    opacity: 1;
  }
}

@-webkit-keyframes fadein {
  /* Safari and Chrome */
  from {
    opacity: 0;
  }
  to {
    opacity: 1;
  }
}
</style>
