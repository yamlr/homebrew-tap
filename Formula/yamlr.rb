# typed: false
# frozen_string_literal: true

# Homebrew Formula for Yamlr
# Install via: brew install yamlr/tap/yamlr
class Yamlr < Formula
  desc "Reconcile and repair Kubernetes configurations before deployment"
  homepage "https://yamlr.dev"
  version "0.1.0"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://get.yamlr.dev/v#{version}/yamlr-macos-aarch64.tar.gz"
      sha256 "82bfd96d23721cc312a31a4ad2f2ae80abf3688d19a52460bcd953dfe793cd62"
    else
      url "https://get.yamlr.dev/v#{version}/yamlr-macos-x86_64.tar.gz"
      sha256 "4b43e3770e417b3d22e2fe549da78f3b0636ff70a233da5cba0c69aeb063470c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://get.yamlr.dev/v#{version}/yamlr-linux-aarch64.tar.gz"
      sha256 "d8d3d114aab9e267ff09eb876176af989b03786fd5543c057c76509a6fa79f39"
    else
      url "https://get.yamlr.dev/v#{version}/yamlr-linux-x86_64.tar.gz"
      sha256 "42231860b97d32c84e535a82f5049079cc64c8cdf65f71f35483d5b3134199e6"
    end
  end

  def install
    bin.install "yamlr"
  end

  test do
    assert_match "Configuration Resolution Plane", shell_output("#{bin}/yamlr --help")
  end
end
