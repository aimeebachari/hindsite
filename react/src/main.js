import React from 'react';
import ReactDOM from 'react-dom';
import ReviewList from './components/ReviewList';
import Reviews from './components/Reviews';
import Form from './components/Form';
import 'babel-polyfill';
import 'whatwg-fetch';

$(function() {
  ReactDOM.render(
    <ReviewList />,
    document.getElementById('reviewList')
  );
});
