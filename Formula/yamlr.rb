# typed: false
# frozen_string_literal: true

# Homebrew Formula for Yamlr
# Install via: brew install yamlr/tap/yamlr
class Yamlr < Formula
  desc "Reconcile and repair Kubernetes configurations before deployment"
  homepage "https://yamlr.dev"
  version "0.1.0"
  # Yamlr is proprietary software; see the repository LICENSE for terms.
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://get.yamlr.dev/v#{version}/yamlr-macos-aarch64.tar.gz"
      sha256 "8ba56df5e06fb6093406a23611de4e92e7e2042ae11d76acce12deb13c1ac86c"
    else
      url "https://get.yamlr.dev/v#{version}/yamlr-macos-x86_64.tar.gz"
      sha256 "d1b494e3a12eada33cb1cc387f81edbb8fd026a5db418e430b3d78f1651c028a"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://get.yamlr.dev/v#{version}/yamlr-linux-x86_64.tar.gz"
      sha256 "2f5df6b3dd50531dc98845299c2c93326664bfdfcfc944e46c2b349e3a44541b"
    end
  end

  def install
    bin.install "yamlr"
  end

  test do
    assert_match "Configuration Resolution Plane", shell_output("#{bin}/yamlr --help")
  end
end
