#!/usr/bin/env python3

import sys
import locale
import argparse
import urllib.request
import json
from datetime import date, datetime

HOLIDATA_BASE_URL="https://holidata.net"

# Example holiday for reference:
# {
#   "locale": "en-US",
#   "region": "MA",
#   "date": "2020-04-20",
#   "description": "Patriot's Day",
#   "type": "NF",
#   "notes": ""
# }

def main():
  parser = argparse.ArgumentParser(description="""
  Fetch holiday data from holidata.net and generate a holiday configuration for Taskwarrior.
  """)

  default_locale = system_locale()
  locale_required = default_locale is None

  parser.add_argument(
      "-l", metavar="<locale>",
      type=str, nargs=1, default=default_locale, required=locale_required,
      help="Language & optional country code (e.g. en, en-US, es-ES)")

  parser.add_argument(
      "-y", metavar="<year>",
      type=int, nargs=1, default=date.today().year, required=False,
      help="Year of holiday information to fetch (e.g. 2020)")

  parser.add_argument(
      "-r", metavar="<region>",
      type=str, required=False, action="append", default=[],
      help="Optional region(s) within locale to include holidays from (e.g. NC)")

  args = parser.parse_args()

  with urllib.request.urlopen(holidata_url(args.l, args.y)) as res:
    i = 1
    for holiday_json in res.readlines():
      holiday = json.loads(holiday_json.decode())

      if is_applicable_holiday(args, holiday):
        holiday_id = f"{args.l}{i}"
        holiday_name = holiday["description"]
        holiday_date = reformat_datetime(holiday["date"], "%Y-%m-%d", "%Y%m%d")

        print(f"holiday.{holiday_id}.name={holiday_name}")
        print(f"holiday.{holiday_id}.date={holiday_date}")
        i += 1

def system_locale():
  loc, _ = locale.getlocale()
  if loc is None:
    return None
  return loc.replace("_", "-")

def holidata_url(locale, year):
  return f"{HOLIDATA_BASE_URL}/{locale}/{year}.json"

def reformat_datetime(datetime_string, src_fmt, dst_fmt):
  return datetime.strptime(datetime_string, src_fmt).strftime(dst_fmt)

def is_applicable_holiday(args, holiday):
  return holiday["region"] == "" or holiday["region"] in args.r

if __name__ == "__main__":
  try:
    main()
    sys.exit()
  except Exception as e:
    sys.stderr.write("error: " + str(e))
    sys.exit(1)
