import Vue from 'vue'
import App from './App'
import VrfBootstrap from '../src/index'
import Vrf from 'vrf'

import { BootstrapVue, IconsPlugin  } from 'bootstrap-vue'

import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'
import 'bootstrap-vue/dist/bootstrap-vue-icons.min.css'


Vue.use(BootstrapVue)

Vue.use(IconsPlugin)



class Middleware
  @accepts: -> true

  load: ->
    Promise.resolve({})

  loadSources: ->
    Promise.resolve({})

  save: ->
    new Promise((resolve) -> setTimeout((-> resolve([false, {}])), 2000))

Vue.config.productionTip = false
Vue.use(
  Vrf
  translate: (property) -> property
  adapters: [
    VrfBootstrap
  ]
  middlewares: [Middleware]
)


new Vue({
  el: '#app',
  render: (h) -> h(App)
})
