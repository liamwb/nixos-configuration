{
  # A plugin that makes a nice greeter for when you start nvim.
  programs.nixvim = {
    plugins.alpha = {
      enable = true;
      theme = "dashboard";
    };

  };
}
