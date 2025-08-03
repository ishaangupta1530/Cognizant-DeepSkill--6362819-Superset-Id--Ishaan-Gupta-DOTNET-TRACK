import React from 'react';

const blogs = [
  {
    title: 'React Learning',
    author: 'Stephen Biz',
    content: 'Welcome to learning React!',
  },
  {
    title: 'Installation',
    author: 'Schwezdenier',
    content: 'You can install React from npm.',
  },
];

function BlogDetails() {
  return (
    <div className="section blog">
      <h2>Blog Details</h2>
      {blogs.map((blog, index) => (
        <div key={index}>
          <p><strong>{blog.title}</strong></p>
          <p>{blog.author}</p>
          <p>{blog.content}</p>
        </div>
      ))}
    </div>
  );
}

export default BlogDetails;