;(function($) {
    $.fn.notice = $.notice = function(arr) {
        var opt = $.extend({
                text: "",
                type: "info",
                canAutoHide: true,
                holdup: "5500",
                fadeTime: "5500",
                canFadeHover: true,
                hasCloseBtn: true,
                canCloseClick: false,
                position: 'top-right',
                zIndex: '9999',
                custom: '',
                icon: ''
            }, arr),
            el = {
                chkPosition: (opt.position == 'bottom-right') ? 'bottom-right' : ((opt.position == 'bottom-left') ? 'bottom-left' : (opt.position == 'top-left') ? 'top-left' : 'top-right'),
                closeOption: (opt.hasCloseBtn) ? '<notice-close></notice-close>' : '<style>#nt' + timeStamp + ':before,#nt' + timeStamp + ':after{display:none}</style>',
                chkIcon: (opt.text.indexOf(" ")) ? 'white-space: pre-wrap; word-wrap: break-word;' : '',
                chkMsg: (opt.text.indexOf(" ")) ? 'white-space: pre-wrap; word-wrap: break-word;' : ''
            }, timeStamp = $.now();
        if ($('notice-wrap').length == 0)
            $('body').append('<notice-wrap position="top-left" style="z-index:' + opt.zIndex + '"><notice-begin></notice-begin></notice-wrap><notice-wrap position="top-right" style="z-index:' + opt.zIndex + '"><notice-begin></notice-begin></notice-wrap><notice-wrap position="bottom-right" style="z-index:' + opt.zIndex + '"><notice-begin></notice-begin></notice-wrap><notice-wrap position="bottom-left" style="z-index:' + opt.zIndex + '"><notice-begin></notice-begin></notice-wrap>');
        var notice = $('<notice class="' + opt.custom + '" close-on-click=' + opt.canCloseClick + ' fade-on-hover=' + opt.fadeOnHover + ' type="' + opt.type + '" style="' + el.chkMsg + '"><i class="material-icons">' + opt.icon + '</i><span>' + opt.text + '</span>' + el.closeOption + '</notice>')
            .insertAfter('notice-wrap[position="' + el.chkPosition + '"] > notice-begin');
        if (opt.canAutoHide)
            setTimeout(function() {
                notice.fadeOut(opt.fadeTime, function() {
                    $(this).remove();
                });
            }, opt.holdup);

        $('notice[close-on-click="true"]').click(function() {
            $(this).fadeOut(opt.fadeTime, function() {
                $(this).remove();
            });
        });
        $('notice > notice-close').click(function() {
            $(this).parent()
                .fadeOut(opt.fadeTime, function() {
                    $(this).remove();
                });
        });
        return this;
    };
}(jQuery));
