require 'formula'

class Libtool <Formula
  url 'http://ftp.gnu.org/gnu/libtool/libtool-2.4.tar.gz'
  version '2.4'
  homepage ''
  md5 'b32b04148ecdd7344abc6fe8bd1bb021'

  depends_on 'autoconf'
  depends_on 'automake'

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    # system "cmake . #{std_cmake_parameters}"
    system "make install"
    #symlink the m4 macros to the automake directory
    system "ln -s #{prefix}/share/aclocal/* `aclocal --print-ac-dir`-1.11/"
  end
end
