<template>

</template>


<script lang="coffee">

export default {
  vrfParent: 'autocomplete'
  props:
    messages: Array
    clearable: Boolean

  methods:
    onKeydown: (e) ->
      @$emit 'keydown', e
}

</script>
