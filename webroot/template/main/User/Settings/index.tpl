{include file="$TMP/Layout/header.tpl"}

    <!-- BREADCRUMB START HERE -->
    <div class="about-breadcrumb">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="{$HOST}">{$_HOME}</a></li>
                        <li class="breadcrumb-item"><a href="{$HOST}user/{$username}/">{$_USER}</a></li>
                        <li class="breadcrumb-item active">{$_SETTINGS}</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
    <!-- BREADCRUMB END HERE -->
    
{if $personal}<div class="alert alert-{$_PERSONAL}">{$__PERSONAL}</div>{/if}
{if $required}<div class="alert alert-{$_REQUIRED}">{$__REQUIRED}</div>{/if}


    <!-- PRODUCT DETAILS AREA START HERE -->
    <main class="product-details">
        <div class="container">
            <div class="row">
                <div class="col-md-8 col-sm-12">
                    
                    
                {include file='../Tabs/index.tpl'}


                            <!-- Tab panes -->
                            <div class="tab-content">
                                <div role="tabpanel" class="tab-pane fade in active">
                                    <div class="item-detail-tab">
                
						
                        <div class="product-widget">
                            <h3 class="prodect-info-heading"><i class="fa fa-user"></i> {$_PERSONAL_INFORMATION}</h3>
                            <div class="prodect-information">
                                <ul>
                                    <li>
                    <form method="POST">
                            
                    <input type="hidden" id="authenticity_token" name="csrf" value="{$csrfToken}" />
                    
                            <div class="form-group">
                                <label for="name">{$_USERNAME}<span class="required">*</span></label>
                                <input type="text" value="{$username}" disabled=disabled>
                            </div>

                            <div class="form-group">
                                <label for="name">{$_FIRST_NAME}<span class="required">*</span></label>
                                <input type="text" name="f_name" value="{$f_name}">
                            </div>

                            <div class="form-group">
                                <label for="name">{$_LAST_NAME}<span class="required">*</span></label>
                                <input type="text" name="l_name" value="{$l_name}">
                            </div>

                            <div class="form-group">
                                <label for="name">{$_EMAIL_ADDRESS}<span class="required">*</span></label>
                                <input type="email" name="email" value="{$email}">
                            </div>

                            <div class="form-group">
                                <label for="name">{$_COUNTRY}</label>
                                <select name="country">
								<option value="{$country}">{if !empty($country)}{$country}{else}----------{/if}</option>
								<option value="United States">United States</option><option value="United Kingdom">United Kingdom</option><option value="Germany">Germany</option><option value="France">France</option><option value="Italy">Italy</option><option value="Turkey">Turkey</option><option value="India">India</option><option value="Brazil">Brazil</option><option value="Spain">Spain</option><option value="Canada">Canada</option><option value="Australia">Australia</option><option value="Netherlands">Netherlands</option><option value="">----------</option><option value="Andorra">Andorra</option><option value="United Arab Emirates">United Arab Emirates</option><option value="Afghanistan">Afghanistan</option><option value="Antigua and Barbuda">Antigua and Barbuda</option><option value="Albania">Albania</option><option value="Algeria">Algeria</option><option value="Armenia">Armenia</option><option value="Angola">Angola</option><option value="Argentina">Argentina</option><option value="Austria">Austria</option><option value="Aruba">Aruba</option><option value="Azerbaijan">Azerbaijan</option><option value="Bosnia and Herzegovina">Bosnia and Herzegovina</option><option value="Barbados">Barbados</option><option value="Bangladesh">Bangladesh</option><option value="Belgium">Belgium</option><option value="Burkina Faso">Burkina Faso</option><option value="Bulgaria">Bulgaria</option><option value="Bahrain">Bahrain</option><option value="Burundi">Burundi</option><option value="Benin">Benin</option><option value="Brunei">Brunei</option><option value="Bolivia">Bolivia</option><option value="Bahamas">Bahamas</option><option value="Bhutan">Bhutan</option><option value="Botswana">Botswana</option><option value="Belarus">Belarus</option><option value="Belize">Belize</option><option value="Democratic Republic of the Congo">Democratic Republic of the Congo</option><option value="Central African Republic">Central African Republic</option><option value="Congo">Congo</option><option value="Switzerland">Switzerland</option><option value="Ivory Coast">Ivory Coast</option><option value="Chile">Chile</option><option value="Cameroon">Cameroon</option><option value="China">China</option><option value="Colombia">Colombia</option><option value="Costa Rica">Costa Rica</option><option value="Cuba">Cuba</option><option value="Cape Verde">Cape Verde</option><option value="Cyprus">Cyprus</option><option value="Czech Republic">Czech Republic</option><option value="Djibouti">Djibouti</option><option value="Denmark">Denmark</option><option value="Dominica">Dominica</option><option value="Dominican Republic">Dominican Republic</option><option value="Ecuador">Ecuador</option><option value="Estonia">Estonia</option><option value="Egypt">Egypt</option><option value="Western Sahara">Western Sahara</option><option value="Eritrea">Eritrea</option><option value="Ethiopia">Ethiopia</option><option value="Finland">Finland</option><option value="Fiji">Fiji</option><option value="Micronesia">Micronesia</option><option value="Gabon">Gabon</option><option value="Grenada">Grenada</option><option value="Georgia">Georgia</option><option value="Ghana">Ghana</option><option value="Gibraltar">Gibraltar</option><option value="Greenland">Greenland</option><option value="Gambia">Gambia</option><option value="Guinea">Guinea</option><option value="Guadeloupe">Guadeloupe</option><option value="Equatorial Guinea">Equatorial Guinea</option><option value="Greece">Greece</option><option value="Guatemala">Guatemala</option><option value="Guinea Bissau">Guinea Bissau</option><option value="Guyana">Guyana</option><option value="Hong Kong">Hong Kong</option><option value="Honduras">Honduras</option><option value="Croatia">Croatia</option><option value="Haiti">Haiti</option><option value="Hungary">Hungary</option><option value="Indonesia">Indonesia</option><option value="Ireland">Ireland</option><option value="Israel">Israel</option><option value="Isle of Man">Isle of Man</option><option value="Iraq">Iraq</option><option value="Iran">Iran</option><option value="Iceland">Iceland</option><option value="Jamaica">Jamaica</option><option value="Jordan">Jordan</option><option value="Japan">Japan</option><option value="Kenya">Kenya</option><option value="Kyrgyzstan">Kyrgyzstan</option><option value="Cambodia">Cambodia</option><option value="Kiribati">Kiribati</option><option value="Comoros">Comoros</option><option value="Saint Kitts and Nevis">Saint Kitts and Nevis</option><option value="North Korea">North Korea</option><option value="South Korea">South Korea</option><option value="Kuwait">Kuwait</option><option value="Kazakhstan">Kazakhstan</option><option value="Laos">Laos</option><option value="Lebanon" >Lebanon</option><option value="Saint Lucia">Saint Lucia</option><option value="Liechtenstein">Liechtenstein</option><option value="Sri Lanka">Sri Lanka</option><option value="Liberia">Liberia</option><option value="Lesotho">Lesotho</option><option value="Lithuania">Lithuania</option><option value="Luxembourg">Luxembourg</option><option value="Latvia">Latvia</option><option value="Libya">Libya</option><option value="Morocco">Morocco</option><option value="Monaco">Monaco</option><option value="Moldova">Moldova</option><option value="Montenegro">Montenegro</option><option value="Madagascar">Madagascar</option><option value="Macedonia">Macedonia</option><option value="Mali">Mali</option><option value="Myanmar">Myanmar</option><option value="Mongolia">Mongolia</option><option value="Martinique">Martinique</option><option value="Mauritania">Mauritania</option><option value="Malta">Malta</option><option value="Mauritius">Mauritius</option><option value="Maldives">Maldives</option><option value="Malawi">Malawi</option><option value="Mexico">Mexico</option><option value="Malaysia">Malaysia</option><option value="Mozambique">Mozambique</option><option value="Namibia">Namibia</option><option value="Niger">Niger</option><option value="Nigeria">Nigeria</option><option value="Nicaragua">Nicaragua</option><option value="Norway">Norway</option><option value="Nepal">Nepal</option><option value="New Zealand">New Zealand</option><option value="Oman">Oman</option><option value="Panama">Panama</option><option value="Peru">Peru</option><option value="French Polynesia">French Polynesia</option><option value="Papua New Guinea">Papua New Guinea</option><option value="Philippines">Philippines</option><option value="Pakistan">Pakistan</option><option value="Poland">Poland</option><option value="Puerto Rico">Puerto Rico</option><option value="Palestine">Palestine</option><option value="Portugal">Portugal</option><option value="Palau">Palau</option><option value="Paraguay">Paraguay</option><option value="Qatar">Qatar</option><option value="Romania">Romania</option><option value="Serbia">Serbia</option><option value="Russia">Russia</option><option value="Rwanda">Rwanda</option><option value="Saudi Arabia">Saudi Arabia</option><option value="Solomon Islands">Solomon Islands</option><option value="Seychelles">Seychelles</option><option value="Sudan">Sudan</option><option value="Sweden">Sweden</option><option value="Singapore">Singapore</option><option value="Slovenia">Slovenia</option><option value="Slovakia">Slovakia</option><option value="Sierra Leone">Sierra Leone</option><option value="San Marino">San Marino</option><option value="Senegal">Senegal</option><option value="Somalia">Somalia</option><option value="Suriname">Suriname</option><option value="Sao Tome and Principe">Sao Tome and Principe</option><option value="El Salvador">El Salvador</option><option value="Syria">Syria</option><option value="Swaziland">Swaziland</option><option value="Chad">Chad</option><option value="Togo">Togo</option><option value="Thailand">Thailand</option><option value="Tajikistan">Tajikistan</option><option value="Turkmenistan">Turkmenistan</option><option value="Tunisia">Tunisia</option><option value="Tonga">Tonga</option><option value="East Timor">East Timor</option><option value="Trinidad and Tobago">Trinidad and Tobago</option><option value="Tuvalu">Tuvalu</option><option value="Taiwan">Taiwan</option><option value="Tanzania">Tanzania</option><option value="Ukraine">Ukraine</option><option value="Uganda">Uganda</option><option value="Scotland">Scotland</option><option value="Uruguay">Uruguay</option><option value="Uzbekistan">Uzbekistan</option><option value="Saint Vincent and the Grenadines">Saint Vincent and the Grenadines</option><option value="Venezuela">Venezuela</option><option value="Virgin Islands">Virgin Islands</option><option value="Vietnam">Vietnam</option><option value="Vanuatu">Vanuatu</option>
							    <option value="Samoa">Samoa</option><option value="Yemen">Yemen</option><option value="South Africa">South Africa</option><option value="Zambia">Zambia</option><option value="Zimbabwe">Zimbabwe</option>												</select>
								<small><em>{$__COUNTRY}</em></small>
							</div>

                            <button type="submit" name="settings" value="settings" class="custom-btn"><i class="fa fa-floppy-o"></i> {$_SAVE}</button>
                        </form>

                                    </li>
                                </ul>
                            </div>
                            

                        
                </div>

							
								
                                </div>
                            </div>
                </div>
                </div>
                
                             {include file='../Tabs/settings.tpl'}

                </div>
              </div>  
    </main>
		
{include file="$TMP/Layout/footer.tpl"}