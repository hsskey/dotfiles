# AGENTS.md

이 저장소는 공개(public) dotfiles입니다.
커밋되는 모든 바이트는 영구히 공개된다고 가정하고 작업하세요.

## Rules

- 머신·회사 전용 값(git identity, API 키, 사내 호스트, 머신 전용 PATH)은 절대 커밋하지 않습니다.
  `~/.gitconfig.local`, `~/.zshrc.local` 로 분리하고, 필요하면 `*.local.example` 템플릿만 추가합니다.
- 경로는 `/Users/<name>` 하드코딩 대신 `$HOME`을 사용합니다.
- `$HOME`의 실제 설정에서 파일을 가져올 때는 디렉토리째 복사하지 말고, 파일 단위로 전체 내용을 읽고 검토한 뒤 복사합니다.
- 커밋 전 staged tree에 시크릿 스캔을 돌립니다:
  `git grep --cached -inE 'AKIA|ghp_|gho_|github_pat_|xox|sk-|-----BEGIN|PRIVATE KEY|password|passwd|secret|token|api_key|Bearer |<your-company>'`
  (`<your-company>`는 자리표시자입니다. 실제 회사명 등 식별 가능한 용어는 이 저장소에 커밋하지 말고, 추적되지 않는 로컬 파일에 보관하세요.)
- `install.sh`는 idempotent해야 하고, 기존 실제 파일은 `*.bak.<timestamp>`로 백업 후 링크합니다.
  변경 시 worktree 안 임시 디렉토리에 `HOME`을 지정해 테스트하고, 실제 `$HOME`에는 실행하지 않습니다.

## Layout

도구별 디렉토리(zsh/, git/, nvim/, tmux/, ghostty/, gh/) + 루트 Brewfile + install.sh.
새 도구 설정을 추가할 때 이 구조를 따릅니다.

## Maintaining this file

이 파일에는 이 프로젝트의 거의 모든 미래 에이전트 세션에 유용한 지식만 담습니다.
코드베이스가 이미 보여주는 내용은 반복하지 말고, 권위 있는 파일이나 명령을 가리키세요.
새 항목을 덧붙이기보다 기존 항목을 다시 쓰거나 정리하는 쪽을 우선합니다.
이 파일을 수정할 때도 이 기준을 유지하고, 항목은 간결하게 유지하세요.
