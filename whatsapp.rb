class Whatsapp < Formula
    desc "API for Whatsapp Web Multi Device Version, Support UI & Webhook"
    homepage "https://github.com/aldinokemal/go-whatsapp-web-multidevice"
    version "5.2.0"
    license "MIT"

    livecheck do
        url :homepage
        regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
        strategy :github_latest
    end

    if OS.linux?
        if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
            url "https://github.com/aldinokemal/go-whatsapp-web-multidevice/releases/download/v5.2.0/linux-arm64"
            sha256 "a96934d9ad5a908202aaebc0cca5d3b19ceaeffb605af5646f72abcc05e4e006"
        end
        if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
            url "https://github.com/aldinokemal/go-whatsapp-web-multidevice/releases/download/v5.2.0/linux-amd64"
            sha256 "eb8333d37079af41edecabf906acaf8a0ee00534b9f08ca2b15f2fa2c4f745fd"
        end
    end

    if OS.mac? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
        url "https://github.com/aldinokemal/go-whatsapp-web-multidevice/releases/download/v5.2.0/darwin-amd64"
        sha256 "36b6d9cd96ce831890bdf42ec6507f44f918033a46c453aa8e06638002dd8262"
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
