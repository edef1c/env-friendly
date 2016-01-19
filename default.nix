{ stdenv, musl, ... }:
stdenv.mkDerivation {
  name = "env-1.0.0";
  src = ./.;
  CFLAGS = "-isystem ${musl}/include -B${musl}/lib -L${musl}/lib";
  LDFLAGS = "-static -Wl,--gc-sections";
}
