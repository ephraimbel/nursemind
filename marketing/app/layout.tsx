import type { Metadata, Viewport } from "next";
import { Inter, Instrument_Serif, JetBrains_Mono } from "next/font/google";
import "./globals.css";

const inter = Inter({
  subsets: ["latin"],
  variable: "--font-inter",
  display: "swap",
});

const instrumentSerif = Instrument_Serif({
  subsets: ["latin"],
  weight: "400",
  style: ["normal", "italic"],
  variable: "--font-instrument-serif",
  display: "swap",
});

const jetbrainsMono = JetBrains_Mono({
  subsets: ["latin"],
  variable: "--font-jetbrains-mono",
  display: "swap",
});

export const metadata: Metadata = {
  metadataBase: new URL("https://nursemind.app"),
  title: {
    default: "NurseMind — A clinical reference, redesigned for clarity.",
    template: "%s · NurseMind",
  },
  description:
    "A cited reference library, a complete suite of nursing calculators, and an AI co-pilot — built for nursing students and licensed nurses for study, NCLEX prep, and self-directed learning. Not a clinical decision tool.",
  applicationName: "NurseMind",
  authors: [{ name: "NurseMind" }],
  keywords: [
    "nursing study",
    "nursing reference",
    "NCLEX prep",
    "nursing calculators",
    "clinical learning",
    "nurse education",
    "evidence-based nursing",
  ],
  openGraph: {
    type: "website",
    title: "NurseMind",
    description:
      "A clinical reference, redesigned for clarity. A cited library, the calculator suite, and an AI co-pilot — for studying and self-directed learning.",
    url: "https://nursemind.app",
    siteName: "NurseMind",
  },
  twitter: {
    card: "summary_large_image",
    title: "NurseMind",
    description:
      "A clinical reference, redesigned for clarity. For nursing study and self-directed learning.",
  },
  icons: {
    icon: "/favicon.svg",
  },
};

export const viewport: Viewport = {
  themeColor: "#f4f2ec",
  width: "device-width",
  initialScale: 1,
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html
      lang="en"
      className={`${inter.variable} ${instrumentSerif.variable} ${jetbrainsMono.variable}`}
    >
      <body>{children}</body>
    </html>
  );
}
