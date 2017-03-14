//Henter alle meldinger som er interresante på siden scriptet kjøres.
$(document).ready(function() {
    var popupScopes = new Array();

    if ( $('#popupShow').length){
       //Legger til popupscopes.
        $('#popupShow').each(
            function(ind, elem) {
                var elemScopes = $(elem).attr('data-scopes');
                if(elemScopes) {
                    popupScopes.push(elemScopes);
                } else {
                    popupScopes.push("popup");
                }
            }
        )
    }

    mlog("Popupscopes:" + JSON.stringify(popupScopes));
    hentMeldinger(finnScopes(), popupScopes);
});
finnScopes = function() {
    var scopes = new Array();
    finnScopesByType('fatal', scopes);
    finnScopesByType('feil', scopes);
    finnScopesByType('info', scopes);
    return scopes;
}

finnScopesByType = function(cssClass, scopes) {

    $('.sambo_melding_'+cssClass).each(
             function(ind,elem) {
                 var id = $(elem).attr('id');
                 var parts = id.split(' ');
                 for(var i=0; i < parts.length; i++) {
                     var aScope = parts[i];
                     if(aScope.indexOf(":") > 0) {
                         scopes.push(aScope.substring(aScope.indexOf(":")));
                     } else {
                         scopes.push(aScope);
                     }
                 }
             }
        );
    return scopes;
}

hentMeldinger = function(mScopes, popupScopes) {
    if((mScopes == null || mScopes.length == 0) && (popupScopes == null || popupScopes.length == 0)) return;
    $.ajax({
        url: '/SamboWeb/meldinger/alle',
        dataType: 'json',
        data: 'scopes=' + JSON.stringify(mScopes) + '&suppress=' + JSON.stringify(popupScopes),
        async:true,
        success: function(json) {
            plasserMeldinger(json);
        }
    });
}

plasserMeldinger = function(json) {
    var meldinger = json.meldinger;
    var suppressed = json.suppressed;

    for(var i=0; i < meldinger.length; i++) {
        plasserMelding(meldinger[i]);
    }

    if (suppressed && suppressed.length > 0){
        var tmpHref = "popup.do?popupscope=" + encodeURIComponent(JSON.stringify(suppressed));
        mlog("Suppressed:" + suppressed + ", TmpHref=" + tmpHref);
        $('#popupShow').magnificPopup({
            items: {
                src: tmpHref
            },
            type: 'iframe'
        }).trigger("click");
    }

}

plasserMelding = function(melding, mType) {
    mlog("Plasser melding:" + JSON.stringify(melding));
    var scope = melding.scope;
    var elem = $('#' + scope.split('.').join('\\.'));
    while(elem.length == 0 && scope.indexOf('.') > 0) {
        scope = scope.substring(0,scope.lastIndexOf('.'));
        elem = $('#' + scope.split('.').join('\\.'));
    }
    if(elem.length == 0) {
        elem = $('#--ALL--');
    }
    if(elem.length > 0) {
        plasserMeldingEtter(elem, melding);
    }
}
var teller = 0;
plasserMeldingEtter = function(elem, melding) {
    mlog("PlasserEtter melding:" + JSON.stringify(melding));
    var nyttElement = $('#' + $(elem).attr('id').split('.').join('\\.') + "_impl");
    if(nyttElement.length == 0) {
        nyttElement = elem.clone();
        nyttElement.attr('id', $(elem).attr('id') + '_impl');
        nyttElement.attr('style', '');
        nyttElement.insertAfter(elem);
    }
    var meldingsplass = nyttElement.find('.sambo_intern_melding');
    if(meldingsplass.length > 0) {
        var temp = meldingsplass[0];
        var nyMeldingsplass = $(temp).clone();
        nyMeldingsplass.attr('style', '');
        nyMeldingsplass.html(melding.value);
        nyMeldingsplass.insertAfter(meldingsplass[0]);
    } else {
        nyttElement.html(melding.value);
    }
    //alert("Har satt inn melding:" + nyttElement.html());
}

var logEnabled = false;
mlog = function(str) {
    if(logEnabled && console) {
        try {
            console.log(str);
        } catch(err) {}
    }
}