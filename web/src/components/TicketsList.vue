<template>
  <v-card>
    <v-toolbar color="purple" dark>
      <v-toolbar-title>{{ title }}</v-toolbar-title>
    </v-toolbar>
    <v-list>
      <template v-if="tickets.length" v-for="(ticket, index) in tickets">
        <v-list-tile >
          <v-list-tile-content>
            <v-list-tile-title>{{ ticket[0] }}</v-list-tile-title>
          <v-list-tile-sub-title>{{ ticket[1] }}</v-list-tile-sub-title>
          </v-list-tile-content>
        </v-list-tile>
        <v-divider v-if="index + 1 < tickets.length" :key="ticket[1]"></v-divider>
      </template>
      <template v-if="!tickets.length">
        {{ emptyMessage }}
      </template>
    </v-list>
  </v-card>
</template>

<script>
export default {
  name: 'TicketsList',
  data () {
    return {}
  },
  props: {
    title: String,
    tickets: Array,
    emptyMessage: String
  },
}

</script>
