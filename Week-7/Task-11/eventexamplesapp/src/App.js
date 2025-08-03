import React from 'react';
import CurrencyConvertor from './components/CurrencyConvertor';
import './App.css';

function App() {
  const sayWelcome = (msg) => {
    alert(msg);
  };

  const handlePress = () => {
    alert("I was clicked");
  };

  return (
    <div className="App">
      <h1>Event Examples App</h1>

      <div className="section">
        <button onClick={() => sayWelcome("welcome")}>Say Welcome</button>
        <button onClick={handlePress}>Click on me</button>
      </div>

      <CurrencyConvertor />
    </div>
  );
}

export default App;