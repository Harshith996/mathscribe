<?php

$root_url = "https://api.wolframalpha.com/v2/query?appid=5PPWUX-GEP9JQ5VG7&podstate=Step-by-step+solution&input=";
$input = urlencode($_POST['input']);
$final_url = $root_url . $input;

$response = array();

$xml_string = file_get_contents($final_url);
$xml = simplexml_load_string($xml_string);
$json = json_encode($xml);
$json_array = json_decode($json,TRUE);
// echo $json['@attributes']['success'];
$imp_keys = array("Results", "Solutions", "Limit","Indefinite integrals", "Definite integrals");

foreach($json_array['pod'] as $item) { //foreach element in $arr
    if (in_array($item['@attributes']['title'], $imp_keys))
    {
        if (count($item['subpod']) > 2)
        {
            $url = $item['subpod'][2]['img']['@attributes']['src'];
            $response['url'] = $url;
        }
        else
        {
            $url = $item['subpod'][1]['img']['@attributes']['src'];
            $response['url'] = $url;

        }
        $result_text = $item['subpod'][0]['plaintext'];
        $response['result'] = $result_text;
    }
}

echo json_encode($response);
return;

?>