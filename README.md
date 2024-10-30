# Clickup task ID pre-commit hook

This is a simple hook that checks if your commit's title contains a Clickup task ID, e.g. `[SPACE-123]`.

## Configuration

Create or update your `.pre-commit-config.yaml` with

```yaml
repos:
  - repo: https://github.com/remmeltpit/clickup-task-id-pre-commit
    rev: v1.0.0
    hooks:
      - id: check-for-clickup-task-id
        args: ['WEB', 'SPACE']
```

Where the args are the spaces that should be allowed for this team or repository.

Defaults for spaces are `'BUG', 'DE', 'DEVEX'`, so if that is your list, you can omit the hook and args.

To install the custom pre-commit stage, run this command:

```bash
pre-commit install --hook-type commit-msg
```

