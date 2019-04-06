var argv = require('minimist')(process.argv.slice(2));
var exec = require('child_process').exec;

const iotaLibrary = require('@iota/core')

const iota = iotaLibrary.composeAPI({
  provider: 'https://nodes.devnet.thetangle.org:443'
})

const address =
  '9WFZOAHLRXNFYGBBXMLFCZPNCHDKXKRDTSH9LF9KJTIPDMTXUMUCHKVNMNJKCHOLWJYGDD9ZVMXGM9MD9'

let prevBalance = -1

let checkBalance = function() {
  iota
    .getBalances([iotaAddress], 100)
    .then(({ balances }) => {
      let balance = balances[0]
      console.log("Balance: " + balance)
      if (prevBalance > 0 && prevBalance < balance) {
	let newTokens = balance - prevBalance
	if (newTokens > 0) {
	  newTokensCB(newTokens)
        }
      }
      prevBalance = balance
    })
    .catch(err => {
      console.error(err)
    })

  schedule()
}

let newTokensCB = function(newTokens) {
  console.log("Got " + newTokens + " IOTA tokens")
  
  const onMillis = 1000.0 * newTokens / priceSeconds;
  console.log("  \- ON time: " + (onMillis / 1000.0) + "s");
  sendCommand("turnOn");
  setTimeout(sendCommand, onMillis, "turnOff")     
}

let sendCommand = function(cmd) {
  let command = coolSwitchScript.replace("{command}", cmd)
  console.log("Sending command: " + command)
  exec(command, function callback(error, stdout, stderr){
    console.log(" -\exit code" + error)
    console.log(" -\stdout: " + stdout)
    console.log(" -\stderr: " + stderr)
  });
}

let schedule = function() {
  setTimeout(checkBalance, 1000);
}

// - - -
const coolSwitchId = argv["coolSwitchId"]
const coolSwitchSecret = argv["coolSwitchSecret"]
const iotaAddress = argv["iotaAddress"]

const priceSeconds = argv["priceSeconds"]

console.log("CoolSwitch Device ID: " + coolSwitchId)
console.log("CoolSwitch Secret: " + coolSwitchSecret)
console.log("IOTA Addres: " + iotaAddress);
console.log("Price (/secs): " + priceSeconds + " IOTA");

const coolSwitchScript = "python3 " + __dirname.replace("CoolSWITCH-IOTA", "") + "/CoolSWITCH/coolSwitchClient.py -d " + coolSwitchId + " --command /{command} --secret " + coolSwitchSecret

schedule()
