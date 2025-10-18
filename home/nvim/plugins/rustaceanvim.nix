{pkgs, ...}:
{
  programs.nixvim = {
    plugins.rustaceanvim = {
      enable = true; 
      settings = {
        dap.adapter = {
          command = "${pkgs.lldb}/bin/lldb-dap";
          type = "executable";
        };
        
        tools.enable_clippy = true;

        server = {
          default_settings = {
            inlayHints = { lifetimeElisionHints = { enable = "always"; }; };
            rust-analyzer = {
              cargo = { allFeatures = true; };
              check = { command = "clippy"; };
            };
          };
        };
      };
    };
  };
}
