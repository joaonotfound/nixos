{ pkgs, ... }: {
  home.packages = with pkgs; [
    jdk17
  ];

  home.sessionVariables = with pkgs; {
    JAVA_HOME = "${jdk17}/lib/openjdk";
  };
}