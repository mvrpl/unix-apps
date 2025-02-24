class Whatsapp < Formula
    desc "API for Whatsapp Web Multi Device Version, Support UI & Webhook"
    homepage "https://github.com/aldinokemal/go-whatsapp-web-multidevice"
    version "5.2.1"
    license "MIT"

    livecheck do
        url :homepage
        regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
        strategy :github_latest
    end

    if OS.linux?
        if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
            url "https://github.com/aldinokemal/go-whatsapp-web-multidevice/releases/download/v5.2.1/linux-arm64"
            sha256 "272014f7ec80c47880be0137eaf57b2e53c8d7da0e67d025cb64b6d7e450cb20"
        end
        if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
            url "https://github.com/aldinokemal/go-whatsapp-web-multidevice/releases/download/v5.2.1/linux-amd64"
            sha256 "e7b425c36c3f4221d0075c9a97f9a6bc5ab66fc78b6793e15f20d2b8c355efa6"
        end
    end

    if OS.mac? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
        url "https://github.com/aldinokemal/go-whatsapp-web-multidevice/releases/download/v5.2.1/darwin-amd64"
        sha256 "b6093206ff746afbd3e4b0a9988d598eced5eec366d5a1adef29b6eb2f152650"
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
