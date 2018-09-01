package com.healthcare

import com.healthcare.crm.Transaction
import grails.gorm.transactions.Transactional

@Transactional
class TransactionService {

    private Double _getTotalPayment(Map params) {
        Double sum = 0
        List<Transaction> transactions = Transaction.createCriteria().list {
            if(params.type) {
                eq("type", params.type)
            }
            if(params.effectiveId) {
                eq("domainId", params.effectiveId)
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

    Transaction pay(def id, String title, String type, Long domainId, Double amount, Integer quantity = 1, String note = null) {
        quantity = quantity ?: 1
        Transaction transaction = Transaction.get(id) ?: new Transaction()

        transaction.title = title
        transaction.type = type
        transaction.domainId = domainId
        transaction.unitAmount = amount
        transaction.quantity = quantity
        transaction.note = note

        return transaction.save()
    }

    List getHistory(String type, Map params = [:]) {
        return Transaction.createCriteria().list {
            eq("type", type)
            if(params.effectiveId) {
                eq("domainId", params.effectiveId)
            }
        }
    }

}
