import React from 'react';
import { connect } from 'react-redux';
import { reduxForm, Field } from 'redux-form';
import { createTshirt } from '../actions';

class TshirtNew extends React.Component{
  render() {
    return(
      <form onSubmit={this.props.handleSubmit(this.onSubmit)}>
        <Field label="Title" name="title" type="text" component={this.renderField} />
        <button type="Submit">Create Tshirt</button>
      </form>
    );
  }
}

export default reduxForm({ form: 'newTshirtForm' })(connect(null, { createTshirt })(TshirtNew));
