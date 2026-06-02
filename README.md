# NomadStation

NomadStation statik site — araçlar, blog ve küçük üretkenlik özellikleri içerir.

## Otomatik Deploy (GitHub Pages)
Bu repo, `main` branch'e push yapıldığında GitHub Actions ile otomatik olarak Pages'e deploy edilir. Workflow: `.github/workflows/deploy-pages.yml`.

## Collaborator Ekleme
Eğer repo'ya başka bir kullanıcıyı collaborator olarak eklemek isterseniz iki seçenek var:

1. GitHub web arayüzü (kolay):
   - Repo -> Settings -> Manage access -> Invite teams or people -> kullanıcı adını gir -> Role (Write/Maintain) seç -> Invite.

2. Script ile (komut satırı, token gerekli):
   - Personal Access Token (PAT) oluşturun (repo:public_repo veya full repo izinleri önerilir).
   - Token'ı `GH_TOKEN` env var olarak ayarlayın ve script'i çalıştırın:

```bash
export GH_TOKEN="ghp_xxx..."
./scripts/add_collaborator.sh <github-username> [permission]
```

Permission değerleri: `pull`, `push`, `admin`. Varsayılan: `push`.

> Not: Kullanıcı daveti kabul etmeden collaborator görünmeyecektir.

## Secrets (Opsiyonel)
- Eğer özel CI işleri ve otomatik push/diğer işler eklemek isterseniz repo -> Settings -> Secrets -> Actions bölümünden `GH_TOKEN` veya `PAGES_BRANCH_TOKEN` gibi secret'lar ekleyebilirsiniz.

## Notlar
- Sayfa statik olduğundan ek paket veya build adı gerekmiyor; doğrudan repository içeriği deploy ediliyor.
- `scripts/add_collaborator.sh` yardımcı olmalıdır; `jq` yüklü değilse JSON çıktısını parçalayıp da görebilirsiniz.

