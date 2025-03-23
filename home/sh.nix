{ config, pkgs, ... }:
{

  programs = {
    nushell = {
      enable = true;
      # The config.nu can be anywhere you want if you like to edit your Nushell with Nu
      # for editing directly to config.nu
      extraConfig = ''
                        let carapace_completer = {|spans|
                            carapace $spans.0 nushell ...$spans | from json
                        }
                        $env.config = {
        show_banner: false,
                     completions: {
        case_sensitive: false # case-sensitive completions
                            quick: true    # set to false to prevent auto-selecting completions
                            partial: true    # set to false to prevent partial filling of the prompt
                            algorithm: "fuzzy"    # prefix or fuzzy
                            external: {
        # set to false to prevent nushell looking into $env.PATH to find more suggestions
        enable: true 
        # set to lower can improve completion performance at the cost of omitting some options
                    max_results: 100 
                    completer: $carapace_completer # check 'carapace_completer' 
                            }
                     }
                        } 
                        $env.config.edit_mode = 'vi'
                    $env.config.table.mode = 'psql'
                        $env.PATH = ($env.PATH | 
                                split row (char esep) |
                                prepend /home/myuser/.apps |
                                append /usr/bin/env
                                )
      '';
      shellAliases = {
        vi = "nvim";
        lsgen = "nix profile history --profile /nix/var/nix/profiles/system";
        delold = "sudo nix profile wipe-history --profile /nix/var/nix/profiles/system --older-than 14d";
        b = "btop";

      };
    };
    carapace.enable = true;
    carapace.enableNushellIntegration = true;
  };
}
