# homebrew-tap

```bash
brew install daniele-russano/tap/ccsm
brew install daniele-russano/tap/transcription
```

Se non hai Homebrew, installalo seguendo le istruzioni su [brew.sh](https://brew.sh).

## ccsm

La formula `Formula/ccsm.rb` e i binari nelle release sono generati
automaticamente a ogni push su `main` del repo (privato) di ccsm.

## transcription

Trascrive file audio in italiano con
[whisper.cpp](https://github.com/ggml-org/whisper.cpp) (modello
`large-v3-turbo`, accelerazione Metal). Richiede un Mac con Apple Silicon e
macOS 14 o successivo.

```bash
transcription lezione.m4a
transcription ~/Desktop/*.mp3
```

Il testo viene salvato in un file `.md` accanto a ogni file audio; i file già
trascritti vengono saltati. Al primo avvio vengono scaricati i modelli
(~835 MB) in `~/Library/Application Support/transcription/models`.

Per rimuoverlo del tutto:

```bash
brew uninstall transcription
rm -rf ~/Library/Application\ Support/transcription ~/Library/Caches/transcription
```

Il codice arriva dalle release `transcription-v*`, pubblicate a mano dal repo
(privato) di transcription.
