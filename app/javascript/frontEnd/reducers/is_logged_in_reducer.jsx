export default function(state, action) {
  if (state === undefined) {
    return null;
  }

  if (action.type === 'TOGGLE_IS_LOGGED_IN') {
    return action.payload;
  }

  return state;
}
