{include file='../Layout/header.tpl'}
    <title>Upload new version - Admin</title>

    <div class="layout-content">
        <div class="layout-content-body">
            <div class="title-bar">

                <h1 class="title-bar-title">
                    <span class="d-ib"><div class="fa fa-upload"></div> Upload new version</span>
                </h1>
<hr>

<br><br>

{if $up_err}<div class="alert alert-danger" >Error: Somthing Is wrong Please try again.</div>{/if}

            </div>
<h6>Please wait until we load status of the uploaded version</h6>
<div class="col-sm-12">

<div class="demo-form-wrapper">

<form class="form form-horizontal"  method="POST" enctype="multipart/form-data">

<label>Choose a zip file to upload: <input type="file" name="userfile" /></label>
<br />
    
                        <div class= "form-group">  
                            <div class="col-sm-1 col-sm-offset-1">

                                <h5 style="color: red"></h5>
                                <h5 style="color: #00a000"></h5>

                                <br>
                                <input class="btn btn-info" name="submit" type="submit" value="Upload"/>
                            </div>
                        </div>
                    </form>
                
                <br>
<p>You can get your new version by redownload your item in <a href="https://codsem.com/" target="_blank">codesem</a>.</p>
<p><b>instraction :<b/></p>

<p>
1. Download your new version from where you purchase our script.<br>

2. Check in >> updates folder a zip file.<br>

3. Upload that zip file to the update form.<br>
</p>
<p>Leave a comment in the item page if you're facing issues</p>
                    <br>
                </div>
            </div>
        </div>
    </div>

{include file='../Layout/footer.tpl'}