import { Route, Routes } from "react-router-dom";

import IndexPage from "@/pages/index";
import DocsPage from "@/pages/docs";
import PricingPage from "@/pages/pricing";
import BlogPage from "@/pages/blog";
import AboutPage from "@/pages/about";
import AuthForm from "./components/AuthForm";
import Home from "./components/Home";

function App() {
  return (
    <Routes>
      <Route path="/" element={<AuthForm />} />
      <Route path="/home" element={<Home />} />
    </Routes>
  );
}

export default App;
