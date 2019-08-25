if [ -z $1 ]; then
  echo 'the paramater is empty, it must be encryption or decryption'
elif test $1 = 'encryption'; then
  echo 'do you have the keys already ? [yes/no]'
  while true; do
    read ans
    if test $ans = 'yes'; then
      echo enter the key please
      read key
      echo enter the public key please
      read pub
      break
    elif test $ans = 'no'; then
      echo 'enter the name of the key file'
      read key
      echo enter the name of the public key
      read pub
      `openssl genrsa -out $key 2048 1>/dev/null`
      `openssl rsa -in $key -pubout -out $pub 1>/dev/null`
      break
    else 
        echo  'please answer by yes or no'
    fi
  done
  echo 'please enter the name or the path of your file'
  read file
  echo 'what is the path of your encrypted file ?'
  read enc
  echo ' do you want your file to be encrypted with public key ? [yes/no]'
  while true; do
    read res
    if test $res = 'yes'; then
      `openssl rsautl -encrypt -in $file -out $enc -inkey $pub -pubin`
      break
    elif test $res = 'no'; then
      `openssl rsautl -encrypt -in $file -out $enc -inkey $key`
      break
    else
      echo 'please answer by yes or no '
    fi
  done
elif test $1 = 'decryption' ; then 
  echo please enter the path of the file you want to decrypt
  read file
  echo please enter the path you want your decrypted file to have
  read dec
  echo please enter the the path of the key
  read key
  openssl rsautl -decrypt -in $file -out $dec -inkey $key
else
  echo the parameter entered must be encryption or decryption
fi