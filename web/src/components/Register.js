import React from 'react';
import { Button, Form } from 'semantic-ui-react';
import DatePicker from 'react-datepicker';
import moment from 'moment';
import request from 'request';
import { API_URL } from '../Api.js';

class Register extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      name: '', parent_name: '', dob: moment(), phone: '',
      email: '', social: '', course: '', note: ''
    };
  }

  handleChange(e, { name, value }) {
    this.setState({ [name]: value });
  }

  handleSubmit() {
    const formData = this.state;
    formData.dob = formData.dob.format('MM/DD/YYYY');

    const options = {
      url: `${API_URL}/form`,
      method: 'POST',
      json: true,
      body: formData
    };
    request(options, (err, res, body) => {
      if (err) {
        console.log(err);
      } else {

      }
    });
  }

  render() {
    return (
      <div className="form-input form-register column eight wide left aligned">
        <h2 className="title">Register</h2>
        <Form onSubmit={() => { this.handleSubmit(); }}>
          <div className="fields">
            <Form.Field>
              <label>Name*</label>
              <Form.Input
                name="name" required
                onChange={(e, { name, value }) => { this.handleChange(e, { name, value }); }}
              />
            </Form.Field>
            <Form.Field>
              <label>Parent name*</label>
              <Form.Input
                name="parent_name" required
                onChange={(e, { name, value }) => { this.handleChange(e, { name, value }); }}
              />
            </Form.Field>
          </div>
          <div className="fields">
            <Form.Field>
              <label>Phone number*</label>
              <Form.Input
                name="phone" required
                onChange={(e, { name, value }) => { this.handleChange(e, { name, value }); }}
              />
            </Form.Field>
            <Form.Field>
              <label>Date of birth*</label>
              <DatePicker
                selected={this.state.dob}
                onChange={(d) => { this.setState({ dob: d }); }}
              />
            </Form.Field>
          </div>
          <Form.Field>
            <label>Email*</label>
            <Form.Input
              name="email" required
              onChange={(e, { name, value }) => { this.handleChange(e, { name, value }); }}
            />
          </Form.Field>
          <Form.Field>
            <label>Facebook link or Skype ID</label>
            <Form.Input
              name="social"
              onChange={(e, { name, value }) => { this.handleChange(e, { name, value }); }}
            />
          </Form.Field>
          <Form.Field>
            <label>Course*</label>
            <Form.Input
              name="course" required
              onChange={(e, { name, value }) => { this.handleChange(e, { name, value }); }}
            />
          </Form.Field>
          <Form.Field>
            <label>Note</label>
            <Form.Input
              name="note"
              onChange={(e, { name, value }) => { this.handleChange(e, { name, value }); }}
            />
          </Form.Field>
          <p><i>Fields marked * are required</i></p>
          <Button className="fluid ui button primary" type="submit">Submit</Button>
        </Form>
      </div>
    );
  }
}

export default Register;

