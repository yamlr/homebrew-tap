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
      url "https://github.com/yamlr/releases/releases/download/v#{version}/yamlr-macos-aarch64.tar.gz"
      sha256 "491985cdd8cff56aaf765ba369a99f9de28d6cc8430d8b2b2f6536613ee01753"
    else
      url "https://github.com/yamlr/releases/releases/download/v#{version}/yamlr-macos-x86_64.tar.gz"
      sha256 "ec646eb9f3c299f7e68bcd42a970c37ad3efd2a9b94b717b822706548f1b29b4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yamlr/releases/releases/download/v#{version}/yamlr-linux-aarch64.tar.gz"
      sha256 "283da03888e132b50334800a8aec513a004f9bac8c8479a0ad75d91a124e42df"
    else
      url "https://github.com/yamlr/releases/releases/download/v#{version}/yamlr-linux-x86_64.tar.gz"
      sha256 "41107c43dc889e192c30c4894957a01639c44f3cf9291639b40368b663d1c1a7"
    end
  end

  def install
    bin.install "yamlr"
  end

  test do
    assert_match "Configuration Resolution Plane", shell_output("#{bin}/yamlr --help")
  end
end