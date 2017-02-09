import React from 'react';

const Reviews = props => {
    if (props.showEditLink) {
      return(
      <div>
        <p className="review-index">{props.body}<br />
          <a className="edit-delete-links" href={`/reviews/${props.id}/edit`}> Edit</a>
        </p>
      </div>
    );
    } else {
      return <p className="review-index">{props.body}</p>;
    }
};

export default Reviews;
