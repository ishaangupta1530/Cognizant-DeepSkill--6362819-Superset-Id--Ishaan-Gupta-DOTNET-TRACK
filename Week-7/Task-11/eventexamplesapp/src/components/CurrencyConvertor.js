import React, { useState } from 'react';
import Popup from './Popup';

function CurrencyConverter() {
  const [amount, setAmount] = useState('');
  const [currency, setCurrency] = useState('');
  const [converted, setConverted] = useState('');
  const [showPopup, setShowPopup] = useState(false);
  const exchangeRate = 0.011;

  const handleSubmit = (e) => {
    e.preventDefault();
    const amt = parseFloat(amount);

    if (isNaN(amt)) {
      setConverted("Enter valid number");
    } else {
      const result = currency === "EUR"
        ? `₹${(amt / exchangeRate).toFixed(2)}`
        : `€${(amt * exchangeRate).toFixed(2)}`;
      setConverted(result);
    }
    setShowPopup(true);
  };

  return (
    <div className="section">
      <h2>Currency Converter!!!</h2>
      <form onSubmit={handleSubmit}>
        <label>Amount:</label><br />
        <input
          type="text"
          value={amount}
          onChange={(e) => setAmount(e.target.value)}
        /><br /><br />
        <label>Currency:</label><br />
        <select value={currency} onChange={(e) => setCurrency(e.target.value)}>
          <option value="">Select</option>
          <option value="EUR">Euro to Rupees</option>
          <option value="INR">Rupees to Euro</option>
        </select><br /><br />
        <button type="submit">Submit</button>
      </form>

      {showPopup && (
        <Popup
          message={`Converted Amount: ${converted}`}
          onClose={() => setShowPopup(false)}
        />
      )}
    </div>
  );
}

export default CurrencyConverter;