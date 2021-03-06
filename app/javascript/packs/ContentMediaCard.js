import React from "react";

import ReactPlayer from "react-player";
import ReactAudioPlayer from "react-audio-player";

// const first =
//   "http://content.blubrry.com/52716/Defenders_3_Doctrine_of_Creation_Part_1_.mp3";

const YouTubePlayer = ({
  url,
  handleProgress,
  handlePause,
  handleSeek,
  playerRef
}) => {
  return (
    // TODO: fix inline styles
    <div style={{ position: "relative", height: "400px" }}>
      <ReactPlayer
        url={url}
        playing
        onPause={handlePause}
        onProgress={handleProgress}
        onSeek={handleSeek}
        width="100%"
        height="100%"
        controls
        ref={playerRef}
      />
    </div>
  );
};

function useMarkPosition(markType) {
  const [position, setPosition] = React.useState(0);

  const markPosition = React.useCallback(
    seconds => {
      setPosition(seconds);
    },
    [setPosition]
  );

  return [position, markPosition];
}

// <ReactAudioPlayer src={first} autoPlay controls />
// Time-bound excerpt maker
const ExcerptMaker = ({ contentId, seconds, seekTo }) => {
  const [start, setStart] = useMarkPosition("start");
  const [end, setEnd] = useMarkPosition("end");

  return (
    <div>
      <div
        style={{
          flexDirection: "row",
          justifyContent: "space-around",
          display: "flex"
        }}
      >
        <div>
          <button onClick={() => setStart(seconds)}>Set Start</button>
          <h4>{start}</h4>
          <button onClick={() => seekTo(start)}>Go Start</button>
        </div>
        <div>
          <button onClick={() => setEnd(seconds)}>Set End</button>
          <h4>{end}</h4>
          <button onClick={() => seekTo(end)}>Go End</button>
        </div>
      </div>
      <div
        style={{
          border: "1px black solid",
          textAlign: "center",
          height: "20px"
        }}
      >
        <button>MAKE EXCERPT</button>
      </div>
    </div>
  );
};

const AudioPlayer = ({ playerRef }) => {
  return <ReactAudioPlayer />;
};

const MediaPlayer = ({
  contentCategory,
  handlers,
  playerRef,
  url = "https://www.youtube.com/watch?v=DZIA7H24F48&list=RDDZIA7H24F48&start_radio=1"
}) => {
  if (contentCategory === "PODCAST") {
    return <AudioPlayer />;
  }

  return <YouTubePlayer {...handlers} playerRef={playerRef} url={url} />;
};

const ContentMediaCard = ({ contentId }) => {
  const [seconds, setSeconds] = React.useState(0);
  const [markIndicator, setMark] = React.useState(false);
  const playerRef = React.useRef(null);

  const handlePause = React.useCallback(
    e => {
      setMark(!markIndicator);
    },
    [setMark, markIndicator]
  );

  const handleSeek = React.useCallback(
    seconds => {
      setSeconds(seconds);
    },
    [setSeconds]
  );

  const seekTo = React.useCallback(
    s => {
      if (playerRef && playerRef.current) {
        playerRef.current.seekTo(s);
      }
    },
    [playerRef]
  );

  const handleProgress = React.useCallback(
    ({ playedSeconds }) => {
      setSeconds(playedSeconds);
    },
    [setSeconds]
  );

  const handlers = { handlePause, handleSeek, handleProgress };

  return (
    <div style={{ flexDirection: "space-between", flex: 1 }}>
      <MediaPlayer
        handlers={handlers}
        contentCategory=""
        playerRef={playerRef}
      />
      <ExcerptMaker seconds={seconds} seekTo={seekTo} contentId={contentId} />
    </div>
  );
};

export default ContentMediaCard;
