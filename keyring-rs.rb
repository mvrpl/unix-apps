class KeyringRs < Formula
  desc "Cross-platform library and utility to manage passwords"
  homepage "https://github.com/hwchen/keyring-rs"
  version "3.6.2"
  license "Apache-2.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/hwchen/keyring-rs/releases/download/v3.6.2/keyring-cli.linux"
    sha256 "5375735d53e31024779701329e232fe8495041b9d912dcefb9c79f811007c436"
  end

  if OS.mac?
    url "https://github.com/hwchen/keyring-rs/releases/download/v3.6.2/keyring-cli.macos"
    sha256 "12e9508e425857983357adef16cdf588bd54e60319b1802a9e42d9b559dc3f07"
  end

  def install
    if OS.linux?
      bin.install "keyring-cli.linux" => "keyring-cli"
    end
    if OS.mac?
      bin.install "keyring-cli.macos" => "keyring-cli"
    end
  end
end
