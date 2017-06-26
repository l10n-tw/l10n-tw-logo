# 開發文件
## 開發本軟體需要的軟體
注意以下軟體的可執行檔目錄（如果有）皆需設定在 `PATH` 環境變數中

* Inkscape(Debian+: inkscape)
	* 進行標誌設計的主要軟體
	* 建議使用上游最新釋出版本，舊版本 Inkscape [有一個複選元素就會程式崩潰的已知軟體缺陷](https://bugs.launchpad.net/inkscape/+bug/1428967)
* 一個較先進的純文字文件編輯器
    * 用來修改一些 Inkscape 較難處理的 SVG 標記
    * 軟體至少要能正確識別無 Unicode BOM 的 UTF-8 字元編碼以及 Unix 風格的行結尾字元序列，原作者本身使用的是 KDE 的 Kate 編輯器(Debian+: kate)
* 思源宋體 / Google Noto Serif
	* 用於中英文字元的字體
	* 至少需要有 SemiBold 字重
	* 如果使用的字型的字型家族名非「思源宋體」必須被設定為視同相同字型，Linux 等使用 FontConfig 的作業系統可以參考[Travis CI 支援/讓 Fontconfig 認為 Subset OTF 變種的思源黑體也是思源黑體.fontconfig.conf](https://github.com/l10n-tw/l10n-tw-logo/blob/HEAD/Travis CI 支援/讓%20Fontconfig%20認為%20Subset%20OTF%20變種的思源黑體也是思源黑體.fontconfig.conf)
* GNU CoreUtils(Debian+: coreutils)
	* 用於軟體建構程序
	* 較舊版基於 Debian 的作業系統散佈版[還需要安裝 realpath 軟體包](https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=730779)
* GNU Bash(Debian+: bash)
	* 用於軟體建構程序
* 7-Zip 的 `7zr` 命令(Debian+: p7zip)
	* 用於軟體建構程序
* XmlStarlet(Debian+: xmlstarlet)
	* 用於軟體建構程序、SVG 語法檢查
* GNU Findutils(Debian+: findutils)
	* 用於提交前自動語法檢查
* The GNU sed stream editor(Debian+: sed)
	* 用於其他分支版本建構
* Git(Debian+: git)
	* 用於專案版本控制與釋出版本版本號的產生
* ShellCheck(Debian+: shellcheck)
    * 用於 GNU Bash 腳本程式潛在問題檢查
    * 建議安裝最新釋出版本以避免僞陽性檢查結果

如果您發現正確安裝了這些軟體後仍遇到問題可能是這個段落的缺陷，請建檔議題讓我們知道。

## 如何建構本軟體
執行[軟體建構解決方案/批次命令/build.bash](../軟體建構解決方案/批次命令/build.bash) 即可，建構中間產物在[建構中間產物](../建構中間產物)子目錄中，建構結果會在[建構結果](../建構結果)子目錄中

## 初始化開發環境
本專案引入了自動語法檢查與套用修正功能，執行[初始化開發環境.bash](../初始化開發環境.bash)即可初始化開發環境。

## 開發新分支 logo
本專案支援建立多個分支的 logo，以下將簡介如何開發新分支並提交新的 logo 分支。

要建立新的 logo 分支的通常程序為：

1. 在 Inkscape 中打開[來源碼/l10n-tw-logo.svg](../來源碼/l10n-tw-logo.svg) 新增新的 logo 圖層，隱藏官方圖層加上修改後*恢復圖層狀態為僅能看到官方版本後存檔*
1. 然後在[軟體建構解決方案/批次命令](../軟體建構解決方案/批次命令)下建立新的用於建構您的分支 logo 的 Bash 腳本片段（那些 `.source.bash` 副檔名的就是了）用 XmlScarlet 軟體操作來啟用／停用您要的圖層並用其他命令（比方說 `sed`）來做您要的修改然後把建構圖片的批次命令建構在[建構中間產物](../建構中間產物)目錄（建構程式之後會自動將[建構中間產物](../建構中間產物)目錄中的檔案打包到[建構結果](../建構結果)目錄）
1. 編輯[軟體建構解決方案/批次命令/build.sh](../軟體建構解決方案/批次命令/build.sh) 加上自己版本的建構程序的 `source` 命令
1. 檢查並提交到自己的 GitHub 分支版本倉庫後向我們提交 pull request！

不確定怎麼做的話可以參考之前的實作：

* [支援建構「台」版 · l10n-tw/l10n-tw-logo@32e89a5](https://github.com/l10n-tw/l10n-tw-logo/commit/32e89a59b58cb585f0229049e47e7005d156a828)
* [新增欸嘍十恩點踢搭補魯版 · l10n-tw/l10n-tw-logo@6404819](https://github.com/l10n-tw/l10n-tw-logo/commit/6404819e4f73d2f5d7f9625fc0cdc21c36746f92)

注意請避免：

* 修改到官方版本的設計
* 除添加 `source` 命令外修改[軟體建構解決方案/批次命令/build.bash](../軟體建構解決方案/批次命令/build.bash)
