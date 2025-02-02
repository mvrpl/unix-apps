class Whatsapp < Formula
    desc "API for Whatsapp Web Multi Device Version, Support UI & Webhook"
    homepage "https://github.com/aldinokemal/go-whatsapp-web-multidevice"
    version "5.0.0"
    license "MIT"

    livecheck do
        url :homepage
        regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
        strategy :github_latest
    end

    if OS.linux?
        if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
            url "https://github.com/aldinokemal/go-whatsapp-web-multidevice/releases/download/v5.0.0/linux-arm64"
            sha256 "86464b34d1e8c63de9a2a4d62bc823f167e7030afdc1546c0d5b6420bfe3b8bd"
        end
        if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
            url "https://github.com/aldinokemal/go-whatsapp-web-multidevice/releases/download/v5.0.0/linux-amd64"
            sha256 "a7a4a8a60c6d761e89bd36c48c888c8710701f3148bde5343bd93e725de66c5b"
        end
    end

    if OS.mac? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
        url "https://github.com/aldinokemal/go-whatsapp-web-multidevice/releases/download/v5.0.0/darwin-amd64"
        sha256 "8bbc406cfc5e814d8c49d69acf524c9f12158b4d1f73b2d36a82dfaddbead918"
    end

    def install
        if OS.linux?
            if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
                bin.install "linux-arm64" => "wapp"
            end
            if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
                bin.install "linux-amd64" => "wapp"
            end
        end

        if OS.mac? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
            bin.install "darwin-amd64" => "wapp"
        end
    end
end