# chasqui_frontend

Demo flutter web project.

## Getting Started

NOTE: This project is only for local/demo use since It exposes the secrets for the freshbooks service

Using the PRs linked to this issue:
https://github.com/flutter/flutter/issues/33245#issuecomment-598879127

- https://github.com/flutter/engine/pull/17829
- https://github.com/flutter/flutter/pull/55232


Build the engine locally:
flutter build web --local-engine-src-path /path/to/flutter/engine/src \
  --local-engine=host_debug_unopt --release --verbose \
  --dart-define=flutter.web.usePathStrategy=true

Running the APP:
flutter run --local-engine-src-path /path/to/flutter/engine/src --local-engine=host_debug_unopt \
  -d web-server --web-port=8888 --release \
  --dart-define=flutter.web.usePathStrategy=true
