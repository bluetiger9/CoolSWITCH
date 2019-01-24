import donna25519
import sys, getopt
from urllib.request import urlopen
import base64
import time;
import random;
import hashlib;

msgSeqNr = 0

def run_command(device, command, secret = None):
    global msgSeqNr
    url = command
    if secret != None:
        url += ("&" if ("?" in url) else "?") + "seqNr=" + str(int(round(time.time() * 1000))) + "." + str(msgSeqNr)
        msgSeqNr += 1
        url += "&nonce=" + str(random.randint(0, 100000000))
        url += "&hmac=" + hashlib.sha256((url + secret).encode("utf-8")).hexdigest()
    url = "http://" + device + ".local" + url   

    print("HTTP request: " + url)
    response = urlopen(url)
    contents = response.read()
    code = response.getcode()
    print("(" + str(code) + ") " + contents.decode('ascii'))
    return contents

def gen_secret(device):
    privateKey = donna25519.PrivateKey()
    publicKey = privateKey.get_public()
    privateKeyBase64 = base64.b64encode(privateKey.private).decode('ascii')
    publicKeyBase64 = base64.b64encode(publicKey.public).decode('ascii')
    #print("private: " + privateKeyBase64)
    #print("public: " + publicKeyBase64)
        
    coolSwitchPublicKeyBase64 = run_command(device, "/secret?publicKey=" + publicKeyBase64)
    print("CoolSwitch Public: " + publicKeyBase64)
    
    coolSwitchPublicKey = donna25519.PublicKey(base64.b64decode(coolSwitchPublicKeyBase64))
    sharedSecret = privateKey.do_exchange(coolSwitchPublicKey)
    print("sharedSecret: " + base64.b64encode(sharedSecret).decode('ascii'))    

def main(argv):
   try:
      opts, args = getopt.getopt(argv, ":d:", ["generate-secret", "command=", "secret="])
   except getopt.GetoptError:
      print('coolSwitchClient.py -d <device> --generate-secret | --command <command> | --secret <secret>')
      sys.exit(2)
   
   gen_secr = False
   secret = None
   for opt, arg in opts:
      if opt == '--generate-secret':            
         gen_secr = True

      elif opt == '--command':
         command = arg
   
      elif opt == '--secret':
         secret = arg

      elif opt in ("-d", "--device"):
         device = arg

   if gen_secr == True:
      gen_secret(device)
    
   else:
      run_command(device, command, secret)   

if __name__ == "__main__":
   main(sys.argv[1:])
