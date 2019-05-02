import React from 'react';
import { connect } from 'react-redux';
import { reduxForm, Field } from 'redux-form';
import { createTshirt } from '../actions';
import fileInput  from '../components/fileInput';

class TshirtNew extends React.Component{
  onSubmit = values => {
    this.props.createTshirt(values, this.props.token );
  }

  render() {
    return(
      <form onSubmit={this.props.handleSubmit(this.onSubmit) }>
        <Field name="name" component="input" type="text" />
        <Field name="description" component="textarea" />
        <Field name="photo" component={fileInput} />
        <button type="submit" disabled={ this.props.pristine }>Submit</button>
      </form>
    );
  }
}

function mapStateToProps(state) {
  return { token : state.token }
}

export default reduxForm({ form: 'TshirtNew' })(
  connect(mapStateToProps, { createTshirt })(TshirtNew)
 );
