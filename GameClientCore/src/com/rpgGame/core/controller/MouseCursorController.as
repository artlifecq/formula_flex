package com.rpgGame.core.controller
{
	import com.rpgGame.coreData.enum.MouseCursorEnum;
	
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.ui.Mouse;
	import flash.ui.MouseCursorData;
	
	import feathers.themes.GuiTheme;
	
	/**
	 * 鼠标样式控制器
	 * @author Administrator
	 * 创建时间：2015-10-22 下午9:43:27
	 */
	public class MouseCursorController
	{
		private static var _currentMouse : String;
		private static var _folder : String;
		private static var _isSetup : Boolean;
		
		public static function setup() : void
		{
			_isSetup = true;
			_folder = "ui/alphapng/mouse/";
			
			registerCursor(MouseCursorEnum.NORMAL, "normal_up", new Point(0, 0));
			registerCursor(MouseCursorEnum.TALK, "talk_up", new Point(0, 0), 3, 3);
			registerCursor(MouseCursorEnum.ATTACK, "attack_up", new Point(0, 0));
			registerCursor(MouseCursorEnum.COLLECT, "collect_up", new Point(0, 0), 2, 4);
			registerCursor(MouseCursorEnum.MOVE, "move_up", new Point(0, 0));
			registerCursor(MouseCursorEnum.FINGER, "finger_up", new Point(0, 0));
			registerCursor(MouseCursorEnum.REPAIR, "repair_up", new Point(0, 0));
			registerCursor(MouseCursorEnum.SELL, "sell_up", new Point(0, 0));
			registerCursor(MouseCursorEnum.SAVE, "save_up", new Point(0, 0));
			registerCursor(MouseCursorEnum.TAKE, "take_up", new Point(0, 0));
			showNormal();
		}
		
		public static function showNormal() : void
		{
			update( MouseCursorEnum.NORMAL );
		}
		
		public static function showAttack() : void
		{
			update( MouseCursorEnum.ATTACK );
		}
		
		public static function showTalk() : void
		{
			update(  MouseCursorEnum.TALK );
		}
		
		public static function showCollect() : void
		{
			update( MouseCursorEnum.COLLECT );
		}
		
		public static function showMove() : void
		{
			update( MouseCursorEnum.MOVE );
		}
		
		public static function showFinger() : void
		{
			update( MouseCursorEnum.FINGER );
		}
		
		private static var _repairing:Boolean;
		public static function showRepair() : void
		{
			_repairing = true;
			update( MouseCursorEnum.REPAIR );
		}
		
		public static function exitRepairMode():void
		{
			_repairing = false;
			showNormal();
		}
		
		private static var _selling:Boolean;
		public static function showSell() : void
		{
			_selling = true;
			update( MouseCursorEnum.SELL );
		}
		
		public static function exitSellMode():void
		{
			_selling = false;
			showNormal();
		}
		
		private static var _saveing:Boolean;
		public static function showSave() : void
		{
			_saveing=true;
			update( MouseCursorEnum.SAVE );
		}
		
		public static function exitSaveMode():void
		{
			_saveing = false;
			showNormal();
		}
		
		public static function showTake() : void
		{
			_saveing=true;
			update( MouseCursorEnum.TAKE );
		}
		
		public static function exitTakeMode():void
		{
			_saveing = false;
			showNormal();
		}
		
		/**
		 *
		 * @param cursor 鼠标样式名称，由MouseCursorEnum枚举
		 * @param iconMainName 图标名称前缀
		 * @param state 鼠标状态"up","down"
		 * @param hotSpot 以像素表示的光标热点。 热点是指在光标上注册鼠标单击所在的点。默认情况下，热点位于左上角 (0,0)
		 * @param frameTotal 图标的序列图总数
		 * @param frameRate 使光标具有动画效果的帧速率。 在 data 属性中提供多个图像并将帧速率设置为大于 0 的值，以便为指针添加动画效果。光标帧速率可能不同于当前的 SWF 帧速率。
		 *
		 */
		private static function registerCursor(cursor : String, iconMainName : String, hotSpot : Point = null, frameTotal : int = 1, frameRate : int = 1) : void
		{
			var cursorData : MouseCursorData = new MouseCursorData();
			var bmdVec : Vector.<BitmapData> = new Vector.<BitmapData>();
			for (var i : int = 1; i <= frameTotal; i++)
			{
				var iconName : String = _folder + iconMainName + "_" + i + ".png";
				var bmd : BitmapData = GuiTheme.ins.getTextureBitmapData(iconName);
				bmdVec.push(bmd);
			}
			cursorData.data = bmdVec;
			if (hotSpot)
			{
				cursorData.hotSpot = hotSpot;
			}
			if (frameTotal > 1)
			{
				cursorData.frameRate = frameRate;
			}
			Mouse.registerCursor(cursor, cursorData);
		}
		
		private static function update(mouse:String) : void
		{
			if(!_isSetup || _currentMouse == mouse)
			{
				return;
			}
			
			if(_selling && mouse != MouseCursorEnum.SELL)
			{
				return;
			}
			if(_repairing && mouse != MouseCursorEnum.REPAIR)
			{
				return;
			}
			
			if(_saveing && mouse != MouseCursorEnum.SAVE&&mouse != MouseCursorEnum.TAKE)
			{
				return;
			}
			
			Mouse.cursor = mouse
			_currentMouse = mouse;
		}
	}
}
