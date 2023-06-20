Kullanıcıyı Gruba Ekleme Çıkarma

Linuxta herbir dosya, dizin ya da uygulamanın bir sahibi ve grubu
vardır.

Ve bu gruplara tanımlanmış veya atanmış izinler bulunur.

    ls -al yaz göster..

Gruplar yetkilendirme konusunda bizim işimizi çok kolaylaştıran bir
yapıdır. Mesela muhasebeye yeni çalışan geldi, kullanıcı ekleyebilirim
veya ayrıldı ise silebilirim.

Yetkilendirmeler daha çok grup bazlı olarak yapılır. Bireysel
yetkilendirme pek yapılmaz.

sudo addgroup GurupAdı \# Gurup ekleme sudo addgroup bilgi\_islem

sudo delgroup GurupAdı \# Gurup silme sudo delgroup bilgi\_islem

\#Sistemde hangi gruplar var: \>1.yol: sudo getent group \#Gurupları
listeleme

> 2.yol: sudo cat /etc/group

Kullancıyı guruba ekleme
========================

sudo usermod -a -G GurupAdı KullanıcıAdı sudo usermod -a -G bilgi\_islem
ali

sudo getent group

(Note: Kullanıcı oluştururken kendi adında bir grupta oluşturulur.)

\#Kullanıcıyı gruptan çıkarma sudo deluser KullanıcıAdı GurupAdı \#
deluser ali bilgi\_islem \#deluser ali Dikkat: ali 'yi/ kullanıcısını
sistemden siler \#Grup adını yazmayı unutma !

    En yetkili kullanıcı root kullanıcısıdır -> Tüm erişim izinlerine sahiptir.
    Dosyaları okuyabilir, değiştirebilir, çalıştırabilir.
    Sahibi olmadığı  Dosyaları okuyabilir, değiştirebilir, çalıştırabilir.
    Aynı zamanda dosyaların sahibi olan kullanıcıları ve grupları da değiştirebilme yetkilerine sahiptir.
    root grubuna dahil olan bir kullanıcı -> sudo komutu ile bunları gerçekleştirebilir.

\#Bir kullanıcının hangi grupta olduğunu bulmak \# Kullanıcı hangi
gurupta sudo groups KullanıcıAdı

\# Kullanıcı hangi gurupta (Id gösterimli) sudo id username

    # Kullanıcının şifresini değiştir.

sudo passwd KullanıcıAdı

grep -E '^UID\_MIN\|^UID\_MAX' /etc/login.defs

1000 ile 60000 arasındakiler user

Tüm user ları listelemek için
=============================

less /etc/passwd

veya

getent passwd

https://linuxize.com/post/how-to-list-users-in-linux/

Toplu olarak değişiklikler

\#grep -v parametresi invert için kullanılır \#Sadece dosya olanları
listele !

mark\@linux-desktop:\~\$ file \* \| grep -v "directory"

sudo chown erkan kimya matematik sudo chown `<User_name>`{=html}
`<File1>`{=html} `<File2>`{=html} `<File3>`{=html}

sudo chgrp administrators kimya matematik sudo chgrp
`<group_name>`{=html} `<File1>`{=html} `<File2>`{=html} `<File3>`{=html}

Dizin Sahipliğini ve Grubunu değiştirme
=======================================

Bir dizinin sahipliğini veya grubunu değiştirmek alttaki dosyaları
etkilemez

sudo chown erkan Dersler/

Bunu gerçekleştirmek için recursive yani -R parametresi kullanılır

sudo chown -R erkan Dersler/

Dizinin ve altındaki dosya ve dizinlerin grubunu değiştirmek için sudo
chgrp -R erkan Öğrenciler/

\#Bulunduğum dizindeki tüm dosya ve klasörlerin sahipliklerini ve
gruplarını topluca değiştirmek için

sudo chown -R `<User-name>`{=html}:`<Group-name>`{=html} \*

komutu kullanılır.

sudo chown -R erkan Öğrenciler/
