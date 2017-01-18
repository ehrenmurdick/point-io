"use strict";
var utils_1 = require('./utils');
function isolateSource(source, scope) {
    return source.select(utils_1.SCOPE_PREFIX + scope);
}
exports.isolateSource = isolateSource;
function isolateSink(sink, scope) {
    return sink.map(function (vTree) {
        if (vTree.data && vTree.data.isolate) {
            var existingScope = vTree.data.isolate.replace(/(cycle|\-)/g, '');
            var _scope = scope.replace(/(cycle|\-)/g, '');
            if (isNaN(parseInt(existingScope))
                || isNaN(parseInt(_scope))
                || existingScope > _scope) {
                return vTree;
            }
        }
        vTree.data = vTree.data || {};
        vTree.data.isolate = scope;
        if (typeof vTree.key === 'undefined') {
            vTree.key = utils_1.SCOPE_PREFIX + scope;
        }
        return vTree;
    });
}
exports.isolateSink = isolateSink;
//# sourceMappingURL=isolate.js.map