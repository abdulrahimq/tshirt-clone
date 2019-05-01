import React from 'react';
import ReactDOM from 'react-dom';
import { BrowserRouter as Router, Route, Redirect, Switch } from 'react-router-dom';
import { createBrowserHistory as history } from 'history';
import { Provider } from 'react-redux';
import { createStore, combineReducers, applyMiddleware } from 'redux';
import reduxPromise from 'redux-promise';
import { logger } from 'redux-logger';
import { reducer as formReducer } from 'redux-form';


import Home from './containers/home';
import New from './containers/new';
import NavBar from './components/navbar';
import LoginPage from './containers/loginPage';

import TshirtReducer from './reducers/tshirt_reducer';
import TokenReducer from './reducers/token_reducer';
import './stylesheets/index.scss';

const root = document.getElementById('root');
const initialState = { tshirts: JSON.parse(root.dataset.tshirts) };
console.log(initialState);

const reducers = combineReducers({
  token: TokenReducer,
  tshirts: TshirtReducer,
  form: formReducer
});

const middlewares = applyMiddleware(reduxPromise, logger);


ReactDOM.render(
    <Provider store={createStore(reducers, initialState, middlewares)}>
      <Router history={history}>
        <NavBar />
        <Switch>
            <Route exact path="/login" component={LoginPage} />
            {/* A banner page to bring in users and introduce */}
            <Route exact path="/tshirts/new" component={New} />
            {/* where you can upload a tshirt */}
            {/* <Route path="/marketplace" component={MarketPlace} /> */}
            {/* the marketplace where you browser, search, shop */}
            {/* <Route path="/checkout" component={Checkout} /> */}
            {/* once you have added enough items, you checkout */}
            {/* <Route path="/tshirt/:id" component={Show} /> */}
            {/* to check out the details and description of an individual shirt */}
            {/* <Route path="/user/profile/:id" component={Profile} /> */}
            {/* where you can edit your user profile, view your orders */}
            {/* <Route path="/user/:id" component={User} /> */}
            {/* where you can view an artist profile */}
            {/* need to have authentication for users */}
            <Route exact path="/" component={Home} />
        </Switch>
      </Router>
    </Provider>,
  document.getElementById('root')
);
