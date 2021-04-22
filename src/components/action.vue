<template>

<b-button
  variant="primary"
  @click="onClick"
  v-if="!isActivatorSlot"
>
  {{humanName}}
</b-button>

<component :is="$vrfParent" v-bind="vrfProps" v-else>
  <template v-slot:activator="props">
    <slot name="activator" v-bind="props" />
  </template>
</component>

</template>

<script lang="coffee">


export default {
  vrfParent: 'action'

  props: {
    color: String
  }

  computed:
    vrfProps: ->
      {
        name: @name
        params: @params
        data: @data
        method: @method
      }
    isActivatorSlot: ->
      @$scopedSlots.activator?

    loading: ->
      @$actionPendings[@name]

}

</script>

