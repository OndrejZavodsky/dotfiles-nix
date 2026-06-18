{ pkgs }:

pkgs.mkShell {
  packages = with pkgs; [
    jdk21
    gradle
	 jdt-language-server
	 google-java-format
  ];
  shellHook = ''echo "java development environment"
	exec zsh
  '';
}
