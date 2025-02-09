# 30-Day GitHub Challenge

♪ A full commitment's what I'm thinking of ♪

**Problem**: You don't have enough commitment to push to GitHub every day for 30 days.

**Solution**: Automate it with a cron job that commits daily without your involvement.

---

## Overview

We will create a Python script that takes a screenshot of our repository and runs it every day.

### Taking a Screenshot

A screenshot script might be overkill for our use case, but it's a nice opportunity to learn about playwright.

```python
from playwright.sync_api import sync_playwright

def take_screenshot(url: str, output_path: str):
    with sync_playwright() as p:
        browser = p.chromium.launch()
        page = browser.new_page()
        page.goto(url)
        page.screenshot(path=output_path)
        browser.close()
```

The full code is available in [make_screenshot.py](./make_screenshot.py).

To make it work, install the required dependencies:

```sh
# Create a virtual environment
python3 -m venv .venv
source .venv/bin/activate

# Install dependencies
pip install playwright
playwright install-deps
playwright install
```

---

## Committing and Pushing to GitHub

We will create a script that runs the Python script and commits the screenshot to GitHub. The [script](./cron.sh) is self-explanatory.

---

## Running It Daily

We will use `crontab` to schedule the script to run every day.

```sh
crontab -e
```

Add the following line to the file:

```
0 18 * * * <cloned-location>/cron.sh
```

Save and exit.
