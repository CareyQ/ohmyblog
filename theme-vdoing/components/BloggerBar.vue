<template>
  <aside class="blogger-wrapper card-box">
    <div class="avatar">
      <img :src="blogger.avatar" alt="头像">
    </div>
    <div class="blogger">
      <span class="name">
        {{blogger.name}}
      </span>
      <span class="slogan">
        {{blogger.slogan}}
      </span>
    </div>
    <div class="icons" v-if="social">
      <a
        v-for="(item, index) in social.icons"
        :key="index"
        :href="item.link"
        :title="item.title"
        :class="['iconfont', item.iconClass]"
        :style="{width: 100/social.icons.length + '%'}"
        target="_blank"
      />
    </div>
  </aside>
</template>

<script>
export default {
  computed: {
    blogger() {
      return this.$themeConfig.blogger
    },
    social() {
      return this.$themeConfig.social
    }
  }
}
</script>

<style lang='stylus'>
.blogger-wrapper
  text-align:center
  height auto
  display inline-table
  .avatar
    height: 128px
    width: 128px
    display: inline-block
    vertical-align: top
    border-radius: 70px
    transition: all .3s

    &:hover
      -moz-transform: rotate(540deg)
      -o-transform: rotate(540deg)
      -webkit-transform: rotate(540deg)
      transform: rotate(540deg)

    img
      width 100%
      height 100%
      border-radius 50%
  .blogger
    margin 12px
    .name
      font-size 1.4rem
      display: block
      margin-bottom 15px
    .slogan
      color var(--textColor)
  .icons
    height 40px
    line-height 40px
    a
      font-size 20px
      width 33%
      color var(--textColor)
      display block
      float left
      text-align center
      opacity .8
      &:hover
        color $accentColor
</style>
