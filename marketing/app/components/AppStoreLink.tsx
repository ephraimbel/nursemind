import { ArrowUpRight } from "./icons";

export const APP_STORE_URL =
  "https://apps.apple.com/us/app/nursemind/id6767489231";

export function AppStoreLink({
  className = "",
  children = "Download for iPhone",
}: {
  className?: string;
  children?: React.ReactNode;
}) {
  return (
    <a
      href={APP_STORE_URL}
      target="_blank"
      rel="noopener noreferrer"
      className={`btn-primary ${className}`}
    >
      {children}
      <ArrowUpRight width={16} height={16} />
    </a>
  );
}
