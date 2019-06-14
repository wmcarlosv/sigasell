{include file="$TMP/Pages/Help/header.tpl"}

<title>CoinPayments Setup - {$name}</title>


<div class="login">
    <div class="login-body">
<h2>CoinPayments Setup</h2><hr>

<p>
To enable CoinPayments as a payment method,

Go to Admin Area >> Payment Motheds >> CoinPayments from there enable CoinPayments
</p>
<p>
Add your Public and Private Keys by doing the following:
</p>


<p>1 Login To your CoinPayments account</p>
<p>2 Go to Account > API Keys</p>
<p>3 Click on "Generate new key" button
You will get Public Key and Private Key</p>
<p>4 Add your merchant id and to get it navigate to Account > Account Settings > Basic Settings from there you will find the merchant Id.
Add your IPN Secret. you need to setup it first at your account by doing the following
Go to Account > Account Settings > Merchant Settings
</p>
<p>
In the IPN Secret field, enter a good random string nobody can guess.
In the IPN Verification Method select "HMAC"
Click on "Update Account" button.</p>
    </div>
</div>