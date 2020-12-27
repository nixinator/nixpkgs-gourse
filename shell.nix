{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.git
    pkgs.perl
    pkgs.perlPackages.LWP
    pkgs.gource
    pkgs.ffmpeg
  ];

  shellHook = ''
    echo hello
    echo "gource  -s .05  -a 1 --highlight-users --filename-time 2 --hide filenames --camera-mode overview  --file-filter default.nix  --user-image-dir avatar/ --16000x16000 --max-user-speed 130"
    gource  -s .05  -a 1 --highlight-users --filename-time 2 --hide filenames --camera-mode overview  --file-filter default.nix  --user-image-dir avatar/ --16000x16000 --max-user-speed 130 nixpkgs/

    echo "ffmpeg -y -r 60 -f image2pipe -vcodec ppm -i temporary.ppm -vcodec libx264 -pix_fmt yuv420p -crf 1 -threads 0 -bf 0 -preset slow finalVideo.mp4"

  '';

  MY_ENVIRONMENT_VARIABLE = "world";
}
