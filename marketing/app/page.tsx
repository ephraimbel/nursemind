import { Motion } from "./components/Motion";
import { Nav } from "./components/Nav";
import { Hero } from "./components/Hero";
import { Bundle } from "./components/Bundle";
import { Screenshots } from "./components/Screenshots";
import { Safety } from "./components/Safety";
import { Pricing } from "./components/Pricing";
import { FAQ } from "./components/FAQ";
import { DownloadCTA } from "./components/DownloadCTA";
import { Footer } from "./components/Footer";

export default function HomePage() {
  return (
    <Motion>
      <Nav />
      <main id="main-content" tabIndex={-1}>
        <Hero />
        <Bundle />
        <Screenshots />
        <Safety />
        <Pricing />
        <FAQ />
        <DownloadCTA />
      </main>
      <Footer />
    </Motion>
  );
}
