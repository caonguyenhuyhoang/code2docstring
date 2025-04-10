name: CI Pipeline

on: [push, pull_request]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-python@v4
        with:
          python-version: "3.9"
      
      - name: Install dependencies
        run: |
          pip install -r requirements.txt
          pip install black flake8 bandit safety

      - name: Lint with Flake8
        run: flake8 .

      - name: Security scan
        run: bandit -r .

      - name: Check dependencies
        run: safety check
