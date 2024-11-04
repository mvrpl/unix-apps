class KeyringRs < Formula
  desc "Cross-platform library and utility to manage passwords"
  homepage "https://github.com/hwchen/keyring-rs"
  version "3.6.1"
  license "Apache-2.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/hwchen/keyring-rs/releases/download/v3.6.1/keyring-cli.linux"
    sha256 "db588ae429126f68fd70c92f68e037a45b99cd92d9da7e3b6a66bc4e3578e9d4"
  end

  if OS.mac?
    url "https://github.com/hwchen/keyring-rs/releases/download/v3.6.1/keyring-cli.macos"
    sha256 "01b05b1875047e3f06ff1c08deba7003a8b88503d1606816f224762f69161674"
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
