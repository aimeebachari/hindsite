import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import App from './components/App';
import ReviewList from './components/ReviewList';

$(function() {
  ReactDOM.render(
    <ReviewList />,
    document.getElementById('reviewList')
  );
});
