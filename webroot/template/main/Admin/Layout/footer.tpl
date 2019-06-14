<div class="layout-footer">
    <div class="layout-footer-body">
        <small class="version">Version {$APPversion} | {$date} &copy; <a href="{$HOST}">{$name}</a></small>
    </div>
</div>


</div>
<script>
document.getElementById( 'showTags' ).addEventListener( 'click', function () {
document.getElementById( 'subforms' ).toggleClass( 'hide' );
}, false );
Element.prototype.toggleClass = function ( className ) {
if( this.className.split( ' ' ).indexOf( className ) == -1 ) {
 this.className = ( this.className + ' ' + className ).trim();
} else {
this.className = this.className.replace( new RegExp( '(\\s|^)' + className + '(\\s|$)' ), ' ' ).trim(); };
};

</script>


<script src="{$HOST}template/{$THEME}/Assest/js/vendor.min.js"></script>
<script src="{$HOST}template/{$THEME}/Assest/js/elephant.min.js"></script>
<script src="{$HOST}template/{$THEME}/Assest/js/private/application.min.js"></script>
<script>
    function openCity(evt, cityName) {
    // Declare all variables
    var i, tabcontent, tablinks;

    // Get all elements with class="tabcontent" and hide them
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }

    // Get all elements with class="tablinks" and remove the class "active"
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }

    // Show the current tab, and add an "active" class to the button that opened the tab
    document.getElementById(cityName).style.display = "block";
    evt.currentTarget.className += " active";
}
// Get the element with id="defaultOpen" and click on it
document.getElementById("defaultOpen").click();

</script>

</body>
</html>