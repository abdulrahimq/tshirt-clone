export default function(state, action) {
  if (state === undefined) {
    return [];
  }

  if (action.type === 'TSHIRT_CREATED') {
    return [...state, action.payload ];
  }

  if (action.type === 'FETCH_TSHIRTS') {
    return action.payload;
  }

  return state;
}
