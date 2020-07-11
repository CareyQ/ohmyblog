<template>
  <div class="footer">
    <div class="icons" v-if="social && social.icons">
      <a
        :href="item.link"
        :title="item.title"
        :class="['iconfont', item.iconClass]"
        v-for="(item, index) in social.icons"
        :key="index"
        target="_blank"
      >
      </a>
    </div>

    <div class="item"><a v-if="footer.ICP" :href="footer.ICP.url">{{footer.ICP.text}}</a></div>

    <!--Vdoing主题遵循MIT协议，完全开源且免费。如果您对主题的修改并不大，希望您保留主题的链接。-->
    <div v-if="footer" class="item">
    Theme by <a href="https://github.com/xugaoyi/vuepress-theme-vdoing" target="_blank" title="本站主题">Vdoing</a> | <span v-html="footer.copyrightInfo"></span>
    </div>

    <div class="item">Copyright © {{ footer.createYear }}-{{ new Date().getFullYear() }} <a :href="author.link">by {{author.name}}</a></div>

  </div>
</template>

<script>
export default {
  computed: {
    social() {
      return this.$themeConfig.social
    },
    author() {
      return this.$themeConfig.author
    },
    footer() {
      return this.$themeConfig.footer
    }
  }
}
</script>

<style lang='stylus'>
// $mobileSidebarWidth = $sidebarWidth * 0.82

.footer
  background: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACMAAAAjCAYAAAAe2bNZAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAABOSURBVFhH7c6xCQAgDAVRR9A6E4hLu4uLiWJ7tSnuQcIvr2TRYsw3/zOGGEOMIcYQY4gxxBhiDDGGGEOMIcYQY4gxxBhiDLkx52W4Gn1tuslCtHJvL54AAAAASUVORK5CYII=") rgb(40, 40, 45);
  padding 2rem 1.5rem 1.5rem 
  text-align center
  color #fff
  box-sizing border-box
  font-size .85rem
  transition all .2s ease
  .item
    margin: 10px 0
  .icons
    margin-bottom 12px
    .iconfont
      padding 0 10px
      font-size 1.3rem
  a
    color inherit
    &:hover
      color $accentColor

@media (min-width: ($MQMobile + 1px))
  .sidebar-open .footer
    width auto
    padding-left ($sidebarWidth + 1.5rem)

@media (min-width 1520px)
  .have-rightmenu .footer
    padding-right ($rightMenuWidth + 1.5rem)

.no-sidebar .footer
  width auto
  padding-left 1.5rem

</style>
