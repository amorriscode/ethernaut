const MetaMaskConnector = require('node-metamask');
const Web3 = require('web3');

const connector = new MetaMaskConnector({
  onConnect() { console.log('MetaMask client connected') },
});

connector.start().then(async () => {
  // Now go to http://localhost:3333 in your MetaMask enabled web browser.
  const web3 = new Web3(connector.getProvider());

  const password = await web3.eth.getStorageAt('0xdc7f099525987277e73e54936c4d9f0d16195111', 1);

  console.log(password);
  console.log(web3.utils.toAscii(password));
});