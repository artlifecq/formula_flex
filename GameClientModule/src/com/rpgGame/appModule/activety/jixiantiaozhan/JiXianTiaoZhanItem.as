package com.rpgGame.appModule.activety.jixiantiaozhan
{
	import com.rpgGame.app.ui.tab.ViewUI;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.netData.monster.bean.BossDamageInfo;
	
	import org.mokylin.skin.app.activety.jixiantiaozhan.JiXianTiaoZhan_Item;
	
	import starling.display.DisplayObject;
	
	public class JiXianTiaoZhanItem extends ViewUI
	{
		private var _skin:JiXianTiaoZhan_Item;
		private var _initX:int=0;
		private var _initY:int=0;
		
		public function JiXianTiaoZhanItem()
		{
			_skin = new JiXianTiaoZhan_Item();
			super(_skin);
		}
		
		public function get initX():int
		{
			return _initX;
		}
		
		public function get initY():int
		{
			return _initY;
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			//			switch(target){
			//				case _skin.btn_enter:
			//					enterBtnHandler();
			//					break;
			//			}			
		}
		
		override public function show(data:Object=null):void
		{
			super.show();
		}	
		
		public function setPoint(x:int,y:int):void
		{
			_initX = x;
			_initY = y;
			this.x = _initX;
			this.y = _initY;
		}
		
		/**测试用*/
		public function ceshi():void
		{
			_skin.numZhanli.label="1";
			_skin.numZhanli.visible=true;
			_skin.lbNo.visible=false;
			_skin.lbName.text="虚位以待";
			_skin.lbNum.text="0";
		}
		
		public function setData(rank:int,info:BossDamageInfo):void
		{
			if(info!=null)
			{
				var num:int=rank+1;
				if(num<=3){
					_skin.numZhanli.label=num.toString();
					_skin.numZhanli.visible=true;
					_skin.lbNo.visible=false;
				}
				else{
					_skin.lbNo.text=num.toString();
					_skin.numZhanli.visible=false;
					_skin.lbNo.visible=true;
				}
				_skin.lbName.text=info.playerName;
				_skin.lbNum.text=info.damage.toString();
				if(num==1) {
					_skin.lbName.color = _skin.lbNum.color = StaticValue.RED_TEXT;
				}
				else if(num==2) {
					_skin.lbName.color = _skin.lbNum.color = StaticValue.BLUE_TEXT;
				}
				else if(num == 3) {
					_skin.lbName.color = _skin.lbNum.color = StaticValue.YELLOW_TEXT;
				}
				else {
					_skin.lbName.color = _skin.lbNum.color = StaticValue.YELLOW_TEXT1;
				}
			}
			else ceshi();
		}
	}
}