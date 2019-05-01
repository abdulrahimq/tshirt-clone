import React from 'react';
import LoginForm from './login';
import { connect } from 'react-redux';
import { bindActionCreators } from 'redux';
import { setToken } from '../actions/';

class LoginPage extends React.Component {
  submit = values => {
    console.log('submit works',values)
    const data = {
      email: values.email,
      password: values.password
    }
    fetch('/api/v1/auth', {
      method: 'POST',
      body: JSON.stringify(data),
      headers: {
        'Content-Type' : 'application/json'
      }
    }).then( res => res.json())
    .then(data => {
       localStorage.setItem("token", data.token)
       this.props.setToken(data.token)
    })
    .catch(error => console.error('Error:', error));
  }

  render() {
    return <LoginForm onSubmit={this.submit} />
  }
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ setToken }, dispatch);
}

export default connect(null, mapDispatchToProps)(LoginPage);
