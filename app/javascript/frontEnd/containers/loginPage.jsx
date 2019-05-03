import React from 'react';
import LoginForm from './login';
import { connect } from 'react-redux';
import { bindActionCreators } from 'redux';
import { toggleIsLoggedIn } from '../actions/';

class LoginPage extends React.Component {
  submit = values => {
    console.log('submit works',values)
    const data = {
      email: values.email,
      password: values.password
    }
    fetch('/api/v1/auth', {
      method: 'POST',
      credentials: 'include',
      body: JSON.stringify(data),
      headers: {
        'Content-Type' : 'application/json'
      }
    }).then( res => res.json())
    .then(data => {
       this.props.toggleIsLoggedIn(true)
    })
    .catch(error => console.error('Error:', error));
  }

  render() {
    return <LoginForm onSubmit={this.submit} />
  }
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ toggleIsLoggedIn }, dispatch);
}

function mapStateToProps(state) {
  return { isLoggedIn: state.isLoggedIn }
}

export default connect(mapStateToProps, mapDispatchToProps)(LoginPage);
