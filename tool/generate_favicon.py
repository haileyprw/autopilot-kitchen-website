#!/usr/bin/env python3
"""Resize app_logo.png into favicon and PWA icon sizes."""

from __future__ import annotations

import shutil
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
LOGO = ROOT / "assets/images/app_logo.png"
WEB = ROOT / "web"


def resize(size: int, out: Path) -> None:
    subprocess.run(
        ["sips", "-z", str(size), str(size), str(LOGO), "--out", str(out)],
        check=True,
        capture_output=True,
    )


def main() -> None:
    if not LOGO.exists():
        print(f"Missing logo: {LOGO}", file=sys.stderr)
        sys.exit(1)

    resize(32, WEB / "favicon.png")
    resize(192, WEB / "icons" / "Icon-192.png")
    resize(512, WEB / "icons" / "Icon-512.png")
    shutil.copy(WEB / "icons" / "Icon-192.png", WEB / "icons" / "Icon-maskable-192.png")
    shutil.copy(WEB / "icons" / "Icon-512.png", WEB / "icons" / "Icon-maskable-512.png")
    print("Generated favicon.png and web/icons/*.png from app_logo.png")


if __name__ == "__main__":
    main()
