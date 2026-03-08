#!/bin/bash

# Install Flutter
if [ ! -d "flutter" ]; then
  git clone https://github.com/flutter/flutter.git -b stable --depth 1
fi

export PATH="$PATH:`pwd`/flutter/bin"

# Build
flutter doctor
flutter pub get
flutter build web --release

# Copy build output to root for Vercel
cp -r build/web/* .
