with import <nixpkgs> {};

pkgs.vscode-utils.extensionsFromVscodeMarketplace [
  {
    name = "codesnap";
    publisher = "adpyke";
    version = "1.3.4";
    sha256 = "012sj4a65sr8014z4zpxqzb6bkj7pnhm4rls73xpwawk6hwal7km";
  }
  {
    name = "TabOut";
    publisher = "albert";
    version = "0.2.0";
    sha256 = "0vzgxw0ppx59k1d5xq8kl3f1bz0gdmy2ll0gc16i0c6k08bza5dn";
  }
  {
    name = "nix-env-selector";
    publisher = "arrterian";
    version = "1.0.7";
    sha256 = "0mralimyzhyp4x9q98x3ck64ifbjqdp8cxcami7clvdvkmf8hxhf";
  }
  {
    name = "vscode-django";
    publisher = "batisteo";
    version = "1.6.0";
    sha256 = "1m4z65pihkxx382vkx52pb698z5ynlgjz72hav9dpc73604g3gqg";
  }
  {
    name = "Nix";
    publisher = "bbenoist";
    version = "1.0.1";
    sha256 = "0zd0n9f5z1f0ckzfjr38xw2zzmcxg1gjrava7yahg5cvdcw6l35b";
  }
  {
    name = "vscode-tailwindcss";
    publisher = "bradlc";
    version = "0.6.13";
    sha256 = "098vrm28b7jpzk0c2d0cgxvdw4jsswzf18cx1m9jwsm1j40fp5f4";
  }
  {
    name = "split-lines";
    publisher = "brainfit";
    version = "1.0.2";
    sha256 = "0pk6pqjf2d0a9jlmqc5aj30ah1aaqg6mb9cbfnxprxa7572z1wir";
  }
  {
    name = "vscode-github-actions";
    publisher = "cschleiden";
    version = "0.20.2";
    sha256 = "0wbx9v0w85xvhb24k230wfxi8wci5qg75kbxbmbp1ajxl4h84zfp";
  }
  {
    name = "vscode-html-css";
    publisher = "ecmel";
    version = "1.10.2";
    sha256 = "0qzh7fwgadcahxx8hz1sbfz9lzi81iv4xiidvfm3sahyl9s6pyg1";
  }
  {
    name = "vscode-pull-request-github";
    publisher = "GitHub";
    version = "0.28.0";
    sha256 = "0w8aa68xzzl5vw0blnfr6cx14qcifjmwiy5y19cnx71r59qlaf2i";
  }
  {
    name = "vscode-test-explorer";
    publisher = "hbenl";
    version = "2.20.4";
    sha256 = "0z17a99rqmgpmjzzgpic0kl3vcankynbg8dzjl7iij2anpxdk6f3";
  }
  {
    name = "discord-vscode";
    publisher = "icrawl";
    version = "5.7.0";
    sha256 = "1s173cjfq4zajddq986j6dpmqwg3ja5lrlvqhcm339py2wqbrpd4";
  }
  {
    name = "vsc-python-indent";
    publisher = "KevinRose";
    version = "1.14.2";
    sha256 = "1hs8dg9nxkiy7ysq9zrb34gv3wgj3hpnhkb3w1zjplk8075qyjsg";
  }
  {
    name = "restructuredtext";
    publisher = "lextudio";
    version = "155.0.0";
    sha256 = "04jqywywxmhpvxz1nxd2hamjd9sg880r4g1wxaz2x4f51z0xda8k";
  }
  {
    name = "vscode-python-test-adapter";
    publisher = "littlefoxteam";
    version = "0.6.8";
    sha256 = "1lws5xv8wmmh4qai2iwrb2l00h26psbrx5fijg8311z9hv507fny";
  }
  {
    name = "python";
    publisher = "ms-python";
    version = "2021.6.944021595";
    sha256 = "17p1j0xd0crqv4wbs9qapvv4i8j9j446cbjqihpk9z6ryriim5ip";
  }
  {
    name = "vscode-pylance";
    publisher = "ms-python";
    version = "2021.7.4";
    sha256 = "1mjphm7ds7z1gdjc2ajlamayrs8v19yfdpjkckp3q79fxkplxvn5";
  }
  {
    name = "jupyter";
    publisher = "ms-toolsai";
    version = "2021.8.1036914918";
    sha256 = "0diqca0csmall9kmp4fbifildv1bdsifwpvzkxxq0s3bymng136l";
  }
  {
    name = "test-adapter-converter";
    publisher = "ms-vscode";
    version = "0.0.17";
    sha256 = "1zifc0h4c37wzbkjjkvvzh43hbc5g9v49bdq3xb6h5yr3fbm0pva";
  }
  {
    name = "autodocstring";
    publisher = "njpwerner";
    version = "0.5.4";
    sha256 = "0a2krzgljkz02flps1yj048xq3xcwm26lqa42nq4b0r4l50hnis9";
  }
  {
    name = "material-icon-theme";
    publisher = "PKief";
    version = "4.8.0";
    sha256 = "06xsb1dqqdgr9ack0d92rc96qkhymyfba4msm884l52scd6jr7mx";
  }
  {
    name = "vscode-commons";
    publisher = "redhat";
    version = "0.0.6";
    sha256 = "1b8nlhbrsg3kj27f1kgj8n5ak438lcfq5v5zlgf1hzisnhmcda5n";
  }
  {
    name = "vscode-yaml";
    publisher = "redhat";
    version = "0.21.1";
    sha256 = "1phc4s0iglbiq77ih4g5llmmvdldf3rvyfdqfca2dn0vapdg73hv";
  }
]

