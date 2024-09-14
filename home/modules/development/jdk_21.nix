{ pkgs, ... }: {
  home.packages = with pkgs; [
    jdk21
  ];

  home.sessionVariables = with pkgs; {
    JAVA_HOME = "${jdk21}/lib/openjdk";
  };
}