{
  programs.nixvim = {
    plugins.rustaceanvim = {
      enable = true; 
      settings = {
        dap.autoload_configurations = true;
      };
    };
  };
}
