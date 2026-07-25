class CronSimulator < Formula
  desc "Crontab simulator written in Go"
  homepage "https://www.mvrpl.dev"
  version "1.0.0"
  license "MIT"

  livecheck do
    url 'https://artifacts-mvrpl.s3.sa-east-1.amazonaws.com/cron_simulator/version.json'
    regex(/^(\d+(?:\.\d+)+)$/i)
    strategy :json do |json, regex|
      json["version"][regex, 1]
    end
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://artifacts-mvrpl.s3.sa-east-1.amazonaws.com/cron_simulator/1.0.0/cron_simulator-linux-x64"
    sha256 "6e827d6eaad719c981d15de3548fe40ee8bcbd037827476f73425b0532918de7"
  end

  if OS.mac?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://artifacts-mvrpl.s3.sa-east-1.amazonaws.com/cron_simulator/1.0.0/cron_simulator-macos-arm64"
      sha256 "22b2cadfbe43b90fe0c456f0bfd64e611ad22f94338ccffc16e6a386fd122ff1"
    end
  end

  def install
    if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      bin.install "cron_simulator-linux-x64" => "cron-simulator"
    end

    if OS.mac?
      if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        bin.install "cron_simulator-macos-arm64" => "cron-simulator"
      end
    end
  end
end
