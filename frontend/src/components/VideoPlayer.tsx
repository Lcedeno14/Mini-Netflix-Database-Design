import React, { useState } from 'react';
import YouTube from 'react-youtube';
import { Button } from '@heroui/button';

interface VideoPlayerProps {
  videoId: string;
  title?: string;
}

const VideoPlayer: React.FC<VideoPlayerProps> = ({ videoId, title }) => {
  const [isPlaying, setIsPlaying] = useState(false);

  const opts = {
    width: '100%',
    height: '100%',
    playerVars: {
      autoplay: 0,
      controls: 1,
      modestbranding: 1,
    },
  };

  const onReady = (event: any) => {
    // Store the player instance
    const player = event.target;
    console.log('Video Player is ready:', player);
  };

  const onPlay = () => {
    setIsPlaying(true);
  };

  const onPause = () => {
    setIsPlaying(false);
  };

  return (
    <div className="flex flex-col items-center bg-white dark:bg-gray-800 rounded-lg shadow-md p-4 w-full">
      {title && (
        <h3 className="text-xl font-semibold mb-4">{title}</h3>
      )}
      <div className="relative w-full aspect-video bg-black rounded-lg overflow-hidden">
        <div className="absolute inset-0">
          <YouTube
            videoId={videoId}
            opts={opts}
            onReady={onReady}
            onPlay={onPlay}
            onPause={onPause}
            iframeClassName="w-full h-full"
            className="w-full h-full"
          />
        </div>
      </div>
      <div className="flex gap-4 mt-4">
        <Button
          variant="bordered"
          size="sm"
        >
          Add to Watchlist
        </Button>
        <Button
          variant="bordered"
          size="sm"
        >
          Share
        </Button>
      </div>
    </div>
  );
};

export default VideoPlayer; 