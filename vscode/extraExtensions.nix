with import <nixpkgs> {};

pkgs.vscode-utils.extensionsFromVscodeMarketplace [
  {
    name = "test-adapter-converter";
    publisher = "ms-vscode";
    version = "0.0.13";
    sha256 = "fba5eecab3877f94410a31cc9bb6b2b850d6a2dfbde58c48551c7c3756a909fd";
  }
]
