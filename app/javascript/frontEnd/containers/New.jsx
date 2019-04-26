import React from 'react';
import { connect } from 'react-redux';
import { reduxForm, Field } from 'redux-form';
import { createTshirt } from '../actions';

class TshirtNew extends React.Component{
  onSubmit = values => {
    this.props.createTshirt(values);
  }

  render() {
    return(
      <form onSubmit={this.props.handleSubmit(this.onSubmit) }>
        <Field name="name" component="input" type="text" />
        <Field name="description" component="textarea" />
        <button type="submit" disabled={ this.props.pristine }>Submit</button>
      </form>
    );
  }

}

export default reduxForm({ form: 'TshirtNew' })(
  connect(null, { createTshirt })(TshirtNew)
 );
