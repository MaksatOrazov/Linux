Kullanıcı İşlemleri

\#Bazı komutlar kullanıcı yetkisi gerektirmektedir. Bunu sağlamak için;
sudo su \#su-\>super user olarak, do-\> yap !

Kullanıcı ekleme işlemi \#1. yol useradd ali

useradd komutu -\> 1.home/ali 2.etc/passwd ali satırını oluşturur 3.Bir
id ataması yapar 4.Aynı isimle bir grup oluşturur

    sudo cat /etc/shadow -Parolayı değiştir ve göster

\#1. yol(arka planda useradd komutu veya programını kullanır) adduser
ali

        parola
        tam isim
        Oda no..
        ..
        ..

\#Enter varsayılanda evet demektir.

Kullanıcı silme işlemi

\#1.yol \#Sadece kullanıcıyı siler, home dizinini silmez, yani kullanıcı
dosyalarını silmez \#Bunun bir amacıda güvenliği sağlamaktır. Dosyaları
erişilebilir, kalmaktadır.

    deluser ali 

    Bu grupta başka kullanıcı kalmadığı için bilgi verir!

\#2.yol\
userdel ali

man deluser \#Komutun kullanımını gösterir. Burada --remove-home
parametresi vardır.

deluser --remove-home ali

Kullanıcı şifresini değiştirme işlemi sırasında parola ekrana yazmaz
gibi olur ancak arka tarafta işlenir.

    passwd ali
    Yeni parolası: 2
    Yeni parolasını tekrar girin: 2

Kullanıcıyı Kilitlemek ve Açmak passwd --help -l parametresi kilitler.
passwd -l ali

-u parametresi kilidi açar. passwd -u ali
