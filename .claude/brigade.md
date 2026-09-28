---
# flat — read by kitchen.sh too
trunk: main
check: "flutter analyze --no-fatal-warnings && dart format lib test --set-exit-if-changed && flutter test"
install: "flutter pub get && cd example && flutter pub get"
copy_into_stations: ""
kitchen: stations
stations: 2
migrations: none

# nested — read by skills
rail:
  adapter: markdown
  commit: direct
walk_in: []
gates:
  plan_approval: head-chef
  pre_commit: sous-chef
  merge: head-chef
  deploy: head-chef
clean:
  counters:
    - name: unused-code
      command: "flutter analyze --no-fatal-warnings 2>/dev/null | grep -E 'unused_(element|field|import|local_variable|catch_clause)'"
    - name: todo-comments
      command: "git grep -n -E 'TODO|FIXME' -- ':!docs'"
  umbrella: null
docs:
  specs: docs/specs
  backlog: docs/backlog
  plans: docs/plans
  checklists: docs/checklists
  research: docs/research
  brainstorm: docs/brainstorm
---
This is a published Flutter package (pub.dev), not an app. The public API is whatever
`lib/awesome_snackbar_content.dart` exports; treat any change to it as a breaking-change
question for the head chef.

The check mirrors CI (`.github/workflows/build.yaml`) without coverage, but uses
`flutter analyze`: on this machine a bare `dart analyze` can pick up a Dart SDK that
doesn't match Flutter and reports hundreds of false errors. CI runs
`flutter test --update-goldens`, so goldens never fail there; locally the check runs
plain `flutter test`, and a golden diff is a real finding. Never commit regenerated
goldens without saying why.

Releases (version bump in `pubspec.yaml`, `CHANGELOG.md` entry, `flutter pub publish`)
are a deploy: head chef only.

`example/` is a separate Flutter app with its own `pubspec.yaml`; UI changes should be
exercised there.

There are no shared local resources, so the walk-in is empty.
