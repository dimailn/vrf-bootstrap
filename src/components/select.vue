<template>


<b-form-select
  :name="name"
  :options="$_options"
  v-model="$value"
  :value-field="idKey"
  :text-field="titleKey"
  :label="humanName"
  :error-messages="$errors[name] && $errors[name][0]"
  :disabled="$disabled"
  :multiple="multiple"
  :clearable="clearable"
  @click:clear="onClear"
  v-on="listeners"
  :tabindex="tabindex"
  no-data-text="Нет данных"
/>


</template>

<script lang="coffee">

export default {
  vrfParent: 'select'

  methods:
    onClear: ->
      @$nextTick =>
        @value = null

}

</script>
