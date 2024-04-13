class Chsht < Formula
    desc "Cheat Sheets on Terminal"
    homepage "https://github.com/mvrpl/Terminal-Cheat-Sheet"
    license "MIT"
    head "https://github.com/mvrpl/Terminal-Cheat-Sheet.git", branch: "main"

    bottle do
        root_url "https://artifacts-mvrpl.s3.sa-east-1.amazonaws.com/chsht/releases/0.2.0"
        sha256 "4921af80137af9cc3d38fd17c9120da882448a090b0a8a3a19af3199b415bfca" =>: yosemite
        sha256 "c71db15326ee9196cd98602e38d0b7fb2b818cdd48eede4ee8eb827d809e09ba" =>: mavericks
        sha256 "85cc828a96735bdafcf29eb6291ca91bac846579bcef7308536e0c875d6c81d7" =>: mountain_lion
    end
    
    depends_on "less"
    
    def install
        system "echo"
    end
    
    test do
        system "echo"
    end
end