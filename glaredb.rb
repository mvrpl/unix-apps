class GlareDb < Formula
  desc "An analytics DBMS for distributed data"
  homepage "https://github.com/GlareDB/glaredb"
  version "0.9.5"
  license "AGPL-3.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/GlareDB/glaredb/releases/download/v0.9.5/glaredb-x86_64-unknown-linux-gnu.zip"
    sha256 "c30eae952414a61093175e5573668bcf93b249fcd9a9e648ce7e4b8e0073ad4b"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/GlareDB/glaredb/releases/download/v0.9.5/glaredb-aarch64-apple-darwin.zip"
      sha256 "993bbe727d786d1da6893fc1a8285bb462778529b36bc41761cc1be7454ab280"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/GlareDB/glaredb/releases/download/v0.9.5/glaredb-x86_64-apple-darwin.zip"
      sha256 "9ade9330f32c17d32b145982e4d1d0c8b8007e12eac8be0993f7a4717b624181"
    end
  end

  def install
    bin.install "glaredb"
  end
end