import React from "react";

import cheerio from "cheerio";

const fetchHtml = url =>
  fetch(url, {
    mode: "no-cors",
    headers: {
      "Content-Type": "text/html"
    }
  })
    .then(function(response) {
      console.log("response is", response);
      switch (response.status) {
        // status "OK"
        case 200:
          console.log("response");
          return response.text();
        // status "Not Found"
        case 404:
          throw response;
      }
    })
    .then(function(template) {
      console.log("template is", template);
      return template;
    })
    .catch(function(response) {
      // "Not Found"
      console.log(response.statusText);
    });

const TextCutter = ({ url = "" }) => {
  const [text, setText] = React.useState("");
  const [markIndicator, setMark] = React.useState(false);

  React.useEffect(() => {
    const loadUrl = async u => {
      const html = await fetchHtml(u);
      //   const res = cheerio.load(html);
      console.log(html, "uuuuu");
      setText(html);

      //   res(".tooltip-details-block").each((i, e) => {
      //     console.log(e);
      //   });
    };

    loadUrl(url);
  }, [setText]);

  console.log("text is", text);

  return <p>{text ? text : "fetching"}</p>;
};

export default TextCutter;
