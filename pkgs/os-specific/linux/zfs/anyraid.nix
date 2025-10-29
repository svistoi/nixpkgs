{
  callPackage,
  nixosTests,
  ...
}@args:

callPackage ./generic.nix args {
  # You have to ensure that in `pkgs/top-level/linux-kernels.nix`
  # this attribute is the correct one for this package.
  kernelModuleAttribute = "zfs_anyraid";

  kernelMinSupportedMajorMinor = "4.18";
  kernelMaxSupportedMajorMinor = "6.17";

  # this package should point to a version / git revision compatible with the latest kernel release
  # IMPORTANT: Always use a tagged release candidate or commits from the
  # zfs-<version>-staging branch, because this is tested by the OpenZFS
  # maintainers.
  version = "2.4.0-rc2";
  rev = "bf6a3848686bdf56161cef4c83d49deae0a0d16f";
  owner = "KlaraSystems";

  tests = {
    inherit (nixosTests.zfs) anyraid;
  };

  hash = "sha256-MZs9ZPSpaeKnvcjpRtK4kXa3m64hI+a3IonZbwqEe34=";

  extraLongDescription = ''
    This is Klara Systems anyraid that has not been merged into mailine ZFS
  '';
}
