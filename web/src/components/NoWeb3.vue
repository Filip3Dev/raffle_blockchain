<template>
  <v-app class="no-web3">
    <v-container grid-list-md>
      <v-layout row wrap>
        <v-flex xs12>
          <v-card>
            <v-card-text>
              <p>Esta aplicación corre sobre Rinkeby, una blockchain de Ethereum usada para pruebas. Para poder usarla, seguí las siguientes instrucciones:</p>

              <ol>
                <li>Instalá <a href="https://metamask.io/" target="_blank">MetaMask</a> en tu navegador</li>
                <li>Seleccioná "Rinkeby Test Network" en la lista de redes (arriba a la izquierda)</li>
                <li>Ingresá un password y la confirmación, y guardá en algún lugar la lista de doce palabras que va a generar tu cuenta (como estamos usando una blockchain de prueba, no es muy importante que esto esté en un lugar seguro)</li>
                <li>Después del paso anterior vas a tener una dirección creada en la blockchain de Rinkeby.
                  Podés copiarla desde metamask clickeando en los tres puntos a la derecha de tu cuenta.
                  Una vez que la tengas, podés conseguir Ether para Rinkeby usando <a href="https://faucet.rinkeby.io/" target="_blank">este link</a>.
                  Si este paso te parece muy complicado, enviale tu dirección a alguno de los organizadores y pedile que te envíe un poco.</li>
                <li>Recargá la página y anotate para el sorteo. Cuando clickees "Comprar ticket", MetaMask va a pedirte que confirmes la transacción.</li>
                <li>Tu nombre va a aparecer en la lista en aproximadamente un minuto</li>
              </ol>
            </v-card-text>
          </v-card>
        </v-flex>
      </v-layout>
    </v-container>
  </v-app>
</template>

<script>
export default {
  name: 'NoWeb3'
}
</script>

<style></style>
