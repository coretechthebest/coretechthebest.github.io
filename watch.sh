#questo script viene lanciato ogni ora con crontab (crontab -e, senza sudo, usando l'user comunitario)

#questo comando sovrascrive le impstazioni di stampa con quelle di dafault di evince (lettore pdf)
cp /home/sanpaolo/.config/print-settings /home/sanpaolo/.config/evince/
chmod 777 /home/sanpaolo/.config/evince/print-settings
