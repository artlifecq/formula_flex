package  com.rpgGame.app.ui.alert
{
	import com.game.engine3D.manager.Stage3DLayerManager;
	
	import flash.utils.Dictionary;
	
	import feathers.controls.Button;
	import feathers.controls.Check;
	import feathers.controls.Label;
	
	import org.mokylin.skin.common.alert.tishi1;
	
	import starling.display.DisplayObject;
	import starling.display.Sprite;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;

	/**
	 * 游戏弹窗提示
	 * @author wewell
	 * @modifier L.L.M.Sunny
	 * 修改时间：2015-10-10 下午3:05:12
	 */
	public class GameCheckAlertExt extends Sprite
	{
		public static const T_JJB_BUY_TIMES:int=1;
		public static const T_JJB_BUY_POWER:int=2;
		private static var _ins : GameCheckAlertExt;

		public var skin : tishi1;
		private var okFCallBack : Function;
		private var cancelCallBack : Function;
		private var closeCallBack : Function;
		private var okParam:Array;
		private var dic:Dictionary=new Dictionary();
		private var _type:int;
		public function GameCheckAlertExt()
		{
			skin = new tishi1();
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
				case skin.btn_ok:
					if (okFCallBack != null)
						okFCallBack.apply(null,okParam);
					hide();
					break;
				case skin.btnClose:
					if (closeCallBack != null)
						closeCallBack();
					hide();
					break;
				case skin.btn_cancel:
					if (cancelCallBack != null)
						cancelCallBack();
					hide();
					break;
			}
		}

		public static function show(type:int,msg : String,  onOk : Function = null,okParam:Array=null,onCancel : Function = null,title : String = "提示") : GameCheckAlertExt
		{
			if (!_ins)
				_ins = new GameCheckAlertExt();
			if (_ins.dic[type]!=undefined) 
			{
				if (onOk != null)
					onOk.apply(null,okParam);
				return _ins;
			}
			_ins.skin.chk_ok.isSelected=false;
			_ins._type=type;
			_ins.skin.labStr.htmlText = msg;
			_ins.okFCallBack = onOk;
			_ins.cancelCallBack = onCancel;
//			_ins.skin.lbl_title.htmlText = title;
			_ins.okParam=okParam;
			Stage3DLayerManager.starlingLayer.getLayer("alert").addChild(_ins);
			_ins.x = int((_ins.stage.stageWidth - _ins.width) / 2);
			_ins.y = int((_ins.stage.stageHeight - _ins.height) / 2);
			return _ins;
		}
		private function get btnOk():Button
		{
			return skin.hasOwnProperty("btnOk")?skin["btnOk"]:null;
		}
		
		private function get btnClose():Button
		{
			return skin.hasOwnProperty("btnClose")?skin["btnClose"]:null;
		}
		
		private function get btnCancel():Button
		{
			return skin.hasOwnProperty("btnCancel")?skin["btnCancel"]:null;
		}
		
		public function get isCheckSelected():Boolean
		{
			return skin["cboxTip"] && skin["cboxTip"].isSelected;
		}
		
		private function get cboxTip():Check
		{
			return skin.hasOwnProperty("cboxTip")?skin["cboxTip"]:null;
		}
		
		private function get lbTip():Label
		{
			return skin.hasOwnProperty("lbTip")?skin["lbTip"]:null;
		}
		
		private function get title():Label
		{
			return skin.hasOwnProperty("title")?skin["title"]:null;
		}
		public static function hide() : void
		{
			if (_ins)
				_ins.removeFromParent();
			if (_ins.skin.chk_ok.isSelected) 
			{
				_ins.dic[_ins._type]=1;
			}
		}
	}
}
