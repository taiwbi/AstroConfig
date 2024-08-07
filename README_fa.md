# نئورورا

سلام دوست برنامه‌نویس من! این پیکربندی شخصی‌ من برای AstroNvim هست. این تنظیمات رو مخصوص کار با پایتون، پی‌اچ‌پی (وردپرس و لاراول) و یه کم هم راست بهینه کردم. آماده‌ای که لذت کدنویسی رو دوچندان کنیم؟

![تصویر محیط نئورورا](https://raw.githubusercontent.com/taiwbi/AstroConfig/lite/assets/screenshot.png)

## ✨ ویژگی‌های اصلی

- پشتیبانی کامل از LSP، فرمت‌دهی خودکار، هایلایت سینتکس و ابزارهای عیب‌یابی برای زبان‌های پی‌اچ‌پی، بلید، پایتون، جاوااسکریپت، HTML و CSS، و راست.
- رابط خط فرمان جادویی با استفاده از [noice.nvim](https://github.com/folke/noice.nvim).
- تمام قابلیت‌های فوق‌العاده [AstroNvim](https://astronvim.com/).
- و برای اینکه کارمون تکمیل بشه، یه دختر انیمه‌ای رنگارنگ روی صفحه خوش‌آمدگویی [Alpha](https://github.com/goolord/alpha-nvim) با هنر ASCII. چون چرا که نه؟

## 🛠️ نصب و راه‌اندازی

### قبل از نصب

۱. **از پیکربندی فعلی Neovim خود پشتیبان بگیرید:**
بهتره قبل از هر تغییری، از تنظیمات فعلی‌تون یه کپی داشته باشید:

```sh
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
```

۲. **از این مخزن فورک بگیرید:**
روی دکمه "Fork" در بالای صفحه کلیک کنید تا یه کپی از این مخزن توی اکانت گیت‌هاب خودتون داشته باشید. اگه هم با گیت‌هاب راحت نیستید، می‌تونید مستقیم کلون کنید.

۳. **نصب وابستگی‌ها:**
من از فدورا لینوکس استفاده می‌کنم، پس دستورات رو با `dnf` می‌نویسم. شما متناسب با سیستم‌عامل خودتون تغییرشون بدید:

```sh
sudo dnf install neovim
sudo dnf install node npm
```

برای توسعه PHP و Laravel، کامپوزر، PHP و Blade LSP رو نصب کنید:

```sh
sudo dnf install php composer
composer global require haringsrob/laravel-dev-tools
```

مطمئن شید که مسیر باینری‌های کامپوزر توی `PATH` سیستم‌تون هست:

```sh
# این برای بش هست. برای شل خودتون تنظیمش کنید
if [[ ":$PATH:" != *":$HOME/.composer/vendor/bin:"* ]]; then
    export PATH="$PATH:$HOME/.composer/vendor/bin"
    echo 'export PATH="$PATH:$HOME/.composer/vendor/bin"' >> ~/.bashrc
fi
```

برای کار با راست، ابزارهای لازم رو نصب کنید:

```sh
sudo dnf install rustup
rustup-init
rustup component add rustfmt
```

۴. **کلون کردن مخزن:**

```sh
git clone https://github.com/<نام_کاربری_شما>/<نام_مخزن_شما> ~/.config/nvim
```

### اجرای Neovim

خب، حالا وقتشه که نتیجه کارمون رو ببینیم! نیوویم رو اجرا کنید و از محیط جدیدتون لذت ببرید:

```sh
nvim
```

تمومه! حالا می‌تونید با خیال راحت و لذت بیشتر کد بزنید. امیدوارم از این پیکربندی AstroNvim خوشتون بیاد. کدنویسی خوش! 🚀
