import argparse
from playwright.sync_api import sync_playwright

def take_screenshot(url: str, output_path: str):
    with sync_playwright() as p:
        browser = p.chromium.launch()
        page = browser.new_page()
        page.goto(url)
        page.screenshot(path=output_path)
        browser.close()

parser = argparse.ArgumentParser()
parser.add_argument("--output", type=str, default="screenshot.png")
args = parser.parse_args()

if __name__ == '__main__':
    take_screenshot('https://github.com/muratsat/30github', output_path=args.output)

