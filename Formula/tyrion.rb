class Tyrion < Formula
  desc "Tiny Python-derived scripting language"
  homepage "https://github.com/dennisvink/tyrion"
  url "https://github.com/dennisvink/tyrion/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "6eb648aeaab1787410fe456bd1974716e7f9191aafed5fbe29c39cf901e5b1ec"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    (testpath/"hello.ty").write <<~EOS
      print("hi")
    EOS
    system bin/"tyrion", "hello.ty"
    assert_equal "hi\n"
  end
end
