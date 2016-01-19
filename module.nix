{ config, pkgs, lib, ... }: with lib; let
  env-friendly = callPackage ./. {};
in {
  system.activationScripts.usrbinenv = mkForce ''
    mkdir -m 0755 -p /usr/bin
    ln -sfn ${env-friendly}/bin/env /usr/bin/.env.tmp
    mv /usr/bin/.env.tmp /usr/bin/env # atomically replace /usr/bin/env
  '';
}
