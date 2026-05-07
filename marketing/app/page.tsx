import { Nav } from "./components/Nav";
import { Hero } from "./components/Hero";
import { Bundle } from "./components/Bundle";
import { Screenshots } from "./components/Screenshots";
import { Safety } from "./components/Safety";
import { Pricing } from "./components/Pricing";
import { AndroidNote } from "./components/AndroidNote";
import { FAQ } from "./components/FAQ";
import { DownloadCTA } from "./components/DownloadCTA";
import { Footer } from "./components/Footer";

export default function HomePage() {
  return (
    <>
      <Nav />
      <main>
        <Hero />
        <Bundle />
        <Screenshots />
        <Safety />
        <Pricing />
        <AndroidNote />
        <FAQ />
        <DownloadCTA />
      </main>
      <Footer />
    </>
  );
}
