
echo encryption/decryption \?
read ans
if test $ans = 'encryption'; then
echo "enter the path of your file"
read path
echo "enter the name of the encrypted file"
read file
`openssl enc -aes-256-cbc -base64 -in $path -out $file`
elif test $ans = decryption; then
echo enter the path of your encrypted file
read path
echo enter the path of your new file
read file
`openssl enc -aes-256-cbc -d -base64 -in $path -out $file`
else 
echo please enter \"encryption\" or \"decryption\"
fi
