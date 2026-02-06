# typed: false
# frozen_string_literal: true

class Graft < Formula
  desc "Graft is a CLI tool that brings the Overlay Pattern (similar to Kustomize) to Terraform"
  homepage "https://github.com/ms-henglu/graft"
  version "0.1.0"
  license "MPL-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ms-henglu/graft/releases/download/v#{version}/graft_#{version}_Darwin_arm64.zip"
      sha256 "0338737329996be073faa0c70d69371c971d73a7ac1dd40da88c5f386ef080b3"
    else
      url "https://github.com/ms-henglu/graft/releases/download/v#{version}/graft_#{version}_Darwin_x86_64.zip"
      sha256 "17664fe4420a3c911d83b6ec12368bf12f6aabef682342a8bf2de8c98b01e5dc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ms-henglu/graft/releases/download/v#{version}/graft_#{version}_Linux_arm64.zip"
      sha256 "a12003e8a2bc3c54862d9d225668990dd3a7d78f7a5af6ab9d11d03b36018f7c"
    else
      url "https://github.com/ms-henglu/graft/releases/download/v#{version}/graft_#{version}_Linux_x86_64.zip"
      sha256 "8801b8061a652469ff97af149e4e6966b926a4cd2099b03ed7e759a61f6ae728"
    end
  end

  def install
    bin.install "graft"
  end

  test do
    assert_match "graft version v#{version}", shell_output("#{bin}/graft --version")
  end
end
