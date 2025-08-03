import React from 'react';
import './App.css';

function App() {
  // Title element
  const title = "Office Space";

  // JSX attribute to display image
  const officeImage = (
    <img 
      src="/office-space.jpg" 
      alt="Office Space" 
      style={{ width: "25%", height: "25%" }} 
    />
  );

  // Single object for one office
  const officeItem = {
    Name: "DBS",
    Rent: 50000,
    Address: "Chennai"
  };

  // Determine rent color class
  const rentColor = officeItem.Rent <= 60000 ? "textRed" : "textGreen";

  return (
    <div className="App">
      <h1>{title}, at Affordable Range</h1>
      {officeImage}
      <h1>{officeItem.Name}</h1>
      <h3 className={rentColor}>Rent: Rs. {officeItem.Rent}</h3>
      <h3>Address: {officeItem.Address}</h3>
    </div>
  );
  const officeList = [
  { Name: "DBS", Rent: 50000, Address: "Chennai" },
  { Name: "WeWork", Rent: 65000, Address: "Mumbai" },
  { Name: "Spaces", Rent: 72000, Address: "Delhi" },
  { Name: "OfficeHub", Rent: 48000, Address: "Bengaluru" }
];
<h2>Available Office Spaces</h2>
{officeList.map((office, index) => {
  const colorClass = office.Rent <= 60000 ? "textRed" : "textGreen";
  return (
    <div key={index}>
      <h3>{office.Name}</h3>
      <p className={colorClass}>Rent: Rs. {office.Rent}</p>
      <p>Address: {office.Address}</p>
    </div>
  );
})}
}

export default App;