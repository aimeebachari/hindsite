import Reviews from 'components/Reviews';
import { shallow } from 'enzyme';
import React from 'react';

describe('Reviews', () => {

  let text,
      wrapper;

  beforeEach(() => {
    wrapper = shallow(
      <Reviews
        key={3}
        id={3}
        eventId={4}
        body={"Some text"}
        showEditLink={true} />
    );
  });

  it('should render a p tag', () => {
    expect(wrapper.find('p')).toBePresent();
  });

  it('should render a p tag with the text property value', () => {
    expect(wrapper.find('p').text()).toBe('Some text Edit');
  });
});
