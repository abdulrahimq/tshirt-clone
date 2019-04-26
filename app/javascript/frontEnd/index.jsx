import React from 'react';
import ReactDOM from 'react-dom';
import { BrowserRouter as Router, Route, Redirect, Switch } from 'react-router-dom';
import { createBrowserHistory as history } from 'history';
import { Provider } from 'react-redux';
import { createStore, combineReducers, applyMiddleware } from 'redux';
import reduxPromise from 'redux-promise';
import { logger } from 'redux-logger';


import Home from './containers/home';
import TshirtReducer from './reducers/tshirt_reducer';
import './stylesheets/index.scss';

const root = document.getElementById('root');
const initialState = { tshirts: JSON.parse(root.dataset.tshirts) };
console.log(initialState);

const reducers = combineReducers({
  tshirts: TshirtReducer
});

const middlewares = applyMiddleware(reduxPromise, logger);


ReactDOM.render(
    <Provider store={createStore(reducers, initialState, middlewares)}>
      <Router history={history}>
        <Switch>
            <Route path="/" component={Home} />
        </Switch>
      </Router>
    </Provider>,
  document.getElementById('root')
);



