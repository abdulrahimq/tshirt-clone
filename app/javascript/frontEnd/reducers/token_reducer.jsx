export default function(state, action) {
  if (state === undefined) {
    return null;
  }

  if (action.type === 'SET_TOKEN') {
    return action.payload;
  }

  return state;
}
