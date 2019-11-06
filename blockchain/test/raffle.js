const Raffle = artifacts.require('Raffle');

contract('raffle', (accounts) => {
  it('should create the contract without tickets', () => {
    return Raffle
      .deployed()
      .then((raffle) => {
        return raffle.size();
      })
      .then((size) => {
        assert.equal(+size, 0, 'Should start with 0 tickets');
      });
  });
});
