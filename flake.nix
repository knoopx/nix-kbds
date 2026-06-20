{
  description = "Build my Vial QMK firmware using QMix";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    qmix = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:Tygo-van-den-Hurk/QMix";
    };
  };

  outputs =
    { self, nixpkgs, qmix }:
    let
      system = "x86_64-linux";

      pkgs = import nixpkgs {
        inherit system;
        overlays = [ qmix.overlays.default ];
      };

      vialQmkFirmware = pkgs.fetchQmkFirmware {
        url = "https://github.com/vial-kb/vial-qmk.git";
        origin = "https://github.com/vial-kb/vial-qmk.git";
        rev = "00fc4627cd038ac9b7e9b8bf2b40b50e9e88aecb";
        hash = "sha256-522lhzg+WsNFnLlv/+U9WmDT8QY2Z/1xgY+Y2Ec5+MQ=";
      };
    in
    {
      packages.${system} = {
        crkbd-choc-v2 = pkgs.buildQmkFirmware {
          keyboard = "crkbd";
          keymap = "choc-v2";
          split = true;
          src = ./keyboards/crkbd/keymaps/choc-v2;
          srcMount = "keyboards/crkbd/keymaps/choc-v2";
          qmkFirmware = vialQmkFirmware;
        };

        crkbd-classic-v3 = pkgs.buildQmkFirmware {
          keyboard = "crkbd";
          keymap = "classic-v3";
          split = true;
          src = ./keyboards/crkbd/keymaps/classic-v3;
          srcMount = "keyboards/crkbd/keymaps/classic-v3";
          qmkFirmware = vialQmkFirmware;
        };

        default = self.packages.${system}.crkbd-choc-v2;
      };

      devShells.${system}.default = pkgs.mkShell {
        nativeBuildInputs = [
          pkgs.qmk
          pkgs.git
        ];
      };

      formatter.${system} = pkgs.nixfmt-rfc-style;
    };
}
