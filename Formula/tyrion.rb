class Tyrion < Formula
  desc "Tiny Python-derived scripting language"
  homepage "https://github.com/dennisvink/tyrion"
  url "https://github.com/dennisvink/tyrion/archive/refs/tags/v0.3.9.tar.gz"
  sha256 "f2cda0daf2b1ffbccccf1d88223b5913bdc00bfe5c76bf2a7d06f67d06fed623"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args

    rm_rf "target"
    (share/"tyrion_src").install Dir["*"]
  end

  test do
    (testpath/"hello.ty").write <<~EOS
      print("hi")
    EOS
    assert_equal "hi\n", shell_output("#{bin}/tyrion hello.ty")
  end
end
