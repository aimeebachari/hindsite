import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import ReviewList from './components/ReviewList';
import Reviews from './components/Reviews';
import Form from './components/Form';

$(function() {
  ReactDOM.render(
    <ReviewList />,
    document.getElementById('reviewList')
  );
});
