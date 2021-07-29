with import <nixpkgs> {};

let
  vim-cutlass = pkgs.vimUtils.buildVimPlugin {
    name = "vim-cutlass";
    src = pkgs.fetchFromGitHub {
      owner = "svermeulen";
      repo = "vim-cutlass";
      rev = "7afd649415541634c8ce317fafbc31cd19d57589";
      sha256 = "0a4fy5gr32gfkwnqgr3f8sfdh8f32hp23hpvvpgr00irvnmvv5cg";
    };
  };
in
  vim_configurable.customize {
    # Specifies the vim binary name.
    # E.g. set this to "my-vim" and you need to type "my-vim" to open this vim
    # This allows to have multiple vim packages installed (e.g. with a different set of plugins)
    name = "my-vim";
    vimrcConfig.packages.myVimPackage = with pkgs.vimPlugins; {
      start = [ lightline-vim vim-toml vim-nix vim-cutlass ];
    };
    vimrcConfig.customRC = ''
      " Allow saving of files as sudo when I forgot to start vim using sudo.
      cmap w!! w !doas tee %

      syntax on                       " Turn on syntax highlighting
      set number relativenumber       " Hybrid line numbers
      set clipboard=unnamedplus       " Use system clipboard
      set mouse=nicr                  " Mouse scrolling

      set expandtab                   " Use spaces instead of tabs.
      set smarttab                    " Be smart using tabs ;)
      set shiftwidth=4                " One tab == four spaces.
      set tabstop=4                   " One tab == four spaces.
      set backspace=indent,eol,start  " More powerful backspacing

      " Tab size for .nix files
      autocmd FileType nix setlocal shiftwidth=2 softtabstop=2 expandtab

      " Use the x key as cut instead of d
      nnoremap x d
      xnoremap x d
      noremap xx dd
      nnoremap X D

      " Status Line

      " The lightline.vim theme
      let g:lightline = {'colorscheme': 'darcula',}

      " Always show statusline
      set laststatus=2

      " Uncomment to prevent non-normal modes showing in powerline and below powerline.
      set noshowmode

      " Associate .rdlevel with json 
      au BufNewFile,BufRead *.rdlevel setlocal ft=json
    '';
  }

