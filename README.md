# nixos-config

Dendritic NixOS config: every `.nix` file under `modules/` is a flake-parts module,
auto-imported by import-tree. Features live in one file each and contribute to
`flake.modules.nixos.<name>` and/or `flake.modules.homeManager.<name>`. Hosts pick
which features they want in `modules/hosts/<host>/<host>.nix`.

## First run on the VM

```sh
# 1. Set your username, name, email and repo path
$EDITOR modules/meta.nix

# 2. Bring in the real hardware config (and check system.stateVersion in nixvm.nix)
cp /etc/nixos/hardware-configuration.nix modules/hosts/nixvm/_hardware.nix

# 3. Flakes only see tracked files
git init && git add -A

# 4. Build and switch (nh is installed after the first switch)
sudo nixos-rebuild switch --flake .#nixvm
```

Afterwards: `nh os switch` (alias `rebuild`), `nh os switch --update` (alias `update`).

## Hyprland (Lua config, 0.55+)

`modules/desktop/hyprland/` generates `~/.config/hypr/hyprland.lua`. Structured settings
(`hl.config`, `hl.monitor`) are in `hyprland.nix` so other modules can merge overrides;
binds are a plain Lua file (`bindings.lua`) — add more `.lua` files via `extraLuaFiles`.
VM-only tweaks (no blur/animations, software cursors) live in `virtualisation/truenas-guest.nix`.

## Adding things

- New feature: drop a file anywhere in `modules/`, define `flake.modules.<class>.<name>`,
  add `<name>` to the host's list.
- New host: copy `modules/hosts/nixvm/`, rename, adjust its module list.
- Files/dirs starting with `_` are ignored by import-tree.
