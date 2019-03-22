const searchFunction = (event) => {
  event.preventDefault();
  const query = 'new'
  const client = algoliasearch(ENV['ALGOLIA_APPLICATION_ID'], ENV['ALGOLIA_PUBLIC_API_KEY']);
  const index = client.initIndex('Tshirt');
  index.search(query, { hitsPerPage: 10, page: 0}).then(function searchDone(content) {
    console.log(content);
  }).catch(function searchFailure(err) {
    console.error(err);
  });
}


const initSearch = () => {
  const search = document.querySelector('form');
  search.addEventListener('submit', searchFunction(event));
}

export { initSearch };
