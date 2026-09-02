# dotfiles

macOS 개발 환경 설정 모음입니다.
도구별로 디렉토리를 나누고, `install.sh`가 `$HOME`에 심볼릭 링크를 겁니다.

## 구성

```text
dotfiles/
├── zsh/
│   ├── .zshrc                 # starship 프롬프트 + autosuggestions/syntax-highlighting + alias
│   ├── .zprofile              # Homebrew shellenv, OrbStack
│   └── .zshrc.local.example   # 머신별 설정 템플릿
├── starship/
│   └── starship.toml          # 프롬프트 (디렉토리, git 브랜치/상태, 실행 시간)
├── git/
│   ├── .gitconfig             # ~/.gitconfig.local include만 담음
│   ├── .gitconfig.local.example
│   └── ignore                 # 전역 gitignore (~/.config/git/ignore)
├── nvim/                      # LazyVim 기반 Neovim 설정 (Kanagawa, snacks explorer, Neogit)
├── tmux/
│   └── tmux.conf              # tpm + catppuccin, vi copy-mode, prefix+Tab으로 yazi
├── ghostty/
│   ├── config                 # Kanagawa Wave 테마, Hack Nerd Font Mono, split 키바인딩
│   └── shaders/cursor.glsl    # 커서 셰이더
├── wezterm/
│   └── wezterm.lua            # Kanagawa 테마, 블러 배경, 비활성 창 흐리게
├── gh/
│   └── config.yml             # GitHub CLI 설정
├── Brewfile                   # Homebrew 패키지 목록
└── install.sh                 # 설치 스크립트 (여러 번 실행해도 안전)
```

## 준비물

- [Homebrew](https://brew.sh) — 없으면 `install.sh`가 안내 메시지를 남기고 바로 종료합니다.
- 프롬프트([starship](https://starship.rs))와 zsh 플러그인, Hack Nerd Font는 `Brewfile`로 설치합니다.
  아직 없으면 `.zshrc`가 해당 부분을 건너뛰므로 셸이 깨지지는 않습니다.

## 설치

```bash
git clone https://github.com/hsskey/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
brew bundle --file=Brewfile
```

`install.sh`는 몇 번을 다시 실행해도 안전합니다.
링크할 자리에 실제 파일이 이미 있으면 덮어쓰지 않고 `*.bak.<타임스탬프>`로 백업한 다음 링크를 만듭니다.
tmux 플러그인 매니저(tpm)도 없으면 알아서 클론합니다. 이후 tmux 안에서 `prefix + I`를 누르면 플러그인이 설치됩니다.

## 로컬 설정 분리

머신이나 회사에 따라 달라지는 값은 git에 올라가지 않는 로컬 파일에 둡니다.

- **git identity**: 이름과 이메일은 `~/.gitconfig.local`에 넣습니다.
  `install.sh`가 템플릿을 만들어 주니 값만 채우면 됩니다.
- **zsh**: `~/.zshrc.local`이 있으면 `.zshrc` 마지막(프롬프트 초기화 직전)에 불러옵니다.
  머신 전용 PATH, API 키, 회사 관련 alias는 전부 이 파일에 둡니다.
  (`zsh/.zshrc.local.example` 참고)

## 나에게 맞게 쓰기

이 저장소를 클론해서 그대로 쓸 생각이라면, 실행하기 전에 몇 가지만 손보세요.

- `~/.gitconfig.local`에 **본인** git identity를 채우세요. 저장소에 올라가 있는
  `.gitconfig`에는 일부러 이름과 이메일을 넣지 않았습니다.
- 머신 전용 설정(PATH, 시크릿, 회사 alias)은 `.zshrc`를 직접 고치지 말고
  `~/.zshrc.local`에 쓰세요.
- ⚠️ `zsh/.zshrc`의 `cld` alias는 `claude --dangerously-skip-permissions`를 실행합니다.
  Claude Code의 권한 확인을 전부 건너뛰는 설정이니, 원치 않으면 이 alias를 지우세요.

## 참고한 저장소

- [yceffort/dotfiles](https://github.com/yceffort/dotfiles) — 도구별 디렉토리 구조와 백업 후 심링크하는 설치 스크립트 스타일
- [msbaek/dotfiles](https://github.com/msbaek/dotfiles) — `*.example` 템플릿과 로컬 오버라이드로 민감한 값을 분리하는 패턴

## 라이선스

[MIT No Attribution](LICENSE) (MIT-0). 출처 표기 없이 자유롭게 쓸 수 있습니다.
