import React from 'react';
import { connect } from 'react-redux';

import Tshirt from '../components/tshirt';

class Home extends React.Component {

  render() {
    return (
      <div>
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

export default connect(mapStateToProps)(Home);
