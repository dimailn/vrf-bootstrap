<template>


<b-form-checkbox switch
  :name="name"
  v-model="$value"
  :error-messages="$errors[name] && $errors[name][0]"
  :tabindex="tabindex"
  :disabled="$disabled"
  v-on="$listeners"
>
  {{noLabel ? '' : humanName}}
</b-form-checkbox>


</template>


<script lang="coffee">

export default {
  vrfParent: 'checkbox'
}

</script>
