package  com.rpgGame.app.ui.alert
{
	import com.game.engine3D.manager.Stage3DLayerManager;
	
	import feathers.controls.Button;
	import feathers.controls.Check;
	import feathers.controls.Label;
	
	import org.mokylin.skin.common.alert.AlertSkin;
	import org.mokylin.skin.common.alert.Tankuang_VIP;
	
	import starling.display.DisplayObject;
	import starling.display.Sprite;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;

	/**
	 * 游戏弹窗提示,确定是黄色按钮
	 * @author yfl
	 * @modifier L.L.M.Sunny
	 * 修改时间：2015-10-10 下午3:05:12
	 */
	public class GameAlertYellowBtnExt extends Sprite
	{
		private static var _ins : GameAlertYellowBtnExt;

		public var skin : Tankuang_VIP;
		private var okFCallBack : Function;
		private var cancelCallBack : Function;
		private var closeCallBack : Function;
		private var okParam:Array;
		public function GameAlertYellowBtnExt()
		{
			skin = new Tankuang_VIP();
			skin.toSprite(this);
			
			
			this.addEventListener(starling.events.TouchEvent.TOUCH, onTouch);
		}
		
		/**
		 *当面板被点击时
		 */		
		protected function onTouch(e:TouchEvent):void
		{
			var t:Touch = e.getTouch(this, TouchPhase.ENDED);
			if(t != null && t.target != null)
			{
				onTouchTarget(t.target);
			}
		}

		protected function onTouchTarget(target : DisplayObject) : void
		{
			switch (target)
			{
				case skin.btnOK:
					if (okFCallBack != null)
						okFCallBack.apply(null,okParam);
					hide();
					break;
				case skin.btnClose:
					if (closeCallBack != null)
						closeCallBack();
					hide();
					break;
				case skin.btnCancle:
					if (cancelCallBack != null)
						cancelCallBack();
					hide();
					break;
			}
		}

		public static function show(msg : String,  onOk : Function = null,okParam:Array=null,onCancel : Function = null,title : String = "提示",okBtnText:String="确定") : GameAlertYellowBtnExt
		{
			if (!_ins)
				_ins = new GameAlertYellowBtnExt;
			_ins.skin.labContent.text = msg;
			_ins.okFCallBack = onOk;
			_ins.cancelCallBack = onCancel;
			_ins.skin.lbl_title.htmlText = title;
			_ins.okParam=okParam;
			_ins.skin.btnOK.label=okBtnText;
			Stage3DLayerManager.starlingLayer.getLayer("alert").addChild(_ins);
			_ins.x = int((_ins.stage.stageWidth - _ins.width) / 2);
			_ins.y = int((_ins.stage.stageHeight - _ins.height) / 2);
			return _ins;
		}
		
		public static function hide() : void
		{
			if (_ins)
				_ins.removeFromParent();
		}
	}
}
