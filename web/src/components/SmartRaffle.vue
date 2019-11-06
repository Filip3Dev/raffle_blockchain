<template>
  <v-app class="smart-raffle">
    <v-container grid-list-md text-xs-center>
      <v-layout row wrap>
        <v-flex xs12>
          <v-form v-model="valid" ref="form">
            <v-text-field
              label="Nombre"
              v-model="fullname"
              required>
            </v-text-field>
            <v-text-field
              label="E-mail"
              v-model="email"
              required>
            </v-text-field>
            <v-text-field
              label="CPF"
              v-model="cpf"
              required>
            </v-text-field>
            <v-btn :disabled="!valid" type="submit" @click.prevent="buyTicket(fullname, email, cpf)">Comprar ticket</v-btn>
          </v-form>

          <br>
          <br>
          <br>

          <TicketsList
            title="Tickets vendidos"
            emptyMessage="Tem nada aqui"
            :tickets="tickets"
          >
          </TicketsList>

          <br>
            <v-btn v-if="isOwnerConnected" type="button" @click.prevent="drawTicket()">Sacar ticket</v-btn>
          <br>

          <TicketsList
            title="Tickets sacados"
            emptyMessage="Tem nada aqui"
            :tickets="drawnTickets"
          >
          </TicketsList>
        </v-flex>
      </v-layout>
    </v-container>
  </v-app>
</template>

<script>
import RaffleContract from '@/contracts/raffle.js'
import TicketsList from '@/components/TicketsList'

export default {
  name: 'SmartRaffle',
  data () {
    return {
      currentAddress: 'unknown current address',
      owner: 'unknown owner address',
      ownerName: 'unknown owner name',
      tickets: [],
      drawnTickets: [],
      fullname: '',
      email: '',
      cpf: '',
      required: label => x => !!x || `${label} is required`,
      valid: false
    }
  },
  created () {
    RaffleContract.setProvider(this.$web3.currentProvider)

    RaffleContract
      .deployed()
      .then((raffle) => {
        this.getCurrentAddress(raffle);
        this.getOwnerAddress(raffle);
        this.getOwnerName(raffle);
        this.getTickets(raffle);
        this.getDrawnTickets(raffle);
        raffle.TicketBought().watch((err) => this.handleTicketBought(err, raffle));
        raffle.TicketDrawn().watch((err) => this.handleTicketDrawn(err, raffle));
      }, this.handleDeployError)
  },
  methods: {
    handleDeployError(err) {
      window.alert('deploy error', err)
    },
    handleTicketBought(err, raffle) {
      if (err) {
        console.error(err)
      } else {
        this.getTickets(raffle);
        this.getDrawnTickets(raffle);
      }
    },
    handleTicketDrawn(err, raffle) {
      if (err) {
        console.error(err)
      } else {
        this.getTickets(raffle);
        this.getDrawnTickets(raffle);
      }
    },
    getCurrentAddress() {
      return this.$web3.eth.getAccounts()
        .then((accounts) => {
          this.currentAddress = accounts[0];
        })
    },
    getOwnerAddress(raffle) {
      return raffle.owner()
        .then(owner => this.owner = owner);
    },
    getOwnerName(raffle) {
      return raffle.ownerName()
        .then(ownerName => this.ownerName = ownerName);
    },
    getTickets(raffle) {
      return raffle
        .size()
        .then((sizeBigNumber) => {
          const size = sizeBigNumber.toNumber()

          const promises = [...Array(size)]
            .map((x, i) => raffle.tickets(i))

          return Promise.all(promises)
        })
        .then(tickets => this.tickets = tickets);
    },
    getDrawnTickets(raffle) {
      return raffle
        .drawnSize()
        .then((sizeBigNumber) => {
          const size = sizeBigNumber.toNumber()

          const promises = [...Array(size)]
            .map((x, i) => raffle.drawnTickets(i))

          return Promise.all(promises)
        })
        .then(drawnTickets => this.drawnTickets = drawnTickets);
    },
    buyTicket(fullname, email, cpf) {
      RaffleContract
        .deployed()
        .then((raffle) => {
          this.$web3.eth.getAccounts()
            .then(accounts => accounts[0])
            .then((account) => {
              raffle.buyTicket(fullname, email, cpf, { from: account })

              this.$refs.form.reset()
            })
        });
    },
    drawTicket() {
      RaffleContract
        .deployed()
        .then((raffle) => {
          this.$web3.eth.getAccounts()
            .then(accounts => accounts[0])
            .then((account) => {
              raffle.drawTicket({ from: account })
            })
        });
    },
  },
  computed: {
    isOwnerConnected() {
      return this.owner.toLowerCase() === this.currentAddress.toLowerCase();
    }
  },
  components: { TicketsList }
}
</script>

<style></style>
