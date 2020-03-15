import React from "react";
import { ApolloProvider } from "@apollo/react-hooks";
import ApolloClient from "apollo-boost";
import { gql } from "apollo-boost";

const client = new ApolloClient({
  fetchOptions: {
    credentials: "same-origin"
  },
  request: operation => {
    const csrfToken = document
      .querySelector("meta[name=csrf-token]")
      .getAttribute("content");
    operation.setContext({
      headers: { "X-CSRF-Token": csrfToken }
    });
  }
});

const RESOURCE_MAP = {
  Author: "fullName",
  Creator: "email"
};

const fetchAllQuery = async resourceName =>
  await client
    .query({
      query: gql`
        {
          all${resourceName}s {
            id
            ${RESOURCE_MAP[resourceName]}
          }
        }
      `
    })
    .then(({ data }) => data[`all${resourceName}s`]);

const useFetchAll = resourceName => {
  const [data, setData] = React.useState([]);

  React.useEffect(() => {
    const setFetchAll = async () => {
      const allQueryData = await fetchAllQuery(resourceName);
      setData(allQueryData);
    };
    setFetchAll();
  }, [setData]);

  return data;
};

const App = props => {
  const data = useFetchAll("Author");
  const sourceContent = useFetchAll("SourceContent");

  const [formState, setFormState] = React.useState(false);
  const toggleCreate = React.useCallback(
    e => {
      setFormState(!formState);
    },
    [formState, setFormState]
  );

  return (
    <ApolloProvider client={client}>
      <h2>Authors</h2>
      <ol>
        {data.map(i => (
          <li key={i.id}>
            <h4>{i.fullName}</h4>
          </li>
        ))}
      </ol>

      <h2>Source Content</h2>
      <button onClick={toggleCreate}>Create Source Content</button>
      {formState && (
        <form>
          <input name="link" />
        </form>
      )}
      {sourceContent.map(i => (
        <li key={i.id}>
          <h4>{i.title}</h4>
        </li>
      ))}
    </ApolloProvider>
  );
};

export default App;
