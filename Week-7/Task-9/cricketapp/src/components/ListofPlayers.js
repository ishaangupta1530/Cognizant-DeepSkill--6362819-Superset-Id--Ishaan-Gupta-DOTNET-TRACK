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

export default function ListofPlayers() {
  return (
    <div>
      {players.map(item => (
        <li key={item.name}>Mr. {item.name} {item.score}</li>
      ))}
    </div>
  );
}