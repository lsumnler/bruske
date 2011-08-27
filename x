create table texassumrpt as
               SELECT name, taxno, taxpct
               FROM texasdtlrpt  
               group by taxno