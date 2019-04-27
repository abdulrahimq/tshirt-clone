export default function(state, action) {
  if (state === undefined) {
    return [];
  }

  if (action.type === 'TSHIRT_CREATED') {
    return [...state, action.payload ];
  }

  return state;
}
