{
  flake.modules.nixos.amd-gpu = {
    hardware.graphics = {
      enable = true;
      enable32Bit = true; # 32-bit games and Steam
    };
    hardware.amdgpu.initrd.enable = true; # load the driver early: correct resolution from boot
    services.lact.enable = true;          # GUI for fan curves, clocks and power limits
    # hardware.amdgpu.opencl.enable = true; # uncomment for ROCm/OpenCL (Blender, DaVinci, AI tools)
  };
}

