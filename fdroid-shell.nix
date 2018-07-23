{ pkgs ? import <nixpkgs> {} }:

with pkgs;

let

  fdroid-python-packages = python-packages: with python-packages; [
    requests
    paramiko
    pyasn1-modules
    clint
    pyyaml

    virtualenvwrapper
  ]

; python-with-fdroid-packages = pkgs.python3.withPackages fdroid-python-packages

; in

mkShell
{
  buildInputs =
    [
      python-with-fdroid-packages
    ]
; }
