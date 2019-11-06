# Smart Raffle

Wikipedia definition of [Raffle](https://en.wikipedia.org/wiki/Raffle)
>A raffle is a gambling competition in which people obtain numbered tickets, each ticket having the chance of winning a prize. At a set time, the winners are drawn from a container holding a copy of every number. The drawn tickets are checked against a collection of prizes with numbers attached to them, and the holder of the ticket wins the prize.
The raffle is a popular game in numerous countries and is often held to raise funds for a specific charity or event.

## The project
This project will allow users to participates in a Raffle using a web application. All the data will be store in a smart contract in the Blockchain (Ethereum).

### Roadmap
#### Version 1
Scope: be able to publish a raffle and draw only one ticket in a meetup. The winner will have to be present otherwise another ticket will be drawn.

##### Web App
- Buy a ticket by just registering an email address (no duplicates)
- Only Raffle administrator
  - List the sold tickets owners
  - Draw a ticket
  - Re-draw a ticket if owner is not present
  - Mark raffle as finished (when owner is present and the prize is given)

##### Smart Contract
- Register tickets. Validate unique email address.
- The Smart Contract will have an owner which will be able to:
  - Setup:
    - Raffle date.
    - Prize (initially just a text description. Real money in the future automatically paid by the contract).
  - Close the tickets sale.
  - List ticket's owners emails.
  - Draw a ticket.
  - Re-draw ticket if previous ticket's owner is not present. Mark previous ticket as drawn annuled

Limitations
- The Smart Contract will be deployed in a test-net by the Raffle owner
