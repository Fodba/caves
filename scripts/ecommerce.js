/*************************************************************
- SUBSCRIBE TO GENERAL EVENTS
*************************************************************/
TC.bind('beforeCartUpdated', function (formData, jQForm) {

  //Set elements in updating mode
  setUpdatingElements(jQForm);

});

TC.bind('afterCartUpdated', function (data, jQForm) {
  //Set elements in updating mode
  resetUpdatingElements(jQForm, function () {
  if(data.order != null){
      updateMiniCart(data.order);
      updateCart(data.order, true);
  }
  });

});

TC.bind('cartUpdateError', function (data, jQForm) {

});

TC.bind('beforeSetCurrentCurrency', function (data, jQForm) {
alert('Done 1');
});
TC.bind('afterSetCurrentCurrency', function (data, jQForm) {
alert('Done 2');
});
 
/*************************************************************
- SUBSCRIBE TO ORDER LINE EVENTS
*************************************************************/
TC.bind('beforeAddOrUpdateOrderLine', function (formData, jQForm) {

});

TC.bind('afterAddOrUpdateOrderLine', function (orderLine, data, jQForm) {
  var updatingElement = jQForm.closest('.updating');

  if (updatingElement.hasClass('item')) {
    if (orderLine.quantity <= 0) {
      var deleteElement = jQuery('#orderLine' + orderLine.id);
      deleteElement.remove();
    } else {
      updateCartOrderLine(orderLine);
    }
    updateCart(data.order);
  }

});

TC.bind('afterRemoveOrderLine', function (orderLine, data, jQForm) {
  var updatingElement = jQForm.closest('.updating');

  if (updatingElement.hasClass('item')) {
    //We are updating an order line in the cart

    var deleteElement = jQuery('#orderLine' + orderLine.id + ', #orderLine' + orderLine.copiedFromOrderLineId);
    deleteElement.remove();

    updateCart(data.order);
  }

});

/*************************************************************
- RENDER TEMPLATE EVENTS
*************************************************************/
jQuery(function () {
  jQuery('body').on('change', '.product select.productIdentifier', function () {
    var variantSelect = jQuery(this),
        productIdentifier = variantSelect.val(),
        product = variantSelect.closest('.innerProduct'),
        refreshwithtemplate = product.attr('refreshwithtemplate');
    TC.renderTemplateFile({
      templateFile: refreshwithtemplate,
      pageId: productIdentifier,
      successfn: function (html) {
        product.after(html).remove();
      }
    });
  });
});

/*************************************************************
- UPDATE MINICART
*************************************************************/
function updateMiniCart(order) {
  var miniCart = jQuery('#miniCart');

  if (miniCart[0]) {
    var totalQuantity = getOrderTotalQuantity(order);
    miniCart.find('#miniCartTotalPrice').text(order.subtotalPrice.withVatFormatted);
    miniCart.find('#miniCartTotalQuantity').text(totalQuantity);
    miniCart.attr('class', 'items' + totalQuantity);
  }
}

/*************************************************************
- UPDATE CART
*************************************************************/
function updateCart(order, updateOrderLines) {
  var cart = jQuery('#cart');

  if (cart[0]) {
    var cartContent = cart.find('.cartContent'),
        showQuantityForms = cartContent.hasClass('showQuantityForms'),
    cartItemInfo = cart.find('#cartItemInfo'),
        showDeleteForm = cartContent.hasClass('showDeleteForm'),
        showShippingAndPayment = cartContent.hasClass('showShippingAndPayment'),
        showTransactionFee = cartContent.hasClass('showTransactionFee');

    if (updateOrderLines) {
      updateCartOrderLines(order);
    }
    
  if(getOrderTotalQuantity(order) > 1){
    cartItemInfo.addClass('multipleItems');
    cartItemInfo.removeClass('singleItem');
  }else{
    cartItemInfo.addClass('singleItem');
    cartItemInfo.removeClass('multipleItems');
  }

    cart.find('#cartTotalQuantity').text(getOrderTotalQuantity(order));

    cart.find('#subtotalPrice').text(order.subtotalPrice.withVatFormatted);
    cart.find('#shipmentInformationTotalPrice').text(order.shipmentInformation.totalPrice.withVatFormatted);
    cart.find('#paymentInformationTotalPrice').text(order.paymentInformation.totalPrice.withVatFormatted);
    cart.find('#transactionInformationTransactionFee').text(order.transactionInformation.transactionFee.withVatFormatted);

    if (showShippingAndPayment) {
      cart.find('#totalVat').text(order.totalPrice.vatFormatted);
      cart.find('#totalPrice').text(order.totalPrice.withVatFormatted);
    } else {
      cart.find('#totalVat').text(order.subtotalPrice.vatFormatted);
      cart.find('#totalPrice').text(order.subtotalPrice.withVatFormatted);
    }
  }

}

function updateCartOrderLines(order) {
  for (var i = 0; i < order.orderLines.length; i++) {
    updateCartOrderLine(order.orderLines[i]);
  }
}

function updateCartOrderLine(orderLine) {
  var updatingElement = jQuery('#orderLine' + orderLine.id + ', #orderLine' + orderLine.copiedFromOrderLineId);
  updatingElement.find('.quantity').val(orderLine.quantity);
  updatingElement.find('.unitPrice').text(orderLine.unitPrice.withVatFormatted);
  updatingElement.find('.totalPrice').text(orderLine.totalPrice.withVatFormatted);
}

/*************************************************************
- UPDATING CLASS ON GENERAL ELEMENTS
*************************************************************/
var _cartUpdatingStartTime = null,
    _localUpdatingElements = {},
    _globalTimeOutId = null,
//The minimum updating time
    _cartUpdatingTime = 1000,
//The global elements that should get the updating class
    _updatingGlobalElementsSelector = '#miniCart, #cart',
//The local elements that should get the updating class
    _updatingLocalElementsSelector = '.item, .innerProduct';

//Sets the "updating" class on selected elements
function setUpdatingElements(jQForm) {

  if (jQForm) {
    var localElements = jQForm.parents(_updatingLocalElementsSelector),
      globalElements = jQuery(_updatingGlobalElementsSelector);
    _cartUpdatingStartTime = new Date().getTime();

    localElements.each(function () {
      _localUpdatingElements[this.id] = _cartUpdatingStartTime;
    });

    globalElements.add(localElements).addClass('updating');
  }
}

//Removes the "updating" class on selected elements
function resetUpdatingElements(jQForm, endFn) {
  if (jQForm) {
    var cartUpdatingEndTime = new Date().getTime(),
      localElements = jQForm.parents(_updatingLocalElementsSelector);

    //Reset local elements
    localElements.each(function () {
      var localElement = jQuery(this),
        localStartTime = _localUpdatingElements[this.id],
        localElements = jQuery(_updatingGlobalElementsSelector),
        localTimeElapsed = cartUpdatingEndTime - _cartUpdatingStartTime,
        localTimeLeft = _cartUpdatingTime - localTimeElapsed,
        localTimeOut = localTimeLeft < 0 ? 0 : localTimeLeft;

      window.setTimeout(function () {
        resetUpdatingElement(localElement);
      }, localTimeOut);

    });

  }

  //Reset global elements
  var globalElements = jQuery(_updatingGlobalElementsSelector),
    globalTimeElapsed = cartUpdatingEndTime - _cartUpdatingStartTime,
    globalTimeLeft = _cartUpdatingTime - globalTimeElapsed,
    globalTimeOut = globalTimeLeft < 0 ? 0 : globalTimeLeft

  window.clearTimeout(_globalTimeOutId);
  _globalTimeOutId = window.setTimeout(function () {
    resetUpdatingElement(jQuery(_updatingGlobalElementsSelector));
    if (endFn) {
      endFn();
    }
  }, globalTimeOut);
}

function resetUpdatingElement(jQElement) {
  jQElement.removeClass('updating');
}

/*************************************************************
- CART
*************************************************************/
jQuery(function () {
  initShippingCheck();
  initAccept();
  initProduct();
  initCountryRegionSelect();
});

function initShippingCheck() {
  var shipping_check = jQuery('#shipping_check'),
      shippingInformation = jQuery('#shippingInformation');
  if (shipping_check[0]) {
    if (shipping_check.filter(':checked')[0] && !shippingInformation.hasClass('show')) {
      shippingInformation.removeClass('hide');
    } else if (!shipping_check.filter(':checked')[0] && shippingInformation.hasClass('show')) {
      shippingInformation.addClass('hide');
    }

    shipping_check.click(function () {
      shippingInformation.toggleClass('hide');
    });
  }
}

function initAccept() {
  var acceptTermsCheck = jQuery('#acceptTermsCheck'),
      next = jQuery('#next input');
  if (acceptTermsCheck[0]) {
    next.click(function () {
      if (!acceptTermsCheck.is(':checked')) {
        alert(acceptTermsCheck.attr('alt'));
        return false;
      }
      return true;
    });
  }
}

function initProduct() {
  var product = jQuery('#product');

  if (product[0]) {

    var thumbNails = product.find('li.thumbnail'),
        productImage = product.find('img.productImage');
    if (thumbNails.length > 1) {

      thumbNails.on('click', 'a', function () {
        var link = jQuery(this),
            thumbnail = link.parent(),
            newImageUrl = link.attr('href');
        thumbNails.removeClass('on');
        thumbnail.addClass('on');
        productImage.attr('src', newImageUrl);
        return false;
      });
    }
  }
}

function initCountryRegionSelect() {
  var countryRegionSelects = jQuery('.countryRegionSelect');

  countryRegionSelects.each(function () {
    var countryRegionSelect = jQuery(this)
    countrySelect = jQuery('#' + countryRegionSelect.attr('data-countryselectid'));

    changeRegions(countrySelect);

    countrySelect.change(function () {
      changeRegions(jQuery(this));
    });
  });
}

function changeRegions(countrySelect) {
  var countryRegionSelect = jQuery('select[data-countryselectid=' + countrySelect.attr('id') + ']'),
      countryId = countrySelect.val(),
      countryRegions = TC.getCountryRegions({ countryId: countryId });

  countryRegionSelect.find('option[value!=0]').remove();
  for (var i = 0; i < countryRegions.length; i++) {
    var countryRegion = countryRegions[i];
    countryRegionSelect.append('<option value="' + countryRegion.id + '">' + countryRegion.name + '</option>');
  }
}


/*************************************************************
- UTILS
*************************************************************/
//Returns true if the array contains the object
Array.prototype.contains = function (obj) {
  var i = this.length;
  while (i--) {
    if (this[i] === obj) {
      return i;
    }
  }
  return -1;
};

/*************************************************************
- ORDER METHODS
*************************************************************/
function getOrderTotalQuantity(order) {
  var totalQuantity = 0;
  for (var i = 0; i < order.orderLines.length; i++) {
    totalQuantity += order.orderLines[i].quantity;
  }
  return totalQuantity;
}

/*************************************************************
- UI EVENTS
*************************************************************/
jQuery(function () {
  jQuery('.cartContent').on('hover', '.item', function (e1, e2) {
    jQuery(this).toggleClass('over');
  });
});
