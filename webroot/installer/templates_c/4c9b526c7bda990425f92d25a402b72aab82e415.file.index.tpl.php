<?php /* Smarty version Smarty-3.1.21-dev, created on 2019-06-11 08:47:45
         compiled from "D:\xampp\htdocs\DigaSell\webroot\template\main\Installer\index.tpl" */ ?>
<?php /*%%SmartyHeaderCode:10630880245cff4e9192fdc4-64382746%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '4c9b526c7bda990425f92d25a402b72aab82e415' => 
    array (
      0 => 'D:\\xampp\\htdocs\\DigaSell\\webroot\\template\\main\\Installer\\index.tpl',
      1 => 1547128782,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '10630880245cff4e9192fdc4-64382746',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'msg' => 0,
    'build' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.21-dev',
  'unifunc' => 'content_5cff4e91989b58_62367606',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5cff4e91989b58_62367606')) {function content_5cff4e91989b58_62367606($_smarty_tpl) {?><?php echo $_smarty_tpl->getSubTemplate ('../Installer/header.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>


    <title>Welcome to installation</title>

  <div class="container">
    <div class="card card-login mx-auto mt-5">
      <div class="card-header">Welcome to installation!</div>
      <div class="card-body"><?php echo $_smarty_tpl->tpl_vars['msg']->value;?>

        <form method="post" action="database">

        <?php if ($_smarty_tpl->tpl_vars['build']->value) {?>
         <button class="btn btn-primary btn-block" type="submit">Install</button>
        <?php }?>
        
        <br>
      <div style="text-align: center">
          <p><a target="_blank" href="//codsem.com">By Codesem</a></p>
          </div>
        </form>
      </div>
    </div>
  </div><?php }} ?>
