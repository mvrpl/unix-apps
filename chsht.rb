class Chsht < Formula
    desc "Cheat Sheets on Terminal"
    homepage "https://github.com/mvrpl/Terminal-Cheat-Sheet"
    license "MIT"
    head "https://github.com/mvrpl/Terminal-Cheat-Sheet.git", branch: "main"

    bottle do
        root_url "https://artifacts-mvrpl.s3.sa-east-1.amazonaws.com/chsht/releases/0.2.0"
        sha256 cellar: "/opt/homebrew/Cellar", arm64_sonoma: "a9ae578b05c3da46cedc07dd428d94a856aeae7f3ef80a0f405bf89b8cde893a"
        sha256 cellar: :any,                   sonoma:       "5dc376aa20241233b76e2ec2c1d4e862443a0250916b2838a1ff871e8a6dc2c5"
    end
    
    depends_on "less"
    
    def install
        system "echo"
    end
    
    test do
        system "echo"
    end
end