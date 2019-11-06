pragma solidity ^0.4.24;


contract Raffle {
  struct Ticket {
    string fullname;
    string email;
    int256 cpf;
  }

  address public owner;
  string public ownerName;

  Ticket[] public tickets;
  Ticket[] public drawnTickets;

  event TicketBought();
  event TicketDrawn(
    string fullname,
    string email
  );

  constructor(string _name) {
    owner = msg.sender;
    ownerName = _name;
  }

  // Sell a ticket. Validate that the email associated to the buyer doesn't have a ticket already
  function buyTicket(string fullname, string email, int256 cpf)  public {
    bool exists = false;
    for (uint i = 0; !exists && i < tickets.length; i++) {
      Ticket memory ticket = tickets[i];

      if (keccak256(email) == keccak256(ticket.email)) {
        exists = true;
      }
    }

    if (!exists) {
      Ticket memory newTicket = Ticket(fullname, email, cpf);
      tickets.push(newTicket);
      emit TicketBought();
    }
  }

  function currentWinner() view public returns (string fullname) {
    require(drawnTickets.length > 0);
    return drawnTickets[drawnTickets.length - 1].fullname;
  }

  function size() view public returns (uint) {
    return tickets.length;
  }

  function drawnSize() view public returns (uint) {
    return drawnTickets.length;
  }

  function drawTicket()  public {
    require(msg.sender == owner);

    uint idx = randomTicketIndex();
    drawnTickets.push(tickets[idx]);
    removeTicket();

    emit TicketDrawn(tickets[idx].fullname, tickets[idx].email);
  }

  function removeTicket()  public {
    for(uint i = 0; i < tickets.length; i++){
       delete tickets[i];
    }
    tickets.length = 0;
  }

  function randomTicketIndex() view public returns (uint) {
    uint idx = random() % tickets.length;
    return idx;
  }

  function random() view public returns (uint) {
    uint seed = block.number;

    uint a = 1103515245;
    uint c = 12345;
    uint m = 2 ** 32;

    return (a * seed + c) % m;
  }
}
