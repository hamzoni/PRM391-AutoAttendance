import React from 'react';

const Sample = ({ children }) => (
  <div>
    <p>Hello</p>
  </div>
);

Sample.propTypes = { children: React.PropTypes.object };

export default Sample;

