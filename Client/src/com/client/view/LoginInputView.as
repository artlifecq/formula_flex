package com.client.view
{
	import com.client.ui.alert.GameAlert;
	import com.game.engine3D.utils.DisplayUtil;

	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.net.SharedObject;
	import flash.ui.Keyboard;

	import feathers.events.FeathersEventType;

	import org.mokylin.skin.signIn.SignInSkin;

	import starling.core.Starling;
	import starling.display.DisplayObjectContainer;
	import starling.display.Sprite;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;

	/**
	 *
	 * 登录输入视图
	 * @author L.L.M.Sunny
	 * 创建时间：2015-4-3 下午6:05:12
	 *
	 */
	public class LoginInputView extends Sprite
	{
		private var _stage : Stage;
		private var _signInSkin : SignInSkin;
		private var _clickFun : Function;
		private var _backFun : Function;

		private var _so : SharedObject;

		public function LoginInputView(parent : DisplayObjectContainer, clickFun : Function = null, backFun : Function = null)
		{
			_clickFun = clickFun;
			_backFun = backFun;
			_stage = Starling.current.nativeStage;
			parent.addChild(this);

			_signInSkin = new SignInSkin();
			_signInSkin.toSprite(this);
			setInfo("");

			initItem();

			onStageResize();
			_stage.addEventListener(Event.RESIZE, onStageResize);
			_stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			this.addEventListener(starling.events.TouchEvent.TOUCH, onTouch);

			_signInSkin.userNameText.addEventListener(FeathersEventType.FOCUS_IN, onTextFocusIn);
			_signInSkin.userNameText.addEventListener(FeathersEventType.FOCUS_OUT, onTextFocusOut);

			_signInSkin.passWordText.addEventListener(FeathersEventType.FOCUS_IN, onTextFocusIn);
			_signInSkin.passWordText.addEventListener(FeathersEventType.FOCUS_OUT, onTextFocusOut);
		}

		private function onTextFocusIn(e : starling.events.Event) : void
		{
			if (e.target == _signInSkin.userNameText)
				_signInSkin.userNameTips.visible = false;
			else if (e.target == _signInSkin.passWordText)
				_signInSkin.passWordTips.visible = false;
		}

		private function onTextFocusOut(e : starling.events.Event) : void
		{
			if (e.target == _signInSkin.userNameText)
			{
				if (_signInSkin.userNameText.text.length <= 0)
					_signInSkin.userNameTips.visible = true;
			}
			else if (e.target == _signInSkin.passWordText)
			{
				if (_signInSkin.passWordText.text.length <= 0)
					_signInSkin.passWordTips.visible = true;
			}
		}

		private function onStageResize(event : Event = null) : void
		{
			x = int((_stage.stageWidth - _signInSkin.bgImage.width) * 0.5);
			y = int((_stage.stageHeight - _signInSkin.bgImage.height) * 0.5);
			_signInSkin.bottomInfo.y = (_stage.stageHeight < _signInSkin.bgImage.height ? 885 - (_signInSkin.bgImage.height - _stage.stageHeight) * 0.5 : 885);
		}

		private function initItem() : void
		{
			_so = SharedObject.getLocal("UserLoginName");
			_signInSkin.userNameText.text = _so.data["UserLoginName"] || "";
			_signInSkin.passWordText.text = "";

			_signInSkin.userNameTips.visible = _signInSkin.userNameText.text.length <= 0;
			_signInSkin.passWordTips.visible = _signInSkin.passWordText.text.length <= 0;
		}

		private function onKeyDown(e : KeyboardEvent) : void
		{
			if (e.keyCode == Keyboard.ENTER)
			{
				onClickTxt();
			}
		}

		private function onTouch(e : TouchEvent) : void
		{
			var t : Touch = e.getTouch(this, TouchPhase.ENDED);
			if (t != null && t.target != null)
			{
				if (t.target == _signInSkin.loginBtn)
				{
					onClickTxt();
				}
			}
		}

		private function onClickTxt(e : MouseEvent = null) : void
		{
			try
			{
				_so.data["UserLoginName"] = _signInSkin.userNameText.text;
				_so.flush();
			}
			catch (e : Error)
			{
			}

			if (_signInSkin.userNameText.text)
			{
				setInfo("正在请求登录，请稍等...");
				if (_clickFun != null)
				{
					_clickFun(_signInSkin.userNameText.text, _signInSkin.passWordText.text);
				}
			}
			else
				GameAlert.show("请输入账户名称", "提示");
		}

		public function setInfo(msg : String) : void
		{
			_signInSkin.infoTxt.text = msg;
			if (msg)
				_signInSkin.infoTxt.visible = true;
			else
				_signInSkin.infoTxt.visible = false;
		}

		private function onClickBack(e : MouseEvent = null) : void
		{
			try
			{
				_so.data["UserLoginName"] = _signInSkin.userNameText.text;
				_so.flush();
			}
			catch (e : Error)
			{
			}

			if (_backFun != null)
			{
				_backFun();
			}
		}

		public function destroy() : void
		{
			_signInSkin.userNameText.removeEventListener(FeathersEventType.FOCUS_IN, onTextFocusIn);
			_signInSkin.userNameText.removeEventListener(FeathersEventType.FOCUS_OUT, onTextFocusOut);

			_signInSkin.passWordText.removeEventListener(FeathersEventType.FOCUS_IN, onTextFocusIn);
			_signInSkin.passWordText.removeEventListener(FeathersEventType.FOCUS_OUT, onTextFocusOut);

			this.removeEventListener(starling.events.TouchEvent.TOUCH, onTouch);
			if (_stage)
			{
				_stage.removeEventListener(Event.RESIZE, onStageResize);
				_stage.removeEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
				_stage = null;
			}
			_signInSkin = null;
			_clickFun = null;
			_backFun = null;
			if (parent)
				parent.removeChild(this);
			DisplayUtil.disposeDisplayContainer(this);
		}
	}
}
