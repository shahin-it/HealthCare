<tr class="order-item">
    <td class="id">${item.id}</td>
    <td class="name">${item.name}</td>
    <td class="quantity">${item.quantity}</td>
    <td class="rate"><a href="#" id="basePrice" data-type="text" data-pk="1" data-title="Enter price" class="editable editable-click editable-open" data-original-title="" title="">${item.basePrice}</a></td>
    <td class="discount">${item.discount.toPrice()}</td>
    <td class="price">${item.grandTotal.toPrice()}</td>
    <td class="action-navigator btn-group center">
        <span class="btn btn-xs btn-warning remove" title="Remove"><i class="glyphicon glyphicon-trash"></i></span>
    </td>
</tr>