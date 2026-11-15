# typed: false
# frozen_string_literal: true

# Homebrew Formula for Yamlr
# Install via: brew install yamlr/tap/yamlr
class Yamlr < Formula
  desc "Reconcile and repair Kubernetes configurations before deployment"
  homepage "https://yamlr.dev"
  version "0.1.1"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://get.yamlr.dev/v#{version}/yamlr-macos-aarch64.tar.gz"
      sha256 "c83859827cb87ae589b3a0b2ae3767cc537d0a87875c2bcfbb031cafaec2c28b"
    else
      url "https://get.yamlr.dev/v#{version}/yamlr-macos-x86_64.tar.gz"
      sha256 "740506d77ac24a9414f1b064c0fc38398495a5e9c7f1891e4a8319e6f007529e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://get.yamlr.dev/v#{version}/yamlr-linux-aarch64.tar.gz"
      sha256 "283da03888e132b50334800a8aec513a004f9bac8c8479a0ad75d91a124e42df"
    else
      url "https://get.yamlr.dev/v#{version}/yamlr-linux-x86_64.tar.gz"
      sha256 "de6a5eef460a8e379fbe535aedd5dd6ce9f83ecaf7fd85f3a067ef3c3e98d044"
    end
  end

  def install
    bin.install "yamlr"
  end

  test do
    assert_match "Configuration Resolution Plane", shell_output("#{bin}/yamlr --help")
  end
end