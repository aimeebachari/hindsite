import React, { Component } from 'react';

class ReviewList extends Component {
  constructor(props) {
    super(props);
    this.state = {value: ''};

    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleChange(event) {
    this.setState({value: event.target.value});
  }

  handleSubmit(event){
    event.preventDefault();
    let pathArray = window.location.href.split('/');
    let pathEventId = pathArray[pathArray.length - 1];
    fetch(
      '/api/v1/reviews',
      {
        credentials: 'same-origin',
        method: 'post',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({body: this.state.value, event_id: pathEventId})
      }
    ).then(
      (response) => {
        if (response.status === 200) {
          // add javascript to clear out form, has classname of "review-input"
          let node = document.createElement("p");
          node.className = "review-index";
          let textnode = document.createTextNode(this.state.value);
          node.appendChild(textnode);

          let nodeLink = document.createElement("a");
          nodeLink.className = "edit-review-link";

          //replace the 1 below with the real ID.
          nodeLink.href = `/events/${pathEventId}/reviews/${1}/edit`;
          let nodeLinkText = document.createTextNode("| Edit Review");
          nodeLink.appendChild(nodeLinkText);
          node.appendChild(nodeLink);

          document.getElementById("reviews").appendChild(node);
        }
      }
    );
  }

  render() {
    return (
      <div>
        <h2 className="review-form-title">Add a Review</h2>
        <form onSubmit={this.handleSubmit}>
          <input className="input" type='text' className="review-input" placeholder="Enter your review"  onChange={this.handleChange}/>
          <input type="submit" className="button" value="Submit" />
        </form>
      </div>
    );
  }
}

export default ReviewList;
