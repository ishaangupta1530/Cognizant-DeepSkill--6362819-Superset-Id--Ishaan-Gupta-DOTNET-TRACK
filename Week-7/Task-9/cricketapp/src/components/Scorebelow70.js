import React from 'react';

const players = [
  { name: 'Jack', score: 50 },
  { name: 'Michael', score: 70 },
  { name: 'John', score: 40 },
  { name: 'Ann', score: 61 },
  { name: 'Elisabeth', score: 61 },
  { name: 'Sixth', score: 65 },
  { name: 'Dhoni', score: 100 },
  { name: 'Virat', score: 64 },
  { name: 'Raina', score: 75 },
  { name: 'Jadea', score: 64 },
  { name: 'Rohit', score: 80 }
];

export default function Scorebelow70() {
  const lowScorers = players.filter(player => player.score <= 70);
  return (
    <ul>
      {lowScorers.map(p => (
        <li key={p.name}>Mr. {p.name} {p.score}</li>
      ))}
    </ul>
  );
}