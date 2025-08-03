export default function ListofIndianPlayers({ IndianPlayers }) {
  return (
    <ul>
      {IndianPlayers.map((name, index) => (
        <li key={index}>Mr. {name}</li>
      ))}
    </ul>
  );
}