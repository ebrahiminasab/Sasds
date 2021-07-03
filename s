<?php

ob_start();

$API_KEY = '1854894012:AAHMf8m_ItlXZwH8MXLC0Am-YwIft4i8VKc';
define('API_KEY',$API_KEY);
function bot($method, $datas = [])
{
    $url = "https://api.telegram.org/bot" . API_KEY . "/" . $method;
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_POSTFIELDS, $datas);
    $res = curl_exec($ch);
    if (curl_error($ch)) {
        var_dump(curl_error($ch));
    } else {
        return json_decode($res);
    }
}

function sendmessage($chat_id, $text)
{
    bot('sendMessage', [
        'chat_id' => $chat_id,
        'text' => $text,
        'parse_mode' => "MarkDown"
    ]);
}

function deletemessage($chat_id, $message_id)
{
    bot('deletemessage', [
        'chat_id' => $chat_id,
        'message_id' => $message_id,
    ]);
}

function sendaction($chat_id, $action)
{
    bot('sendchataction', [
        'chat_id' => $chat_id,
        'action' => $action
    ]);
}

function Forward($KojaShe, $AzKoja, $KodomMSG)
{
    bot('ForwardMessage', [
        'chat_id' => $KojaShe,
        'from_chat_id' => $AzKoja,
        'message_id' => $KodomMSG
    ]);
}

function sendphoto($chat_id, $photo, $action)
{
    bot('sendphoto', [
        'chat_id' => $chat_id,
        'photo' => $photo,
        'action' => $action
    ]);
}

function objectToArrays($object)
{
    if (!is_object($object) && !is_array($object)) {
        return $object;
    }
    if (is_object($object)) {
        $object = get_object_vars($object);
    }
    return array_map("objectToArrays", $object);
}

function save($filename,$TXTdata)
{
    $myfile = fopen($filename, "w") or die("Unable to open file!");
    fwrite($myfile, "$TXTdata");
    fclose($myfile);
}
/////////////////////////////////////
$update = json_decode(file_get_contents('php://input'));
$message = $update->message;
$chid = $update->channel_post->message->message_id;
$message_id = $message->message_id;
$chat_id = $update->message->chat->id;
$from_id = $update->message->from->id;
$c_id = $message->forward_from_chat->id;
$forward_id = $update->message->forward_from->id;
$forward_chat = $update->message->forward_from_chat;
$forward_chat_username = $update->message->forward_from_chat->username;
$forward_chat_msg_id = $update->message->forward_from_message_id;
@$shoklt = file_get_contents("data/$chat_id/shoklat.txt");
@$penlist = file_get_contents("data/pen.txt");
$text = $message->text;
@mkdir("data/$chat_id");
@$saeed = file_get_contents("data/$chat_id/saeed.txt");
@$list = file_get_contents("saeed.txt");
$chatid = $update->callback_query->message->chat->id;
$fromid = $update->callback_query->message->from->id;
$data = $update->callback_query->data;
$message_id2 = $update->callback_query->message->message_id;
$fromm_id = $update->inline_query->from->id;
$fromm_user = $update->inline_query->from->username;
$inline_query = $update->inline_query;
$query_id = $inline_query->id;
$name = $update->message->from->first_name;
$username = $update->message->from->username;
//@prog_hack//
if($text == '/start'){
bot('sendmessage',[
'chat_id'=>$chat_id,
'text'=>"آسلام عزیزم خوش اومدی🤠
اگر میخوای بری کانال vip از طریق دکمه زیر اقدام کن🙏🏻",
'parse_mode'=>"MarkDown",
        'reply_markup'=>json_encode([
            'keyboard'=>[
[
    ['text'=>"ورود به کانال vip 🔐"]
                      ],
                ]
            ])
        ]);
    }
elseif($text == "بازگشت📍") {
bot('sendmessage',[
        'chat_id'=>$update->message->chat->id,
        'text'=>"به منوی اصلی برگشتیم😃",
        'parse_mode'=>'MarkDown',
        'reply_markup'=>json_encode([
              'keyboard'=>[
[
    ['text'=>"ورود به کانال vip 🔐"]
                      ],
                ]
            ])
        ]);
    }
elseif($text == "ورود به کانال vip 🔐") {
bot('sendmessage',[
        'chat_id'=>$update->message->chat->id,
        'text'=>"دوست عزیز برای ورود به کانال vip لطفا  قوانین زیر را رعایت کنید🙏🏻👇🏻
1 هیچ یک از سورس را برای کسی نفرستید.
2 شما دائمی در چنل هستید پس سورس هارا فروارد نکنید جایی
3 اگر حلال و حروم سرتون میشه هیچ سورس و اموزشی رو پخش نکنید


اگر میتونید قوانین را رعایت کنید از طریق درگاه زیر اقدام کنید.
IDPay.ir/saeednoroozi/50000",
        'parse_mode'=>'MarkDown',
        'reply_markup'=>json_encode([
              'keyboard'=>[
[
    ['text'=>"پرداخت کردم😍"]
                      ],
                ]
            ])
        ]);
    }
elseif($text == "پرداخت کردم😍") {
bot('sendmessage',[
        'chat_id'=>$update->message->chat->id,
        'text'=>"دوست عزیز اگر پرداخت شما با موفیقت انجام شده عکسی از رسید را به ایدی زیر بفرستاید🙏🏻
@prog_hack",
        'parse_mode'=>'MarkDown',
        'reply_markup'=>json_encode([
              'keyboard'=>[
[
    ['text'=>"بازگشت📍"]
                      ],
                ]
            ])
        ]);
    }

?>
