<template>
<b-button
  @click="handleSubmit"
  v-if="!$disabled"
  variant="primary"
  v-bind="props"
>
  <b-spinner small type="grow" v-if="$saving"></b-spinner>
  <div :class="{'transparent': $saving || status}" v-show="!$saving && !status">
    <slot>{{humanName}}</slot>
  </div>
  <transition name="fade">
    <b-icon icon="check" class="icon-success" v-if="status === 'success'" />
    <b-icon icon="exclamation-triangle-fill" class="icon-success" v-if="status === 'error'" />
  </transition>
</b-button>
</template>

<script lang="coffee">



export default {
  vrfParent: 'submit'

  data: ->
    status: null
    color: 'primary'

  watch:
    $saving: ->
      if not @$saving
        if @$lastSaveFailed
          @status = 'error'
          @color = 'error'
        else
          @status = 'success'
          @color = 'green'

        setTimeout(
          =>
            @status = null
            setTimeout(
              => @color = 'primary'
              100
            )
          2000
        )

  computed:
    props: ->
      {
        disabled: @$disabled
        class: {'not-clickable': !!@status, 'submit-btn': true}
      }


  methods:
    handleSubmit: ->
      return if @status

      @$submit()

}

</script>

<style lang="css" scoped>
.transparent{
  opacity: 0 !important;
}

.icon-success{
  margin: 0 auto!important;
}

.fade-enter-active{
  transition: opacity 1s;
}

.fade-enter, .fade-leave-active, .fade-leave-to, .fade-leave{
  opacity: 0 !important;
}

.submit-btn{
  color: white !important;
}

.not-clickable:hover {
    cursor: unset !important;
}
</style>
