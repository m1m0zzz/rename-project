# rename-project

Ableton Liveのプロジェクトフォルダを連番で管理するために  
フォルダのリネームを一括で行うプログラムです

## インストール方法・使い方

1. Rubyをインストールする
2. main.rbをコピペ or `git clone`
3. プログラムを実行 👇

```bash
ruby main.rb path/to/Projects 
```

path/to/Projects の部分を自分の環境に合わせて変更してください

例) 
- `C:\Users\XXX\Documents\Projects`
- `/home/XXX/Desctop`


## example

Before
```
Projects/
  Mumbai Power Project/
    Mumbai Power.als
    ...
  Fuji Opener Project/
    Fuji Opener.als
    ...
```

After

```
Projects/
  000-Mumbai Power Project/
    Mumbai Power.als
    ...
  001-Fuji Opener Project/
    Fuji Opener.als
    ...
```
