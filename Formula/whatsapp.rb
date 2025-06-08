class Whatsapp < Formula
    desc "API for Whatsapp Web Multi Device Version, Support UI & Webhook"
    homepage "https://github.com/aldinokemal/go-whatsapp-web-multidevice"
    version "6.0.2"
    license "MIT"

    livecheck do
        url :homepage
        regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
        strategy :github_latest
    end

    if OS.linux?
        if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
            url "https://github.com/aldinokemal/go-whatsapp-web-multidevice/releases/download/v6.0.2/linux-arm64"
            sha256 "19fd48b98d96217e612977dd1a48868ba340501ee06caef59c44230f289da739"
        end
        if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
            url "https://github.com/aldinokemal/go-whatsapp-web-multidevice/releases/download/v6.0.2/linux-amd64"
            sha256 "6236913f498e7653045fa14e30d66c98a542dbab50a971bda9d91091acfceac7"
        end
    end

    if OS.mac? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
        url "https://github.com/aldinokemal/go-whatsapp-web-multidevice/releases/download/v6.0.2/darwin-amd64"
        sha256 "baa829c48cb13642b925c1000c33ee4d1d1d3795a5229b19fd7e58c89a1d028e"
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
