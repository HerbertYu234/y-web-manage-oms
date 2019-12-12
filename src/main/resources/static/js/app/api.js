if (typeof YWM == "undefined") {
    YWM = {};
}


YWM.Api = {
    article: {
        page: function (parmas = {}) {
            parmas.v = Math.random();

            return new Promise(function (resolve, reject) {
                $.get(wolf_context + "/article/page", parmas, function (res) {
                    // resolve(pageArticle);
                    console.log("pageArticle:", res);
                    if (res.success) {
                        resolve.call(this, res.result);
                    } else {
                        reject.call(this, res.msg || "error");
                    }

                }).fail(function () {
                    console.log("*** error!", arguments);
                    reject.apply(this, arguments);
                })
            });
        },

        batchDelete: function (ids = []) {
            if (!ids) {
                return;
            }
            return new Promise(function (resolve, reject) {
                $.post(wolf_context + "/article/delete", "ids=" + ids, function (res) {
                    if (res.success) {
                        resolve.call(this, res.result);
                    } else {
                        reject.call(this, res.msg || "error");
                    }
                }).fail(function () {
                    console.log("*** error!", arguments);
                    reject.apply(this, arguments);
                })
            });
        },

        batchChangeStatus: function (status, ids = []) {
            if (!ids) {
                return;
            }
            return new Promise(function (resolve, reject) {
                $.post(wolf_context + "/article/change/status/" + status, "ids=" + ids, function (res) {
                    if (res.success) {
                        resolve.call(this, res.result);
                    } else {
                        reject.call(this, res.msg || "error");
                    }
                }).fail(function () {
                    console.log("*** error!", arguments);
                    reject.apply(this, arguments);
                })
            });
        }
    },
    articleTag:{
        page: function (parmas = {}) {
            parmas.v = Math.random();

            return new Promise(function (resolve, reject) {
                $.get(wolf_context + "/article/tag/page", parmas, function (res) {
                    console.log("articleTagPage:", res);
                    if (res.success) {
                        resolve.call(this, res.result);
                    } else {
                        reject.call(this, res.msg || "error");
                    }

                }).fail(function () {
                    console.log("*** error!", arguments);
                    reject.apply(this, arguments);
                })
            });
        },
        store: function (params) {
            return new Promise(function (resolve, reject) {
                $.post(wolf_context + "/article/tag/store", params, function (res) {
                    console.log("articleTagStore:", res);
                    if (res.success) {
                        resolve.call(this, res.result);
                    } else {
                        reject.call(this, res.msg || "error");
                    }

                }).fail(function () {
                    console.log("*** error!", arguments);
                    reject.apply(this, arguments);
                })
            });
        },
        findById: function (id) {
            return new Promise(function (resolve, reject) {
                $.get(wolf_context + "/article/tag/detail/"+id, {}, function (res) {
                    if (res.success) {
                        resolve.call(this, res.result);
                    } else {
                        reject.call(this, res.msg || "error");
                    }

                }).fail(function () {
                    console.log("*** error!", arguments);
                    reject.apply(this, arguments);
                })
            });
        }
    }
}

YWM.Constant = {

    ArticleStatus: {
        DEPLOY: 0,
        UNDEPLOY: 1
    },
}