require 'formula'

class Autoconf <Formula
  url 'http://ftp.gnu.org/gnu/autoconf/autoconf-2.68.tar.gz'
  homepage ''
  version '2.68'
  md5 'c3b5247592ce694f7097873aa07d66fe'

  # depends_on 'cmake'

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    # system "cmake . #{std_cmake_parameters}"
    system "make install"
  end
end
