

const WeexWXPay = {
  show() {
      alert("module WeexWXPay is created sucessfully ")
  }
};


var meta = {
   WeexWXPay: [{
    name: 'show',
    args: []
  }]
};



if(window.Vue) {
  weex.registerModule('WeexWXPay', WeexWXPay);
}

function init(weex) {
  weex.registerApiModule('WeexWXPay', WeexWXPay, meta);
}
module.exports = {
  init:init
};
