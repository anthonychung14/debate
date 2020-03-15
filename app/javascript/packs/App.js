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

// client
//   .query({
//     query: gql`
//       {
//         allAuthors {
//           id
//           fullName
//         }
//       }
//     `
//   })
//   .then(result => console.log(result));

const App = props => {
  return (
    <ApolloProvider client={client}>
      <div>App {props.name}!</div>;
    </ApolloProvider>
  );
};

export default App;
