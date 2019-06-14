                 <div class="demo-social">
                            <div class="p-demo-btn">
                              <h2><a href="{$USR}{$username}/"><img src="{if empty($avatar)}{$AST}img/avatar.jpg{else}{$avatar}{/if}" width="80" height="80" alt="{$username}">
                           {ucfirst($username)}</a></h2>
                            <small><i class="fa fa-user"></i> {if $country}{$country},{/if} {$_MEMBER_SINCE} {$since}</small>
                            </div>
                           {if $role == 'admin'}
                            <div class="p-demo-social">
                                <ul>
                                <li><a href="{$USR}{$username}/"><i class="fa fa-shopping-cart"></i></a></li>
                                <li><a href="{$USR}{$username}/portfolio"><i class="fa fa-briefcase"></i></a></li>
                                </ul>
                            </div>
                           {/if}
                        </div>
                        <!-- Tab Start -->
                        <div class="s-product-tab">
                            <!-- Nav tabs -->
                            <ul class="nav nav-tabs" role="tablist">
                                <li {if $profile} class="active" {/if}><a href="{$USR}{$username}/"><i class="fa fa-user"></i> {$_PROFILE} </a></li>
                                 <li {if $downloads} class="active" {/if}><a href="{$USR}downloads"><i class="fa fa-download"></i> {$_DOWNLOADS}</a></li>
                                 <li {if $settings} class="active" {/if}><a href="{$USR}settings"><i class="fa fa-cog"></i> {$_SETTINGS}</a></li>
                                 <li {if $history} class="active" {/if}><a href="{$USR}deposit-history"><i class="fa fa-history"></i> {$_DEPOSIT_HISTORY}</a></li>
                                 <li {if $deposit} class="active" {/if}><a href="{$USR}deposit"><i class="fa fa-usd"></i> {$_DEPOSIT}</a></li>
                                 <li {if $statement} class="active" {/if}><a href="{$USR}statement"><i class="fa fa-book"></i> {$_STATEMENT}</a></li>
                            </ul>

                        </div>