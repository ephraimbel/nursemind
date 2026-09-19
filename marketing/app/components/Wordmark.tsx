export function Wordmark({ size = "md" }: { size?: "sm" | "md" | "lg" }) {
  return (
    <span
      className={`brand-wordmark brand-wordmark-${size}`}
      role="img"
      aria-label="nursemind"
    />
  );
}
