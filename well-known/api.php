<?php

$curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => "https://customerapi.geovictoria.com/api/v1/attendancebook?oauth_consumer_key=e18799&oauth_signature_method=HMAC-SHA1&oauth_timestamp=1604347495&oauth_nonce=A1MZf7pIoNm&oauth_version=1.0&oauth_signature=axA3qBV/f0YTlcCwgywTRq+6OX0=",
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => "",
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 0,
  CURLOPT_FOLLOWLOCATION => true,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => "POST",
  CURLOPT_POSTFIELDS =>"{\"StartDate\": \"20200501000000\",\r\n\"EndDate\": \"20200502000000\",\r\n\"UserIds\": \"135281131\"}",
  CURLOPT_HTTPHEADER => array(
    "Content-Type: text/plain"
  ),
));

$response = curl_exec($curl);

curl_close($curl);
echo "la respuesta es = ".$response;
