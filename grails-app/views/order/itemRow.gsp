<tr class="order-item">
    <td class="id"><span class="value">${item.id}</span><input type="hidden" name="itemId" value="${item.id}"></td>
    <td class="name"><span class="value">${item.name}</span></td>
    <td class="quantity"><span class="value"><input name="item.quantity" type="number" required value="${item.quantity}" min="1"></span></td>
    <td class="rate"><span class="value"><input name="item.basePrice" type="number" required value="${item.basePrice}" min="0"></span></td>
    <td class="discount"><span class="value"><input name="item.discount" type="number" required value="${item.discount}" min="0"></span></td>
    <td class="price"><span class="value">${item.grandTotal.toPrice()}</span></td>
    <td class="action-navigator btn-group center">
        <span class="btn btn-xs btn-warning remove" title="Remove"><i class="glyphicon glyphicon-trash"></i></span>
    </td>
</tr>