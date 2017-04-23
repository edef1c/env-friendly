{ pkgs, ... }:
let pkg = callPackage ./. {}; in
{ environment.usrbinenv = "${env-friendly}/bin/env"; }
