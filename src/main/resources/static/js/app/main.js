const NS = "YWM";
(function (global, factory) {
        "use strict";

        if (typeof exports === 'object' && typeof module !== 'undefined') {
            factory(exports);
        }
        else if (typeof define === 'function' && define.amd) {
            define(['exports'], factory)
        }
        else { // Browser
            factory((global[NS] = {}))
        }
    }(this, function (exports) {
        'use strict';

        const version = "v_1.0.0";
        const author = "Herbert Yu";


        var lastId = 0; // Number Last unique ID used by [`stamp()`](#util-stamp)

        // @function stamp(obj: Object): Number
        // Returns the unique ID of an object, assigning it one if it doesn't have it.
        function stamp(obj) {
            let key = "_" + NS + "_id";
            obj[key] = obj[key] || ++lastId;
            return obj[key];
        }

        // @function trim(str: String): String
        // Compatibility polyfill for [String.prototype.trim](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/String/Trim)
        function trim(str) {
            return str.trim ? str.trim() : str.replace(/^\s+|\s+$/g, '');
        }

        // @function splitWords(str: String): String[]
        // Trims and splits the string on whitespace and returns the array of parts.
        function splitWords(str) {
            return trim(str).split(/\s+/);
        }

        let Util = {
            extend: function (destination) {
                var property, j, source, len = arguments.length;

                for (j = 1; j < len; j++) {
                    source = arguments[j];
                    for (property in source) {
                        destination[property] = source[property];
                    }
                }
                return destination;
            },
            extendNotOverride: function (destination) { //已有的相同属性不覆盖
                var property, j, source, len = arguments.length;

                for (j = 1; j < len; j++) {
                    source = arguments[j];
                    for (property in source) {
                        if (destination[property]) {
                            continue;
                        }
                        destination[property] = source[property];
                    }
                }
                return destination;
            },

            getHowManyDaysOfMonth(Year, Month) { //获取一个月 有多少天
                var temp = new Date(Year, Month, 1);
                return new Date(temp.getTime() - 864e5).getDate();
            },
            getDateFirst: function (date) {
                if (!(date instanceof Date)) {
                    if (typeof date == "number" && !isNaN(date)) {  //date 也可以为long类型 时间戳
                        date = new Date(date);
                    } else {
                        throw new Error("非法参数date");
                    }
                }
                return date.setHours(0, 0, 0, 0)
            },
            getDateLast: function (date) {
                if (!(date instanceof Date)) {
                    if (typeof date == "number" && !isNaN(date)) {  //date 也可以为long类型 时间戳
                        date = new Date(date);
                    } else {
                        throw new Error("非法参数date");
                    }
                }
                return date.setHours(23, 59, 59, 999)
            },
            getMonthFirst: function (date) {
                if (!(date instanceof Date)) {
                    if (typeof date == "number" && !isNaN(date)) {  //date 也可以为long类型 时间戳
                        date = new Date(date);
                    } else {
                        throw new Error("非法参数date");
                    }
                }
                date.setDate(1);
                date.setHours(0, 0, 0, 0);
                return date.getTime();
            },
            getMonthLast: function (date) {
                if (!(date instanceof Date)) {
                    if (typeof date == "number" && !isNaN(date)) {  //date 也可以为long类型 时间戳
                        date = new Date(date);
                    } else {
                        throw new Error("非法参数date");
                    }
                }
                let days = TXiss.getHowManyDaysOfMonth(date.getFullYear(), date.getMonth() + 1);
                date.setDate(days);
                return date.setHours(23, 59, 59, 999)
            },

            formatDateTime: function (date, fmt) {

                if (!(date instanceof Date)) {
                    if (typeof date == "number" && !isNaN(date)) {  //date 也可以为long类型 时间戳
                        date = new Date(date);
                    } else {
                        return "";
                    }
                }

                fmt = fmt || "yyyy-MM-dd HH:mm";
                var o = {
                    "M+": date.getMonth() + 1, //月份
                    "d+": date.getDate(), //日
                    "h+": date.getHours() % 12 == 0 ? 12 : date.getHours() % 12, //小时
                    "H+": date.getHours(), //小时
                    "m+": date.getMinutes(), //分
                    "s+": date.getSeconds(), //秒
                    "q+": Math.floor((date.getMonth() + 3) / 3), //季度
                    "S": date.getMilliseconds() //毫秒
                };
                var week = {
                    "0": "\u65e5",
                    "1": "\u4e00",
                    "2": "\u4e8c",
                    "3": "\u4e09",
                    "4": "\u56db",
                    "5": "\u4e94",
                    "6": "\u516d"
                };
                if (/(y+)/.test(fmt)) {
                    fmt = fmt.replace(RegExp.$1, (date.getFullYear() + "").substr(4 - RegExp.$1.length));
                }
                if (/(E+)/.test(fmt)) {
                    fmt = fmt.replace(RegExp.$1, ((RegExp.$1.length > 1) ? (RegExp.$1.length > 2 ? "\u661f\u671f" : "\u5468") : "") + week[date.getDay() + ""]);
                }
                for (var k in o) {
                    if (new RegExp("(" + k + ")").test(fmt)) {
                        fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
                    }
                }
                return fmt;
            },

            writeScript: function (url) {
                document.write("<scr" + "ipt type='text/javascript' src=" + url + "></sc" + "ript>");
            },
            getScriptWithPromise: function (url) {
                return new Promise(function (resolve, reject) {
                        var js_script = document.createElement('script');
                        js_script.type = "text/javascript";
                        js_script.src = url;
                        document.getElementsByTagName('head')[0].appendChild(js_script);
                        js_script.onload = function () {
                            resolve();
                        };
                    }
                );
            },
            getScriptAsync: function (url, onSuccess, onError) {
                // if (_inspectBrowser() && !TXiss.browser.isIE) { //use promise
                //
                //     var promise = TXiss.getScriptWithPromise(url);
                //     promise.then(onSuccess).catch(onError);
                //
                // } else { //use callback
                var js_script = document.createElement('script');
                js_script.type = "text/javascript";
                js_script.src = url;
                js_script.onload = function () {
                    try {
                        onSuccess();
                    } catch (e) {
                        TXiss.warn(e);
                        onError(e);
                    }
                };
                js_script.onerror = onError;
                document.getElementsByTagName('head')[0].appendChild(js_script);
                // }
            },
            loadCssFile: function (url) {
                var head = document.getElementsByTagName('HEAD').item(0);
                var style = document.createElement('link');
                style.href = url;
                style.rel = 'stylesheet';
                style.type = 'text/css';
                head.appendChild(style);
            },
            playAudio: function (src) { //音频文件地址
                if (!src) {
                    return;
                }
                var body = document.body;
                var div = document.createElement('div');
                div.setAttribute('id', 'playAudio');
                div.style.width = '0px';
                div.style.height = '0px';
                div.style.position = 'absolute';
                div.style.top = '-1111px';

                if (!!window.ActiveXObject) {
                    div.innerHTML = '<embed id="music" volume="0" src="' + src + '" type="application/x-mplayer2" autostart="true" loop="false" height="0" width="0" ></embed>';
                    setTimeout(function () {
                        div.parentNode.removeChild(div);
                    }, 2000)
                } else {
                    div.innerHTML = '<audio id="music" preload="auto" volume="1" src="' + src + '"></audio>';
                    div.children[0].play();
                    div.children[0].addEventListener('ended', function () {
                        div.parentNode.removeChild(div);
                    }, false);
                }
                body.appendChild(div);
            },

            //RGB 颜色转 16进制颜色
            rgbToHex: function (r, g, b) { //rgbToHex(255, 165, 1); // 'ffa501'
                return ((r << 16) + (g << 8) + b).toString(16).padStart(6, '0');
            },
            //window.location.search 转 JS 对象
            urlParamToObj: function (search) { //let search = '?ie=utf-8&f=8&rsv_bp=1&rsv_idx=1&tn=baidu&wd=js&rsv_pq=a86b5e5f0007bceb&rsv_t=1e1fAVan%2BVlnkhJHFB0BIGLdLM2slszYMJBTTfFkmyyBUzBpw0ggeuVDE50&rqlang=cn&rsv_enter=0&inputT=1287&rsv_sug3=5&rsv_sug1=3&rsv_sug7=101&rsv_sug2=0&rsv_sug4=1907'
                return JSON.parse(`{"${decodeURIComponent(search.substring(1)).replace(/"/g, '\\"').replace(/&/g, '","').replace(/=/g, '":"')}"}`);
            },

            addURLParam: function (url, name, value) {
                url += (url.indexOf("?") == -1 ? "?" : "&");
                url += encodeURIComponent(name) + "=" + encodeURIComponent(value);
                return url;
            },

            addURLParams: function (url, name_value_map) { //
                if (name_value_map && Object.getOwnPropertyNames(name_value_map).length > 0) {
                    for (var name in name_value_map) {
                        return TXiss.addURLParam(url, name, name_value_map[name]);
                    }
                }
                return url;
            },

            toParams: function (name_value_map) {
                var str = "";
                if (name_value_map && Object.getOwnPropertyNames(name_value_map).length > 0) {
                    for (var name in name_value_map) {
                        str += (str.indexOf("?") == -1 ? "?" : "&");
                        str += encodeURIComponent(name) + "=" + encodeURIComponent(name_value_map[name]);
                    }
                }
                return str;
            },

            getDistance: function (lat1, lng1, lat2, lng2) {
                if (lat1 <= 0 || lng1 <= 0 || lat2 <= 0 || lng2 < 0) {
                    return "";
                }
                var radLat1 = lat1 * Math.PI / 180.0;
                var radLat2 = lat2 * Math.PI / 180.0;
                var a = radLat1 - radLat2;
                var b = lng1 * Math.PI / 180.0 - lng2 * Math.PI / 180.0;
                var s = 2 * Math.asin(Math.sqrt(Math.pow(Math.sin(a / 2), 2) +
                    Math.cos(radLat1) * Math.cos(radLat2) * Math.pow(Math.sin(b / 2), 2)));
                s = s * 6378.137;// EARTH_RADIUS;
                s = Math.round(s * 10000) / 10000;

                return (s <= 1) ? (s * 1000).toFixed(0) + "m" : s.toFixed(1) + "km";
            },

            hashCode: function (str) {
                if (typeof str != "string") {
                    str = JSON.stringify(str);
                }
                var hash = 0;
                if (str.length == 0) return hash;
                for (let i = 0; i < str.length; i++) {
                    let char = str.charCodeAt(i);
                    hash = ((hash << 5) - hash) + char;
                    hash = hash & hash;
                }
                return hash;
            },

            /**
             * debouncing, executes the function if there was no new event in $wait milliseconds
             * @param func
             * @param wait 毫秒
             * @param scope
             * @returns {Function}
             */
            debounce: function (func, wait, scope) {
                var timeout;
                return function () {
                    var context = scope || this, args = arguments;
                    var later = function () {
                        timeout = null;
                        func.apply(context, args);
                    };
                    clearTimeout(timeout);
                    timeout = setTimeout(later, wait);
                };
            },

            /**
             * in case of a "storm of events", this executes once every $threshold
             * @param fn
             * @param threshhold 毫秒
             * @param scope
             * @returns {Function}
             */
            throttle: function (fn, threshhold, scope) {
                threshhold || (threshhold = 250);
                var last,
                    deferTimer;
                return function () {
                    var context = scope || this;

                    var now = +new Date,
                        args = arguments;
                    if (last && now < last + threshhold) {
                        // hold on to it
                        clearTimeout(deferTimer);
                        deferTimer = setTimeout(function () {
                            last = now;
                            fn.apply(context, args);
                        }, threshhold);
                    } else {
                        last = now;
                        fn.apply(context, args);
                    }
                };
            },
        };

        let Events = {
            /* @method on(type: String, fn: Function, context?: Object): this
         * Adds a listener function (`fn`) to a particular event type of the object. You can optionally specify the context of the listener (object the this keyword will point to). You can also pass several space-separated types (e.g. `'click dblclick'`).
         *
         * @alternative
         * @method on(eventMap: Object): this
         * Adds a set of type/listener pairs, e.g. `{click: onClick, mousemove: onMouseMove}`
         */
            on: function (types, fn, context) {

                // types can be a map of types/handlers
                if (typeof types === 'object') {
                    for (var type in types) {
                        // we don't process space-separated events here for performance;
                        // it's a hot path since Layer uses the on(obj) syntax
                        this._on(type, types[type], fn);
                    }

                } else {
                    // types can be a string of space-separated words
                    types = splitWords(types);

                    for (var i = 0, len = types.length; i < len; i++) {
                        this._on(types[i], fn, context);
                    }
                }

                return this;
            },

            /* @method off(type: String, fn?: Function, context?: Object): this
         * Removes a previously added listener function. If no function is specified, it will remove all the listeners of that particular event from the object. Note that if you passed a custom context to `on`, you must pass the same context to `off` in order to remove the listener.
         *
         * @alternative
         * @method off(eventMap: Object): this
         * Removes a set of type/listener pairs.
         *
         * @alternative
         * @method off: this
         * Removes all listeners to all events on the object. This includes implicitly attached events.
         */
            off: function (types, fn, context) {

                if (!types) {
                    // clear all listeners if called without arguments
                    delete this._events;

                } else if (typeof types === 'object') {
                    for (var type in types) {
                        this._off(type, types[type], fn);
                    }

                } else {
                    types = splitWords(types);

                    for (var i = 0, len = types.length; i < len; i++) {
                        this._off(types[i], fn, context);
                    }
                }

                return this;
            },

            // attach listener (without syntactic sugar now)
            _on: function (type, fn, context) {
                this._events = this._events || {};

                /* get/init listeners for type */
                var typeListeners = this._events[type];
                if (!typeListeners) {
                    typeListeners = [];
                    this._events[type] = typeListeners;
                }

                if (context === this) {
                    // Less memory footprint.
                    context = undefined;
                }
                var newListener = {fn: fn, ctx: context},
                    listeners = typeListeners;

                // check if fn already there
                for (var i = 0, len = listeners.length; i < len; i++) {
                    if (listeners[i].fn === fn && listeners[i].ctx === context) {
                        return;
                    }
                }

                listeners.push(newListener);
            },

            _off: function (type, fn, context) {
                var listeners,
                    i,
                    len;

                if (!this._events) {
                    return;
                }

                listeners = this._events[type];

                if (!listeners) {
                    return;
                }

                if (!fn) {
                    // Set all removed listeners to noop so they are not called if remove happens in fire
                    for (i = 0, len = listeners.length; i < len; i++) {
                        listeners[i].fn = falseFn;
                    }
                    // clear all listeners for a type if function isn't specified
                    delete this._events[type];
                    return;
                }

                if (context === this) {
                    context = undefined;
                }

                if (listeners) {

                    // find fn and remove it
                    for (i = 0, len = listeners.length; i < len; i++) {
                        var l = listeners[i];
                        if (l.ctx !== context) {
                            continue;
                        }
                        if (l.fn === fn) {

                            // set the removed listener to noop so that's not called if remove happens in fire
                            l.fn = falseFn;

                            if (this._firingCount) {
                                /* copy array in case events are being fired */
                                this._events[type] = listeners = listeners.slice();
                            }
                            listeners.splice(i, 1);

                            return;
                        }
                    }
                }
            },

            // @method fire(type: String, data?: Object, propagate?: Boolean): this
            // Fires an event of the specified type. You can optionally provide an data
            // object — the first argument of the listener function will contain its
            // properties. The event can optionally be propagated to event parents.
            fire: function (type, data, propagate) {
                if (!this.listens(type, propagate)) {
                    return this;
                }

                var event = extend({}, data, {
                    type: type,
                    target: this,
                    sourceTarget: data && data.sourceTarget || this
                });

                if (this._events) {
                    var listeners = this._events[type];

                    if (listeners) {
                        this._firingCount = (this._firingCount + 1) || 1;
                        for (var i = 0, len = listeners.length; i < len; i++) {
                            var l = listeners[i];
                            l.fn.call(l.ctx || this, event);
                        }

                        this._firingCount--;
                    }
                }

                if (propagate) {
                    // propagate the event to parents (set with addEventParent)
                    this._propagateEvent(event);
                }

                return this;
            },

            // @method listens(type: String): Boolean
            // Returns `true` if a particular event type has any listeners attached to it.
            listens: function (type, propagate) {
                var listeners = this._events && this._events[type];
                if (listeners && listeners.length) {
                    return true;
                }

                if (propagate) {
                    // also check parents for listeners if event propagates
                    for (var id in this._eventParents) {
                        if (this._eventParents[id].listens(type, propagate)) {
                            return true;
                        }
                    }
                }
                return false;
            },

            // // @method once(…): this
            // // Behaves as [`on(…)`](#evented-on), except the listener will only get fired once and then removed.
            // once: function (types, fn, context) {
            //
            //     if (typeof types === 'object') {
            //         for (var type in types) {
            //             this.once(type, types[type], fn);
            //         }
            //         return this;
            //     }
            //
            //     var handler = bind(function () {
            //         this
            //             .off(types, fn, context)
            //             .off(types, handler, context);
            //     }, this);
            //
            //     // add a listener that's executed once and removed after that
            //     return this
            //         .on(types, fn, context)
            //         .on(types, handler, context);
            // },

            // @method addEventParent(obj: Evented): this
            // Adds an event parent - an `Evented` that will receive propagated events
            addEventParent: function (obj) {
                this._eventParents = this._eventParents || {};
                this._eventParents[stamp(obj)] = obj;
                return this;
            },

            // @method removeEventParent(obj: Evented): this
            // Removes an event parent, so it will stop receiving propagated events
            removeEventParent: function (obj) {
                if (this._eventParents) {
                    delete this._eventParents[stamp(obj)];
                }
                return this;
            },

            _propagateEvent: function (e) {
                for (var id in this._eventParents) {
                    this._eventParents[id].fire(e.type, extend({
                        layer: e.target,
                        propagatedFrom: e.target
                    }, e), true);
                }
            }
        };

        exports.version = version;
        exports.author = author;
        exports.Util = Util;
        exports.Events = Events;

        let oldNS = window[NS];
        exports.noConflict = function () {
            window[NS] = oldNS;
            return this;
        };

        window[NS] = exports;

    })
)