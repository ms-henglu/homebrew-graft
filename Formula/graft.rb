# typed: false
# frozen_string_literal: true

class Graft < Formula
  desc "Graft is a CLI tool that brings the Overlay Pattern (similar to Kustomize) to Terraform"
  homepage "https://github.com/ms-henglu/graft"
  version "0.2.0"
  license "MPL-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ms-henglu/graft/releases/download/v#{version}/graft_#{version}_Darwin_arm64.zip"
      sha256 "50e3dde121a139ac15e7f5e8f1743c36c70d7c1cbce4f90a1d6c10f18bce5407"
    else
      url "https://github.com/ms-henglu/graft/releases/download/v#{version}/graft_#{version}_Darwin_x86_64.zip"
      sha256 "b1e483eef4e1afd6265fa2e667e02f631a23caa0c13110627ef6324e9752bcb8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ms-henglu/graft/releases/download/v#{version}/graft_#{version}_Linux_arm64.zip"
      sha256 "7a7e0f76d7f4e4a77029313373398a3efaf43e642c8e616d9468899cd1f07e77"
    else
      url "https://github.com/ms-henglu/graft/releases/download/v#{version}/graft_#{version}_Linux_x86_64.zip"
      sha256 "2727b18ca76f93d86e6f5ca77c2c0514a8df975a844fb3818f3678544bd0c150"
    end
  end

  def install
    bin.install "graft"
  end

  test do
    assert_match "graft version v#{version}", shell_output("#{bin}/graft --version")
  end
end
