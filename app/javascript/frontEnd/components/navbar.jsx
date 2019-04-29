import React from 'react';
import { Link } from 'react-router-dom';

const navbar = (props) => {
  return (
    <div>
      <Link to="/tshirts/new"> Create </Link>
      <Link to="/login"> Login </Link>
      <Link to="/"> Home </Link>
    </div>
  )
}

export default navbar;
