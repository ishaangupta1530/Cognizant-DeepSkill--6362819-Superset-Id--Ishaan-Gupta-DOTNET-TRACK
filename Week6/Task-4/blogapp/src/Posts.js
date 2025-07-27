import React from 'react';
class Posts extends React.Component{
    constructor(props){
        super(props);
        
    this.state = {
      posts: [], 
      error: null
    };
  }
  loadPosts() {
    fetch('https://jsonplaceholder.typicode.com/posts')
      .then(response => {
        if (!response.ok) {
          throw new Error('Network response was not ok');
        }
        return response.json();
      })
      .then(data => {
        this.setState({ posts: data, error: null });
      })
      .catch(error => {
        this.setState({ error: error.message });
        console.error("Error fetching posts:", error);
      });
  }

  
  componentDidMount() {
    this.loadPosts();
}
render() {
  const { posts, error } = this.state;

  if (error) {
    return <div>Error loading posts: {error}</div>;
  }

  return (
    <div>
      <h1>📬 Posts Feed</h1>
      {posts.map(post => (
        <div key={post.id} style={{ marginBottom: '1.5rem' }}>
          <h2>{post.title}</h2>
          <p>{post.body}</p>
        </div>
      ))}
    </div>
  );
}
componentDidCatch(error, info) {
  
  alert(`Oops! An error occurred: ${error.message}`);

  
  console.error("Caught by componentDidCatch:", error);
  console.error("Component stack trace:", info.componentStack);

  
  this.setState({ error: error.message });
}
}

export default Posts;