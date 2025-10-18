{
  programs.yazi = {
    enable = true;
    settings = {
      opener = {
        "text" = [
        {
          run = ''nvim "$@"'';
          block = true;
        }
        ];
        "video" = [
        {
          run  = ''vlc "$@"'';
          block = false;
        }
        ];
        "image" = [
        {
          run  = ''feh "$@"'';
          block = false;
        }
        ];
        "pdf" = [
        {
          run  = ''zathura "$@"'';
          block = false;
        }
        ];
      };
      open.prepend_rules = [
      {
        mime = "text/*";
        use  = "text";
      }
      {
        mime = "image/*";
        use  = "image";
      }
      {
        mime = "video/*";
        use  = "video";
      }
      {
        mime = "application/pdf";
        use  = "pdf";
      }
      ];
    };
  };
}
