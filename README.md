# Nixos Configuration

## Build

```Shell
sudo nixos-rebuild boot --flake "./#$(hostname)"
```

## Test

```Shell
for i in $(grep nixpkgs.lib.nixosSystem flake.nix | awk '{print$1}' | awk -F '.' '{print$2}'); do echo "🔷 Testing ${i}"; sudo nixos-rebuild test --flake "./#${i}"; done
```
