class Dataflow < Formula
  desc "ETL configurable written in Rust"
  homepage "https://github.com/mvrpl/dataflow"
  version "0.2.1"
  license "GPL-3.0"

  livecheck do
    url :homepage
    regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
    strategy :github_latest
  end

  if OS.linux? 
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://artifacts-mvrpl.s3.sa-east-1.amazonaws.com/dataflow/releases/0.2.1/dataflow-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "21b0aa8e874cea49036d1440053e8fde15ed2533bcbb48b75d9b24180eb0fd66"
    end
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://artifacts-mvrpl.s3.sa-east-1.amazonaws.com/dataflow/releases/0.2.1/dataflow-aarch64-apple-darwin.tar.gz"
      sha256 "9b856b136b9e7041a5c50c89187cf7f4809550b79f47be37fb7f8f87a8eaa12a"
    end

    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://artifacts-mvrpl.s3.sa-east-1.amazonaws.com/dataflow/releases/0.2.1/dataflow-x86_64-apple-darwin.tar.gz"
      sha256 "394dc24f87bf4b20d7f1e3b962a87c3844c53c51215120be4ab421ddc36caaaa"
    end
  end

  def install
    bin.install "dataflow"
  end
end
