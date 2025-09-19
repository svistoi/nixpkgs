{
  python3Packages,
  fetchFromGitHub,
  lib,
}:

python3Packages.buildPythonApplication rec {

  pname = "jiratui";
  version = "1.0.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "whyisdifficult";
    repo = "jiratui";
    tag = "v${version}";
    hash = "sha256-5o9MFZu8IwJfmKDIk/8wlHLrIR9vM6AifwuKzXp9Lzo=";
  };

  build-system = with python3Packages; [
    uv-build
  ];
  pythonRemoveDeps = [ "uv" ];
  dependencies = with python3Packages; [
    click
    httpx
    pydantic-settings
    python-dateutil
    python-json-logger
    textual
    xdg-base-dirs
  ];

  nativeBuildInputs = [
  ];

  meta = {
    description = "A Text User Interface (TUI) for interacting with Atlassian Jira directly from your shell.";
    mainProgram = "jiratui";
    homepage = "https://github.com/whyisdifficult/jiratui";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ Luflosi ];
  };
}
