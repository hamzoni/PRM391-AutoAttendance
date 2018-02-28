import React from 'react';
import { Button, Checkbox, Form } from 'semantic-ui-react';
import request from 'request';
import { API_URL } from '../Api.js';
import { browserHistory } from 'react-router';

class Login extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      username: '', password: ''
    };
  }

  handleChange(e, { name, value }) {
    this.setState({ [name]: value });
  }

  handleSubmit() {
    sessionStorage.loggedIn = true;
    sessionStorage.token = 'token';
    browserHistory.push('/');
    location.reload();
    return;

    const formData = {
      email: this.state.username,
      password: this.state.password
    };

    const options = {
      url: `${API_URL}/session`,
      method: 'POST',
      json: true,
      body: formData
    };

    request(options, (err, res, body) => {
      if (err) {
        console.log(err);
      } else if (body.token.length) {
        sessionStorage.loggedIn = true;
        sessionStorage.token = body.token;
        browserHistory.push('/');
        location.reload();
      }
    });
  }

  render() {
    return (
      <div className="form-input form-login column eight wide">
        <h2 className="title">Admin Login</h2>
        <Form onSubmit={() => { this.handleSubmit(); }}>
          <Form.Field>
            <Form.Input
              name="username" placeholder="Username"
              onChange={(e, { name, value }) => { this.handleChange(e, { name, value }); }}
            />
          </Form.Field>
          <Form.Field>
            <Form.Input
              name="password" placeholder="Password" type="password"
              onChange={(e, { name, value }) => { this.handleChange(e, { name, value }); }}
            />
          </Form.Field>
          <Form.Field>
            <Checkbox label="Remember me" />
          </Form.Field>
          <Button className="fluid ui button primary" type="submit">Submit</Button>
        </Form>
      </div>
    );
  }
}

export default Login;

