import React from 'react';

const Form = props => {
  return(
    <form onSubmit={props.handleSubmit}>
      <input className="input" type='text' className="review-input" placeholder="Enter your review"  onChange={props.handleChange}/>
      <input type="submit" className="button" value="Submit" />
    </form>
  );
};

export default Form;
