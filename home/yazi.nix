{
  programs.yazi = {
    shellWrapperName = "yy"; # it's what I'm used to
    enable = true;
    settings = {
      opener = {
        "text" = [
          {
            run = ''nvim "%s"'';
            block = true;
          }
        ];
        "video" = [
          {
            run = ''vlc "%s"'';
            block = false;
          }
        ];
        "image" = [
          {
            run = ''qimgv "%s"'';
            block = false;
          }
        ];
        "pdf" = [
          {
            run = ''zathura "%s"'';
            block = false;
          }
        ];
      };
      open.prepend_rules = [
        {
          mime = "text/*";
          use = "text";
        }
        {
          mime = "image/*";
          use = "image";
        }
        {
          mime = "video/*";
          use = "video";
        }
        {
          mime = "application/pdf";
          use = "pdf";
        }
      ];
    };
  };
}
