<div align="center">
  <a href="https://github.com/gstoltman/home-manager">
    <img src="assets/nix-snowflake.svg" alt="Logo" width="80" height="80">
  </a>

  <h1 align="center">Home Manager with NixOS</h1>
</div>

### Installation

Official installation instructions can be found in the [Home
Manager community docs](https://nix-community.github.io/home-manager/) or the
[NixOS Wiki](https://nixos.wiki/wiki/Home_Manager).

I deploy my HM configuration as a flake which needs to be enabled.
For standalone personal computers, I enable this via a nixos
option `nix.settings.experimental-features = [ "nix-command" "flakes" ];`.
If running Home Manager on top of another distro, I enable this
via a nix config file:
```
# ~/.config/nix/nix.conf
experimental-features = nix-command flakes 
```
[Nix Flakes documentation](https://nixos.wiki/wiki/Flakes) if
needed.

### Rebuilding and Updating
To rebuild home manager, run the command `home-manager switch
--flake /path/to/flake/#<flake_profile>` where `flake_profile` is
whatever gets set in flake.nix.

For me, example would be executing this from my home-manager folder:`'home-manager switch --flake .#gram`

One advantage of home manager as a flake is pinned dependencies for reproducibility (flake.lock).
In practice, this means the nix channel I follow gets pinned and
thus all packages I download and install are the same across
all machines I use. To upgrade all system packages, I run the
command ```nix flake update```, rebuild home manager, and then 
commit my new lockfile.

