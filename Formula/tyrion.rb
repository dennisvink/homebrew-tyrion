class Tyrion < Formula
  desc "Tiny Python-derived scripting language"
  homepage "https://github.com/dennisvink/tyrion"
  url "https://github.com/dennisvink/tyrion/archive/refs/tags/v0.3.2.tar.gz"
  sha256 "5aadccba054ed3caca53500462492ec4ad1490fda351edd7f0430cf77537f5b5"
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
