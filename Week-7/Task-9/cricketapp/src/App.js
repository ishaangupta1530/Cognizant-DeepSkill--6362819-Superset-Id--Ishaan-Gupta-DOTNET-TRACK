import React from 'react';
import ListofPlayers from './components/ListofPlayers';
import Scorebelow70 from './components/Scorebelow70';
import { OddPlayers, EvenPlayers } from './components/OddPlayers';
import ListofIndianPlayers from './components/ListofIndianPlayers';

const players = [/* full player array from step 2 */];
const IndianTeam = ['Sachin1', 'Dhoni2', 'Virat3', 'Rohit4', 'Yuvraj5', 'Raina6'];
const T20Players = ['First Player', 'Second Player', 'Third Player'];
const RanjiPlayers = ['Fourth Player', 'Fifth Player', 'Sixth Player'];
const IndianPlayers = [...T20Players, ...RanjiPlayers];

const flag = false; // Toggle this to false to see the IndianTeam section

function App() {
  return (
    <div>
      {flag ? (
        <div>
          <h1>List of Players</h1>
          <ListofPlayers />
          <hr />
          <h1>List of Players having Scores Less than 70</h1>
          <Scorebelow70 />
        </div>
      ) : (
        <div>
          <h1>Indian Team</h1>
          <h2>Odd Players</h2>
          {OddPlayers(IndianTeam)}
          <hr />
          <h2>Even Players</h2>
          {EvenPlayers(IndianTeam)}
          <hr />
          <h2>List of Indian Players Merged:</h2>
          <ListofIndianPlayers IndianPlayers={IndianPlayers} />
        </div>
      )}
    </div>
  );
}

export default App;