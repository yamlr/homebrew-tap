# typed: false
# frozen_string_literal: true

# Homebrew Formula for Yamlr
# Install via: brew install yamlr/tap/yamlr
class Yamlr < Formula
  desc "Reconcile and repair Kubernetes configurations before deployment"
  homepage "https://yamlr.dev"
  version "0.1.2"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yamlr/releases/releases/download/v#{version}/yamlr-macos-aarch64.tar.gz"
      sha256 "65a026c71a0a1027c05ebd2dc86f749908808d94bd9ab1bc70494f7703120595"
    else
      url "https://github.com/yamlr/releases/releases/download/v#{version}/yamlr-macos-x86_64.tar.gz"
      sha256 "2899685b68f838bd69d6e02c82ba6f13ad6a05106429e6b4f8509ff131de8c20"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/yamlr/releases/releases/download/v#{version}/yamlr-linux-aarch64.tar.gz"
      sha256 "fe01e71ed950882a33962b6b34b11bd56b2f8836012116454808452c0efbac19"
    else
      url "https://github.com/yamlr/releases/releases/download/v#{version}/yamlr-linux-x86_64.tar.gz"
      sha256 "e5f2268655f164c002c946d50ccdf62b72974be159e885ac013d70180e75045c"
    end
  end

  def install
    bin.install "yamlr"
  end

  test do
    assert_match "Configuration Resolution Plane", shell_output("#{bin}/yamlr --help")
  end
end
