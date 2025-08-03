import React from 'react';

const courses = [
  { cname: 'Angular', cdate: '4/5/2021' },
  { cname: 'React', cdate: '6/3/20201' },
];

function CourseDetails() {
  return (
    <div className="section course">
      <h2>Course Details</h2>
      {courses.map((course, index) => (
        <div key={index}>
          <p><strong>{course.cname}</strong></p>
          <p>{course.cdate}</p>
        </div>
      ))}
    </div>
  );
}

export default CourseDetails;