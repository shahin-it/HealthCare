package com.healthcare

import com.healthcare.crm.Transaction
import grails.gorm.transactions.Transactional

@Transactional
class TransectionService {

    private Double _getTotalPayment(Map params) {
        Double sum = 0
        List<Transaction> transactions = Transaction.createCriteria().list {
            if(params.type) {
                eq("type", params.type)
            }
            if(params.effectiveId) {
                eq("effectiveId", params.effectiveId)
            }
            if(params.isRefund) {
                eq("isRefund", params.isRefund)
            }
        }

        sum = transactions.sum { it.total }
        return sum
    }

    Double getTotalPayment(String type, Long id = null) {
        return _getTotalPayment([type: type, effectiveId: id])
    }

    Double getTotalRefund(String type, Long id = null) {
        return _getTotalPayment([type: type, effectiveId: id, isRefund: true])
    }

}
