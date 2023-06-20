Tüm Kullanıcıları görebilmek için;

cat /etc/passwd \#Dosyası kullanılır

\#- Her sütun : ile ayrılır 1- Birinci sütun: Kullanıcı adı 2- İkinci
sütun: Eskiden parola hashleri tutulurdu şimdi başka bir dosyaya
taşındı(1980 'li yıllarda shadow dosyasına taşındı) 3- Üçüncü sütun:
Kullanıcı id 'si 4- Dördüncü sütun: Grup id 'si 5- :Kullanıcı Full -name
ve diğer bilgileri 6- :Kullanıcının kendine ait dizini(root için
istisnai bir dosyadır) 7- :Kullanıncının varsayılan shell erişim
programı

Neden bu kadar çok kullanıcı vardır denilebilir?

Aslında burada hepsi gerçek birer kullanıcı değildir. Sistemdeki
uygulamaların bazı dosya-dizin ve servislere erişebilmesi için
oluşturulan sanal kullanıcılardır.

Login erişimnden de anlaşılacağı üzere login erişimleri de yoktur.

Kullanıcı Parolalarını okumak için;

cat /etc/shadow

Normal kullanıcı erişemez, sadece sistem yöneticisi yetisi sahibi olan
root kullanıcısı erişebilir.

ls -al shadow --\> Dersek yetkileri görebiliriz

\#KullancıAdı:HashlenmişParola şeklinde bir tablo gelir! sudo cat
/etc/shadow

\$ -\>Parola kendi içinde karakteri ile ayrılır

İlk kısım hash algoritması ifade eder - $6$ -\> sha256 İkinci kısım salt
-\> DUCHEEFDSX55 Üçüncü kısım -\> hashlenmiş parola Dördüncü kısım -\>
Sayı - Hangi gün değiştiğini ifade eder Beşinci kısım -\> Parola
süresini ve uyarı süresini ifade eder Sonraki alanlar sadece reservedir,
şimdilik bir amacı yoktur.

Diğer kullancıların parolası yok ki hash olsun!

root kullanıcısının parola özelliği de-aktif edilmiştir ve sadece !
vardır.
