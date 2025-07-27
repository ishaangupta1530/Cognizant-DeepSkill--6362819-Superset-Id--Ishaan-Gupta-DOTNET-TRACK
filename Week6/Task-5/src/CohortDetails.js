import React from 'react';
import styles from './CohortDetails.module.css';

function CohortDetails({ cohort }) {
  const {
    cohortCode,
    technology,
    startDate,
    endDate,
    currentStatus,
    coachName,
    trainerName
  } = cohort;

  const titleStyle = {
    color: currentStatus?.toLowerCase() === 'ongoing' ? 'green' : 'blue'
  };

  return (
    <div className={styles.box}>
      <h3 style={titleStyle}>
        {cohortCode} - <span>{technology}</span>
      </h3>
      <dl>
        <dt>Current Status:</dt>
        <dd>{currentStatus}</dd>
        <dt>Start Date:</dt>
        <dd>{startDate}</dd>
        <dt>End Date:</dt>
        <dd>{endDate}</dd>
        <dt>Coach:</dt>
        <dd>{coachName}</dd>
        <dt>Trainer:</dt>
        <dd>{trainerName}</dd>
      </dl>
    </div>
  );
}

export default CohortDetails;