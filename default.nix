{
  lib,
  stdenvNoCC,
  makeWrapper,
  yt-dlp,
  jq,
  fzf,
  mpv,
  ffmpeg,
  gum,
}:
let
  deps = [
    yt-dlp
    jq
    fzf
    mpv
    ffmpeg
    gum
  ];
in
stdenvNoCC.mkDerivation {
  pname = "yt-x";
  version = "0.5.1";
  src = ./.;

  nativeBuildInputs = [ makeWrapper ];

  installPhase = ''
    runHook preInstall

    install -Dm755 yt-x -t $out/bin
    wrapProgram $out/bin/yt-x \
      --prefix PATH : ${lib.makeBinPath deps}

    # Install built-in themes
    if [ -d themes ]; then
      mkdir -p $out/share/yt-x/themes
      cp themes/*.theme $out/share/yt-x/themes/
    fi

    runHook postInstall
  '';

  meta.mainProgram = "yt-x";
}
