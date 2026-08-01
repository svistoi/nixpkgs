{
  callPackage,
  nixosTests,
  ...
}@args:

callPackage ./generic.nix args {
  extraPatches = [ ];

  # You have to ensure that in `pkgs/top-level/linux-kernels.nix`
  # this attribute is the correct one for this package.
  kernelModuleAttribute = "zfs_anyraid";

  kernelMinSupportedMajorMinor = "4.18";
  kernelMaxSupportedMajorMinor = "7.1";

  # this package should point to a version / git revision compatible with the latest kernel release
  # IMPORTANT: Always use a tagged release candidate or commits from the
  # zfs-<version>-staging branch, because this is tested by the OpenZFS
  # maintainers.
  # https://github.com/KlaraSystems/zfs/commits/anyraid/
  version = "2.5.0";
  rev = "18d064529962a4f45cb0b551f820b32a680ee863";
  owner = "KlaraSystems";

  tests = {
    inherit (nixosTests.zfs) anyraid;
  };

  hash = "sha256-EZDFaDaI5TFLL/cfuBbVN9h9/3yokCvFHFqtX04uhHE=";

  extraLongDescription = ''
    This is Klara Systems anyraid that has not been merged into mailine ZFS
  '';
}
