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
  kernelMaxSupportedMajorMinor = "6.19";

  # this package should point to a version / git revision compatible with the latest kernel release
  # IMPORTANT: Always use a tagged release candidate or commits from the
  # zfs-<version>-staging branch, because this is tested by the OpenZFS
  # maintainers.
  # https://github.com/KlaraSystems/zfs/commits/anyraid/
  version = "2.5.0";
  rev = "543dd4512afd495311f185dcc7aa5d4e4ff21120";
  owner = "KlaraSystems";

  tests = {
    inherit (nixosTests.zfs) anyraid;
  };

  hash = "sha256-ITI33mwyeaiTWTRX05yVxBnOSyACqowh94WTrBEqqMo=";

  extraLongDescription = ''
    This is Klara Systems anyraid that has not been merged into mailine ZFS
  '';
}
