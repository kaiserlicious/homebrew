require 'formula'

class Konihcl <Formula
  url 'https://svn.uni-koblenz.de/agas/projects/KONIHCL/trunk/', :using => :svn
  version '3'
  homepage ''
  md5 ''

  # depends_on 'cmake'

  def install
    system "./autogen.sh"
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    # system "cmake . #{std_cmake_parameters}"
    system "make"
    system "mkdir #{prefix}/include"
    system "mkdir #{prefix}/include/konihcl/"
    system "cp konihcl/* #{prefix}/include/konihcl"
    system "mkdir #{prefix}/lib/"
    system "cp lib/.libs/libkonihcl.a #{prefix}/lib/"
    system "cp lib/.libs/libkonihcl.3.dylib #{prefix}/lib/libkonihcl.3.dylib"
    system "ln -s #{prefix}/lib/libkonihcl.3.dynlib #{prefix}/lib/libkonihcl.dynlib"
  end
end
