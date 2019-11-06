<template>
  <div class="dapp">
    <slot v-if="status === 'ok'" name="ok"></slot>
    <slot v-if="status === 'no-web3'" name="no-web3"></slot>
  </div>
</template>

<script>
import Vue from 'vue'
import Web3 from 'web3'
export default {
  name: 'Dapp',
  data () {
    return {
      status: 'unknown'
    }
  },
  created() {
    new Promise(res => window.onload = res)
      .then(() => {
        if (!window.web3) {
          this.status = 'no-web3';
          return;
        }

        const web3 = new Web3(window.web3.currentProvider)

        // Make web3 accessible to all Vue instances
        Vue.prototype.$web3 = web3;

        this.status = 'ok';
      })
  },
  methods: {}
}
</script>

<style></style>
