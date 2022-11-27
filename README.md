# Touché Coulé

## authors : Hongyu YAN & Liuyi CHEN 

Welcome to the DAAR project. The idea will is to implement a "Touché Coulé" (Battleship) game
in a decentralized way, on Ethereum. This will have cool side effects, like not
be forced to pay for servers.
The project can't be run on Windows. If you are in Windows, you have to use WSL.

# Installation

Run the complete project.

```bash
# Yarn users
yarn dev
```

# Subject

Implement a Touché Coulé from scratch in Solidity. The game is running into a contract by its own. We have created 4 agents (i.e. a smart contract) to play the game.

# What we have implemented
- We created 4 contracts to get 2 ships for each account. Then these 4 ships are deployed in the same way in the file `000001-deploy-game.ts`.
- When clicking on the `Register` button, two different ships are created for each of the two accounts in turn according to the order. In `App.tsx`, we register the address of the ship that to be created into `Main.sol`.  
- Each player can only have 2 ships. 
- Switch the account to play as a new player.
- In each turn, we fire at a random address. 

![image](https://cdn.discordapp.com/attachments/1023913190532333668/1046469225126035486/image.png)
