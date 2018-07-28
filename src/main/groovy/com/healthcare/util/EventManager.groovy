package com.healthcare.util

import java.util.concurrent.ConcurrentHashMap

class EventManager {
    private static Map<String, List> _pool = new ConcurrentHashMap()

    static void on(String name, Closure callback) {
        name = name.trim()
        if(!name) {
            return;
        }
        if(_pool[name]) {
            _pool[name].add(callback)
        } else {
            _pool[name] = [callback]
        }
    }

    static def trigger(String event, def ...params) {
        List callBacks = _pool[event]
        callBacks.each {
            it.call(params as List)
        }
    }


}
