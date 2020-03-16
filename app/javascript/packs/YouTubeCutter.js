import React from "react";

import ReactPlayer from "react-player";
import ReactAudioPlayer from "react-audio-player";

const first =
  "http://content.blubrry.com/52716/Defenders_3_Doctrine_of_Creation_Part_1_.mp3";

const YouTubeCutter = ({
  // url = "http://content.blubrry.com/52716/Defenders_3_Doctrine_of_Creation_Part_1_.mp3"
  url = ""
}) => {
  const [seconds, setSeconds] = React.useState(0);
  const [markIndicator, setMark] = React.useState(false);

  const handlePause = React.useCallback(
    e => {
      setMark(!markIndicator);
    },
    [seconds, setMark, markIndicator]
  );

  const handleSeek = React.useCallback(
    seconds => {
      setSeconds(seconds);
    },
    [setSeconds]
  );

  const handleProgress = React.useCallback(
    ({ playedSeconds }) => {
      setSeconds(playedSeconds);
    },
    [setSeconds]
  );

  return (
    // <ReactPlayer
    //   url={url}
    //   playing
    //   onPause={handlePause}
    //   onProgress={handleProgress}
    //   onSeek={handleSeek}
    // />
    <ReactAudioPlayer src={first} autoPlay controls />
  );
};

export default YouTubeCutter;
