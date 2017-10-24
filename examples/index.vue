<template>
	<div class="conatiner">
		<text style="margin-bottom: 20px;">weex pluginasd examples</text>
		<div @click="createAction" style="margin: 20px;padding:20px;background-color:#1ba1e2;color:#fff;"><text style="color:#fff">hello world</text></div>
	</div>
</template>

<style>
	.container{
		flex: 1;
	}
</style>

<script>

	const plugin = weex.requireModule('WeexWXPay');
    plugin.registerAPP("","");
	module.exports = {
		data: {
			value: '',
			index: 0,
			txtChange: ''
		},
		methods: {
			createAction: function() {


				plugin.WXPay({"partnerid":"","prepayid":"","noncestr":"","timestamp":"","package":"","sign":""},function (result) {
                    var modal = weex.requireModule('modal')
                    modal.toast({
                        message: JSON.stringify(result),
                        duration: 0.3
                    })
                });

			}
		}
	}
</script>