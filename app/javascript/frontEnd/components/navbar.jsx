import React from 'react';
import { Link } from 'react-router-dom';
import { toggleIsLoggedIn } from '../actions/';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
const navbar = (props) => {
  function logout(event) {

    const promise = fetch('/api/v1/auth', {
      method: 'DELETE',
      credentials: 'include'
    })
    .then( data => {
      props.toggleIsLoggedIn(false);
    })

    return promise
  }

  return (
    <div>
      <Link to="/"> Home </Link>
      <Link to="/tshirts/new"> Create </Link>
      {!props.isLoggedIn && <Link to="/login"> Login </Link> }
      {(props.isLoggedIn && <a href="#" onClick={logout}>Logout</a>)}

    </div>
  )
}

function mapStateToProps(state) {
  return { isLoggedIn: state.isLoggedIn }
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ toggleIsLoggedIn }, dispatch)
}

export default connect(mapStateToProps, mapDispatchToProps)(navbar);
