package com.rpgGame.appModule.bag
{
	import com.rpgGame.app.reward.RewardGroup;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.core.manager.StarlingLayerManager;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.utils.GameColorUtil;
	import com.rpgGame.core.utils.UIUtil;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	
	import flash.utils.getTimer;
	
	import org.mokylin.skin.common.alert.Alert_LiBao;
	
	import starling.display.DisplayObject;
	
	import utils.TimerServer;
	
	public class ItemOpenResultShowPanelExt extends SkinUIPanel
	{
		private static var pool:Array=[];
		private var _skin:Alert_LiBao;
		private var _gReward:RewardGroup;
		private var _endTime:int;
		public function ItemOpenResultShowPanelExt()
		{
			_skin=new Alert_LiBao();
			super(_skin);
			_skin.listCont.visible=false;
			_gReward=new RewardGroup(IcoSizeEnum.ICON_48,_skin.icon1,0,4,10,4);
		}
		private function onTime():void
		{
			var left:int=Math.ceil(_endTime-getTimer()/1000);
			if (left>0) 
			{
				_skin.lbTime.htmlText=HtmlTextUtil.getTextColor(GameColorUtil.COLOR_GREEN,left+"")+"秒后自动关闭";
			}
			else
			{
				
				TimerServer.remove(onTime);
				hide();
			}
		}
		/**
		 * obj类型数据包含以下属性 sys:系统id自定义，desc:描述，btnText:按钮描述，callBack:点击按钮回调
		 * @param data 
		 * 
		 */		
		private function setData(data:Object):void
		{
			_skin.gBtn.y=_gReward.y+_gReward.height+15;
			_skin.bg.height=_skin.gBtn.y+_skin.gBtn.height+15;
			_endTime=getTimer()+30000;
			TimerServer.addSecTick(onTime);
			onTime();
		}
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch(target)
			{
				case _skin.btn_ok:
				{
					removeFromParent();
					break;
				}
			}
		}
		override protected function onHide():void
		{
			_gReward.clear();
			TimerServer.remove(onTime);
			super.onHide();
			pool.push(this);
			
		}
	
		

		public  static function onShowNotice(data:*):void
		{
			// TODO Auto Generated method stub
		
			var panel:ItemOpenResultShowPanelExt=null;
			if (pool.length>0) 
			{
				panel=pool.pop();
			}
			else
			{
				panel=new ItemOpenResultShowPanelExt();
			}
			StarlingLayerManager.appUILayer.addChild(panel);
			UIUtil.alignToStageRightBottom(panel);
			panel.setData(data);
		}
		override protected function onStageResize(sw:int, sh:int):void
		{
			UIUtil.alignToStageRightBottom(this);
		}
	}
}