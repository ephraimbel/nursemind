export function Wordmark({
  size = "md",
}: {
  size?: "sm" | "md" | "lg";
}) {
  const sizes = {
    sm: "text-[18px]",
    md: "text-[21px]",
    lg: "text-[28px]",
  };

  return (
    <span
      className={`font-[family-name:var(--font-serif)] ${sizes[size]} tracking-[-0.02em] text-[color:var(--color-ink)] leading-none`}
    >
      Nursemind
    </span>
  );
}
