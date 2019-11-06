<template>
  <div id="app">
    <Dapp>
      <SmartRaffle slot="ok"></SmartRaffle>
      <NoWeb3 slot="no-web3"></NoWeb3>
    </Dapp>
  </div>
</template>

<script>
import Dapp from '@/components/Dapp'
import SmartRaffle from '@/components/SmartRaffle'
import NoWeb3 from '@/components/NoWeb3'

export default {
  name: 'app',
  components: {
    Dapp,
    NoWeb3,
    SmartRaffle
  }
}
</script>

<style></style>
