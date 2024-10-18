echo "|Package|Version|Headers|DTB|"
echo "|:---|---:|---:|---:|"
for i in $(ls -1 *.txt | grep apt); do
pkg_stable=$(echo $i | cut -d"_" -f2,2)
pkg_headers_version="n/a"
pkg_dtb_version="n/a"
if grep linux-image $i >/dev/null; then
pkg_version=$(cat $i | grep -v linux-headers | grep -v linux-dtb | cut -d"|" -f2 | xargs)
pkg_headers_version=$(cat $i | grep linux-headers | cut -d"|" -f2 | xargs)
pkg_dtb_version=$(cat $i | grep linux-dtb | cut -d"|" -f2 | xargs)
	if [[ $pkg_headers_version != $pkg_version ]]; then
		pkg_headers_version="error"
	fi
else
pkg_version=$(cat $i | grep -v linux-headers | cut -d"|" -f2 | xargs)
fi
echo "| $pkg_stable | $pkg_version | $pkg_headers_version | $pkg_dtb_version |";
done
