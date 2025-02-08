class Whatsapp < Formula
    desc "API for Whatsapp Web Multi Device Version, Support UI & Webhook"
    homepage "https://github.com/aldinokemal/go-whatsapp-web-multidevice"
    version "5.1.1"
    license "MIT"

    livecheck do
        url :homepage
        regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
        strategy :github_latest
    end

    if OS.linux?
        if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
            url "https://github.com/aldinokemal/go-whatsapp-web-multidevice/releases/download/v5.1.1/linux-arm64"
            sha256 "9b579619a1392517564201a39d3103ee2259c570e1ebb6041ff295ff9b808660"
        end
        if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
            url "https://github.com/aldinokemal/go-whatsapp-web-multidevice/releases/download/v5.1.1/linux-amd64"
            sha256 "1d6a4bf64c2db1e10530531a066e95a58eb01821606626c4bd7a7b2daaf94df0"
        end
    end

    if OS.mac? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
        url "https://github.com/aldinokemal/go-whatsapp-web-multidevice/releases/download/v5.1.1/darwin-amd64"
        sha256 "3a4afce4d80b58422b3db6302ac30ec39714cab2d2e64124d3a2e56bb6fb408e"
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
