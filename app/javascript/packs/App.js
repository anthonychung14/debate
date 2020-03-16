import React from "react";
import { ApolloProvider } from "@apollo/react-hooks";
import ApolloClient from "apollo-boost";
import { gql } from "apollo-boost";

import YouTubeCutter from "./YouTubeCutter";
import TextCutter from "./TextCutter";

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
  Creator: "email",
  SourceContent: "title"
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
  // const data = useFetchAll("Author");
  // const sourceContent = useFetchAll("SourceContent");

  const [formState, setFormState] = React.useState(true);
  const toggleCreate = React.useCallback(
    e => {
      setFormState(!formState);
    },
    [formState, setFormState]
  );

  const fetchLink = React.useCallback(e => {
    console.log("e.target.value is", e.target.value);
  }, []);

  return (
    <ApolloProvider client={client}>
      {/* <h2>Authorssss</h2>
      <ol>
        {data.map(i => (
          <li key={i.id}>
            <h4>{i.fullName}</h4>
          </li>
        ))}
      </ol> */}

      <YouTubeCutter />
      {/* <h2>Source Content</h2>
      <button onClick={toggleCreate}>Create Source Content</button>
      {formState && (
        <form>
          <input name="link" onBlur={fetchLink} />
        </form>
      )}

      <ol>
        {sourceContent.map(i => (
          <li key={i.id}>
            <h4>{i.title}</h4>
          </li>
        ))}
      </ol> */}
    </ApolloProvider>
  );
};

export default App;
