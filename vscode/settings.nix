with import <nixpkgs> {};

{
    "terminal.external.linuxExec" = "${pkgs.zsh}/bin/zsh";
    "terminal.integrated.sendKeybindingsToShell"  = true;
    "terminal.integrated.fontFamily" = "MesloLGS NF";
    "terminal.integrated.env.linux" = {
        "PYTHONPATH" = "\${workspaceFolder}";
    };

    "workbench.iconTheme" = "material-icon-theme";
    "workbench.colorTheme" = "Default Dark+";

    "nixEnvSelector.nixFile" = "\${workspaceRoot}/shell.nix";

    "python.analysis.typeCheckingMode" = "basic";
    "python.linting.flake8Path" = "${pkgs.python38Packages.flake8}/bin/flake8";
    "python.linting.pylintEnabled" = false;
    "python.linting.flake8Enabled" = true;
    "python.linting.enabled" = true;

    "python.linting.flake8Args" = [
        "--max-line-length=120"
        "--per-file-ignores=__init__.py:F401"
    ];

    "python.testing.unittestEnabled" = true;
    "python.testing.unittestArgs" = [
        "-v"
        "-s"
        "./tests"
        "-p"
        "*test*.py"
    ];

    "python.languageServer" = "Pylance";
    # "python.pythonPath" = "/home/huantian/.pyenv/versions/3.9.2/envs/Testing/bin/python";

    "editor.tokenColorCustomizations" = {
        "textMateRules" = [
            {
                "scope" = [
                    "variable.language.special.self.python"
                    "variable.parameter.function.language.special.self.python"
                    "variable.language.special.cls.python"
                    "variable.parameter.function.language.special.cls.python"
                ];
                "settings" = {
                    "foreground" = "#d54aff";
                };
            }
        ];
    };
    "editor.rulers" = [120];
    "editor.suggestSelection" = "first";
    "editor.quickSuggestions" = {
      "strings" = true;
    };
    "editor.inlineSuggest.enabled" = true;

    "explorer.confirmDelete" = false;
    "explorer.sortOrder" = "type";

    "files.trimTrailingWhitespace" = true;
    "files.exclude" = {
        "**/.git" = true;
        "**/.svn" = true;
        "**/.hg" = true;
        "**/CVS" = true;
        "**/.DS_Store" = true;
        "**/*.pyc" = {"when" = "$(basename).py";};
        "**/__pycache__" = true;
        ".idea" = true;
        ".directory" = true;
    };
    "files.associations" = {
        "**/*.html" = "html";
        "**/templates/**/*.html" = "django-html";
        "**/templates/**/*" = "django-txt";
        "**/requirements{/**;*}.{txt;in}" = "pip-requirements";
    };
    "workbench.editorAssociations" = {
        "*.ipynb" = "jupyter-notebook";
    };


    "vim.useSystemClipboard" = true;
    "vim.statusBarColorControl" = true;

    "vim.statusBarColors.normal" = ["#9876aa" "#323232"];
    "vim.statusBarColors.insert" = ["#629755" "#323232"];
    "vim.statusBarColors.visual" = ["#ffc66d" "#323232"];
    "vim.statusBarColors.visualline" = ["#ffc66d" "#323232"];
    "vim.statusBarColors.visualblock" = ["#ffc66d" "#323232"];
    "vim.statusBarColors.replace" = ["#ff6b68" "#323232"];


    "git.autofetch" = true;
    "git.enableSmartCommit" = true;
    "git.enableCommitSigning" = true;


    "jupyter.askForKernelRestart" = false;
    "diffEditor.ignoreTrimWhitespace" = false;
    "notebook.cellToolbarLocation" = {
        "default" = "right";
        "jupyter-notebook" = "left";
    };
}

