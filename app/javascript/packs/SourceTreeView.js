import React from "react";
import Select from "react-select";
import Creatable from "react-select/creatable";
// import { FixedSizeTree as Tree } from "react-vtree";

import ContentMediaCard from "./ContentMediaCard";

const makeChildren = num => children.slice(num);

const CONTENT_CATEGORIES = [
  { value: "PODCAST", label: "PODCAST" },
  { value: "YOUTUBE", label: "YOUTUBE" },
  { value: "BOOK", label: "BOOK" }
];

const children = [
  {
    title: "title",
    content_category: "PODCAST",
    link: "link"
  },
  {
    title: "bar title",
    content_category: "PODCAST",
    link: "link"
  },
  {
    title: "baz",
    content_category: "PODCAST",
    link: "link"
  }
];

const DATA = [
  {
    fullName: "Anthony Chung",
    id: "a",
    sourceContentWorks: makeChildren(1)
  },
  {
    fullName: "Bob Fullname",
    id: "b",
    sourceContentWorks: makeChildren(2)
  },
  {
    fullName: "Charlie Chaplin",
    id: "c",
    sourceContentWorks: makeChildren(0)
  }
];

const ROW = {
  display: "flex",
  flex: "row",
  justifyContent: "flex-start",
  alignItems: "center",
  border: "1px black solid"
};

const Row = ({ children, style, onClick }) => (
  <div style={{ ...ROW, ...style }} onClick={onClick}>
    {children}
  </div>
);

const SourceContent = ({
  id,
  title,
  setViewState,
  authorId,
  selectedViewState
}) => {
  // TODO: make this better
  const handleView = React.useCallback(() => {
    setViewState({ sourceContentId: title, authorId });
  }, [setViewState, title, authorId]);

  return (
    <Row
      style={{ padding: "1%", justifyContent: "space-around" }}
      onClick={handleView}
    >
      <h5>{title}</h5>
      {!selectedViewState.authorId && <p>{authorId}</p>}
    </Row>
  );
};

const SourceContentForm = () => (
  <div
    style={{
      display: "flex",
      flexDirection: "column",
      border: "1px red solid",
      marginLeft: "5%",
      padding: "2%"
    }}
  >
    <h3>Add Source Content</h3>
    <form>
      <fieldset id="group1">
        <Select options={CONTENT_CATEGORIES} />
      </fieldset>
      <fieldset id="group2">
        <input name="link" type="url" required />
      </fieldset>

      <fieldset id="group3">
        <button type="submit">Submit</button>
      </fieldset>
    </form>
  </div>
);

const SourceContentWorks = ({
  id,
  open,
  sourceContentId,
  sourceContentWorks,
  setViewState,
  selectedViewState
}) => (
  <div
    key={`data-${id}`}
    style={{
      display: "flex",
      flexDirection: "column",
      border: "1px red solid",
      marginLeft: "5%"
    }}
  >
    {open[id] &&
      sourceContentWorks.map(i =>
        !sourceContentId || i.title === sourceContentId ? (
          <SourceContent
            {...i}
            setViewState={setViewState}
            authorId={id}
            selectedViewState={selectedViewState}
          />
        ) : null
      )}
    {sourceContentId && <ContentMediaCard contentId={sourceContentId} />}
  </div>
);

function SourceTreeView() {
  const [data, setData] = React.useState(DATA);
  const [open, toggleSetOpen] = React.useState({});
  const [resourceAdding, setAddResource] = React.useState("");
  const [selectedViewState, setViewState] = React.useState({});
  const { sourceContentId, authorId } = selectedViewState;

  const handleToggle = React.useCallback(
    id => {
      if (resourceAdding) return;

      if (!id) {
        toggleSetOpen({});
      } else {
        toggleSetOpen({ ...open, [id]: !open[id] });
      }
      setAddResource("");
    },
    [open, toggleSetOpen, resourceAdding]
  );

  return (
    <div className="App">
      <Row style={{ padding: "2%" }}>
        <h3>Card View</h3>
        {sourceContentId && (
          <button
            onClick={() => {
              setViewState({});
              toggleSetOpen({});
              setAddResource("");
            }}
          >
            Clear
          </button>
        )}
      </Row>
      {data.map(({ id, sourceContentWorks, fullName }) =>
        id === authorId ||
        id === resourceAdding ||
        (!authorId && !resourceAdding) ? (
          <div>
            <div
              key={id}
              style={{
                ...ROW,
                backgroundColor: open[id] ? "silver" : null
              }}
              onClick={() => {
                handleToggle(id);
                if (authorId) {
                  setViewState({});
                }
              }}
            >
              <h4 style={{ padding: "1%" }}>{fullName}</h4>
              <div style={{ padding: "1%" }}>
                <button
                  onClick={e => {
                    e.stopPropagation();

                    if (resourceAdding === id) {
                      setAddResource("");
                    } else {
                      setAddResource(id);
                      toggleSetOpen({});
                    }
                  }}
                >
                  {resourceAdding ? "Clear" : "Add Content Source"}
                </button>
              </div>
            </div>
            {resourceAdding === id && <SourceContentForm />}

            {open[id] && (
              <SourceContentWorks
                id={id}
                open={open}
                sourceContentId={sourceContentId}
                sourceContentWorks={sourceContentWorks}
                setViewState={setViewState}
                selectedViewState={selectedViewState}
              />
            )}
          </div>
        ) : null
      )}
    </div>
  );
}

export default SourceTreeView;
