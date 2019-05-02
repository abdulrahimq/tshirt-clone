import React from 'react';
import { connect } from 'react-redux';
import { bindActionCreators } from 'redux';
import { fetchTshirts } from '../actions/index';

import Tshirt from '../components/tshirt';

class Home extends React.Component {
  componentWillMount() {
    this.props.fetchTshirts()
  }

  render() {
    return (
      <div className='marketplace'>
         { this.props.tshirts.map((tshirt) => {
      return <Tshirt tshirt={tshirt} key={tshirt.id} />
    }) }
      </div>
    );
  }
}

function mapStateToProps(state) {
  return {
    tshirts: state.tshirts
  }
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ fetchTshirts }, dispatch);
}

export default connect(mapStateToProps, mapDispatchToProps)(Home);
