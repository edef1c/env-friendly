{ stdenv, musl, ... }:
stdenv.mkDerivation {
  name = "env-1.0.0";

  unpackPhase = ''
    cp -v ${./Makefile} Makefile
    cp -v ${./env.c} env.c
  '';

  CFLAGS = "-isystem ${musl}/include -B${musl}/lib -L${musl}/lib";
  LDFLAGS = "-static -Wl,--gc-sections";
}
