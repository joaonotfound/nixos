{ pkgs, ... }: {
  home.packages = with pkgs; [
    jdk20
  ];

  home.sessionVariables = with pkgs; {
    JAVA_HOME = "${jdk20}/lib/openjdk";
  };
}