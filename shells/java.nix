{ pkgs }:

pkgs.mkShell {
  packages = with pkgs; [
    jdk21
    gradle
  ];
  shellHook = ''echo "java development environment"
	exec zsh
  '';
}
