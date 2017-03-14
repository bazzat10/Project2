//if (/MSIE\s([\d.]+)/.test(navigator.userAgent)) {
if (/MSIE\s([\d]+)/.test(navigator.userAgent)) {
    //var version = new Number(RegExp.$1);
    var version = parseInt(RegExp.$1);
    var ieRedirectPage = 'SamboWeb/unsupported.do';
    var minIEVersion = 8;
    var redirectURL = window.location.protocol + '//' + window.location.host + '/' + ieRedirectPage;
    if ((version <= minIEVersion) && (document.URL !== redirectURL)) {
        window.location = redirectURL;
    }
}
