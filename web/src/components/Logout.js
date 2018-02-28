import React from 'react';
import request from 'request';
import { API_URL } from '../Api.js';
import { browserHistory } from 'react-router';

class Logout extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
    };
  }

  componentWillMount() {
    const options = {
      url: `${API_URL}/session?token=${sessionStorage.token}`,
      method: 'DELETE',
      json: true
    };
    request(options, (err, res, body) => {
      if (err) {
        console.log(err);
      }
    });
    sessionStorage.clear();
    browserHistory.push('/');
    location.reload();
  }

  render() {
    return (
      <div>
      </div>
    );
  }
}

export default Logout;

