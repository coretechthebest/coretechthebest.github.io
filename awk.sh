awk ' \
{ data_a = substr($1, 3, length($1)-2) }
{ user_a = substr($3, 1, length($3)-1) }
{ pagine_a = substr($4, 1, length($4)-1) }
{ copie_a = substr($5, 1, length($5)-1) }

{ $1=$2=$3=$4=$5=$6="" ; file_a = substr($0, 7, length($0)-7) }

{ if ( pagine_a+0 <= pagine_c+0 )
{
	if ( user_c == user_b && file_c == file_b )
	{ }
	else
	{
		user_b = user_c
		pagine_b = pagine_c
		file_b = file_c
		print riga_c
	}
}
}
{ riga_c = data_a "," user_a "," pagine_a*copie_a "," file_a }
{ user_c = user_a }
{ pagine_c = pagine_a }
{ file_c = file_a }

END{
	if ( user_c == user_b && file_c == file_b )
     	{ }
        else
        {
	print riga_c
	}
}' /var/log/cups/page_log > /home/coretech/Documenti/page_log_inc.csv

awk -F"/|:|," '{
printf $1"/" ;
printf "%02d",(match("JanFebMarAprMayJunJulAugSepOctNovDec",$2)+2)/3 ;
print "/" $3 " " $4 ":" $5 "," $0;

}' /home/coretech/Documenti/page_log_inc.csv > /home/coretech/Documenti/page_log.csv
