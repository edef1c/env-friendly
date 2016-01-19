{ lib, options, ... }: with lib; let
  env-friendly = callPackage ./. {};
in if options.environment ? usrbinenv
  then {
    environment.usrbinenv = "${env-friendly}/bin/env";
  }
  else {
    system.activationScripts.usrbinenv = mkForce ''
      mkdir -m 0755 -p /usr/bin
      ln -sfn ${env-friendly}/bin/env /usr/bin/.env.tmp
      mv /usr/bin/.env.tmp /usr/bin/env # atomically replace /usr/bin/env
    '';
  }
