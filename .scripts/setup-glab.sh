#!/bin/sh
if [ -f /etc/redhat-release ]; then
  echo "Red Hat-based distribution detected."

  echo "Downloads glab cli RPM:"
  curl -OL https://gitlab.com/gitlab-org/cli/-/releases/v1.58.0/downloads/glab_1.58.0_linux_amd64.rpm

  echo "Installing glab cli RPM:"
  sudo rpm -ivh glab_1.58.0_linux_amd64.rpm
  sudo dnf update
  sudo dnf install -y glab

  echo "Clean up..."
  rm glab_1.58.0_linux_amd64.rpm
elif [ -f /etc/debian_version ]; then
  echo "Not implemented yet."
fi
