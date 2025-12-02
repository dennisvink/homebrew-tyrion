class Tyrion < Formula
  desc "Tiny Python-derived scripting language"
  homepage "https://github.com/dennisvink/tyrion"
  url "https://github.com/dennisvink/tyrion/archive/refs/tags/v0.3.10.tar.gz"
  sha256 "67e55792b39b0d7c8ea1426e96312d337c7b5b28f380ce52b8c73fe7ab8b1613"
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
