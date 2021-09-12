#!/usr/bin/env -S deno run
import addSeconds from "https://deno.land/x/date_fns@v2.22.1/addSeconds/index.ts";
import formatDistanceToNowStrict from "https://deno.land/x/date_fns@v2.22.1/formatDistanceToNowStrict/index.js";

enum DurationSuffix {
  Years = "y",
  Months = "M",
  Weeks = "w",
  Days = "d",
  Hours = "h",
  Minutes = "m",
  Seconds = "s",
}

const durationInSeconds = {
  [DurationSuffix.Years]: 31557600,
  [DurationSuffix.Months]: 2629800,
  [DurationSuffix.Weeks]: 604800,
  [DurationSuffix.Days]: 86400,
  [DurationSuffix.Hours]: 3600,
  [DurationSuffix.Minutes]: 60,
  [DurationSuffix.Seconds]: 1,
};

type Seconds = number;

type Duration = {
  [DurationSuffix.Years]?: number;
  [DurationSuffix.Months]?: number;
  [DurationSuffix.Weeks]?: number;
  [DurationSuffix.Days]?: number;
  [DurationSuffix.Hours]?: number;
  [DurationSuffix.Minutes]?: number;
  [DurationSuffix.Seconds]?: number;
};

function sleep(ms: number) {
  return new Promise((resolve) => setTimeout(resolve, ms));
}

function convertDurationToSeconds(d: Duration): Seconds {
  let s = 0;
  const durationKeys = Object.keys(d) as DurationSuffix[];
  for (const key of durationKeys) {
    if (d[key] !== undefined) {
      s = s + (d[key] as number * durationInSeconds[key]);
    }
  }

  return s;
}

/**
 * ## Example of human duration string
 * 1y2M3w4d5h6m7s = 1 year, 2 months, 3 weeks, 4 days, 5 hours, 6 minutes, 7 seconds
 */
function parseHumanDuration(str: string): Seconds {
  // sanitize by removing all spaces
  const cleanStr = str.replaceAll(" ", "");
  const durationSuffixes = Object.values(DurationSuffix);
  const d: Duration = {};
  for (const suf of durationSuffixes) {
    const matches = cleanStr.match(new RegExp(`\\d+${suf}`));
    if (matches) d[suf] = parseInt(matches[0]);
  }

  return convertDurationToSeconds(d);
}

const totalSeconds = parseHumanDuration(Deno.args.join(""));

const future = addSeconds(new Date(), totalSeconds);

// const te = new TextEncoder();
while (future > new Date()) {
  const remaining = formatDistanceToNowStrict(future, {});
  console.log(remaining);
  // Deno.stdout.writeSync(
  //   te.encode(
  //     `${remaining}          \r`,
  //   ),
  // );
  await sleep(100);
}
