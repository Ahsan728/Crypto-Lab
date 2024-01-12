# Crypto-Lab
Find Secret Key with Cryptography @ESISAR
The objective of this practical work is to implement on FPGA some basic arithmetic operators on finite field (Z/mZ). The final modulus which is the modular exponentiation is
the main element of the RSA public key encryption algorithm. The goal is to use this module and the RSA encryption algorithm to find the secret decryption key.

## Performing RSA encryption using the exponentiation module

In order to display the outcome on the 7-segment display, we need to implement our method on FPGA after simulating the exponentiation module. The encryption of plaintext and decryption of ciphertext are the objectives. For the implementation, we have created a new entity Imple_FPGA in order to send the Plaintext and the public key to the input of the exponentiation to check if the output will be worth the correct value of the ciphertext. Then we implemented the components (Multiplexer, modm_exponentiation, display) in a single architecture. Diagram below describes the architecture:

![image](https://github.com/Ahsan728/Crypto-Lab/assets/34878134/7172c857-f49f-480f-b6c9-48e7f8e0f0c5)

You must then use the constraint file to specify what each input/output will be physically connected to. Output z is connected to the 7-segment display, “done” to led1, “start” to switch0, “reset” to button C and “sw” to switch 15.

In order to test the proper functioning of the architecture, we used the values given in the lab:
● P (plaintext): 0x8000
● K (public key): 0x007F
● n (modulo): 0xF797

After generating the bitstream and implementing it on the board, we get the following result:
![image](https://github.com/Ahsan728/Crypto-Lab/assets/34878134/023a471b-8070-43b5-8a7a-3ab19767feec)

The result of Z is 0xF20F which matches the Ciphertext well.
Then we pass the value of the SW to 1, in order to decrypt the ciphertext (0xF20F). We use a secret key given by the subject of the lab, SecretKEY: 0xD4BF.
![image](https://github.com/Ahsan728/Crypto-Lab/assets/34878134/2de7ce05-86ca-4094-917d-c7d4c5153610)

## The result of Z is 0x8000, so we find the value of the plaintext.

