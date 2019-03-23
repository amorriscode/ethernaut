const MetaMaskConnector = require('node-metamask');
const Web3 = require('web3');

const connector = new MetaMaskConnector({
  onConnect() { console.log('MetaMask client connected') },
});

connector.start().then(async () => {
  // Now go to http://localhost:3333 in your MetaMask enabled web browser.
  const web3 = new Web3(connector.getProvider());

  const data2 = await web3.eth.getStorageAt('0x41663895f37cbb05037b14bbdd50e1c2b2111a26', 3);

  console.log(web3.utils.padLeft(data2, 16));
});