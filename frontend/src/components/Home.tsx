import React from "react";
import { Button } from "@heroui/button";
import VideoPlayer from "./VideoPlayer";

// ========== HOW TO ADD YOUTUBE VIDEOS ==========
// 1. To get a YouTube video ID:
//    - Go to the YouTube video you want to add
//    - From the URL, copy the part after 'v='
//    - Example: https://youtube.com/watch?v=dQw4w9WgXcQ
//              The ID would be: dQw4w9WgXcQ
//
// 2. Add your video below in the sampleVideos object:
//    - For featured: Replace the 'id' and 'title'
//    - For trending: Add new objects to the array with 'id' and 'title'
//    - You can add as many videos as you want to the trending array

const sampleVideos = {
  featured: {
    id: "dQw4w9WgXcQ", // Replace with your featured video ID
    title: "Featured Movie"
  },
  trending: [
    // Add more videos by copying this format:
    { id: "6ZfuNTqbHE8", title: "Trending Movie 1" },
    { id: "M7lc1UVf-VE", title: "Trending Movie 2" }
    // Example of adding more videos:
    // { id: "YOUR_VIDEO_ID", title: "Your Movie Title" },
    // { id: "ANOTHER_VIDEO_ID", title: "Another Movie" },
  ]
};

const Home: React.FC = () => {
  return (
    <div className="container mx-auto px-4 py-8">
      <h1 className="text-4xl font-bold mb-8">Welcome to Mini Netflix</h1>
      
      {/* Featured Video Section */}
      <div className="mb-12">
        <h2 className="text-2xl font-semibold mb-4">Featured</h2>
        <VideoPlayer 
          videoId={sampleVideos.featured.id} 
          title={sampleVideos.featured.title} 
        />
      </div>

      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
        {/* Continue Watching Section */}
        <div className="col-span-full bg-white dark:bg-gray-800 rounded-lg shadow-md">
          <div className="p-4 flex justify-between items-center border-b border-gray-200 dark:border-gray-700">
            <h2 className="text-2xl font-semibold">Continue Watching</h2>
            <Button variant="bordered" size="sm">
              See All
            </Button>
          </div>
          <div className="p-4 grid grid-cols-1 md:grid-cols-2 gap-4">
            {sampleVideos.trending.map((video) => (
              <VideoPlayer 
                key={video.id}
                videoId={video.id}
                title={video.title}
              />
            ))}
          </div>
        </div>

        {/* Trending Now Section */}
        <div className="col-span-full bg-white dark:bg-gray-800 rounded-lg shadow-md">
          <div className="p-4 flex justify-between items-center border-b border-gray-200 dark:border-gray-700">
            <h2 className="text-2xl font-semibold">Trending Now</h2>
            <Button variant="bordered" size="sm">
              See All
            </Button>
          </div>
          <div className="p-4 grid grid-cols-1 md:grid-cols-2 gap-4">
            {sampleVideos.trending.map((video) => (
              <VideoPlayer 
                key={video.id}
                videoId={video.id}
                title={video.title}
              />
            ))}
          </div>
        </div>

        {/* My List Section */}
        <div className="col-span-full bg-white dark:bg-gray-800 rounded-lg shadow-md">
          <div className="p-4 flex justify-between items-center border-b border-gray-200 dark:border-gray-700">
            <h2 className="text-2xl font-semibold">My List</h2>
            <Button variant="bordered" size="sm">
              See All
            </Button>
          </div>
          <div className="p-4">
            <p className="text-gray-500">Your saved shows and movies will appear here</p>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Home; 