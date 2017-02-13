import Form from 'components/Form';
import { shallow } from 'enzyme';
import React from 'react';

describe('Form', () => {

  let wrapper;

  beforeEach(() => {
    wrapper = shallow(
      <Form
        onSubmit={() => {}}
        onChange={() => {}}
      />
    );
  });

  it('should render a form tag', () => {
    expect(wrapper.find('form')).toBePresent();
  });
});
