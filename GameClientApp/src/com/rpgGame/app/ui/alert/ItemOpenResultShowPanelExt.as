package  com.rpgGame.app.ui.alert
{
	import com.game.mainCore.core.manager.LayerManager;
	import com.rpgGame.app.reward.RewardGroup;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.core.manager.StarlingLayerManager;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.utils.GameColorUtil;
	import com.rpgGame.core.utils.UIUtil;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	import com.rpgGame.netData.backpack.bean.TempItemInfo;
	import com.rpgGame.netData.backpack.message.ResGiftItemInfoMessage;
	
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
			this.dragAble=true;
			_skin=new Alert_LiBao();
			super(_skin);
			_gReward=new RewardGroup(IcoSizeEnum.ICON_48,_skin.icon1,0,4,10,4);
		}
		private function onTime():void
		{
			var left:int=Math.ceil((_endTime-getTimer())/1000);
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
			var msg:ResGiftItemInfoMessage=data as ResGiftItemInfoMessage;
			_skin.labName.htmlText=ItemConfig.getItemNameWithQualityColor(msg.giftId);
			var tmps:Vector.<TempItemInfo>=new Vector.<TempItemInfo>();
			var len:int=msg.itemList.length;
			var obj:Object={};
			for each (var item:TempItemInfo in msg.itemList) 
			{
				if (obj[item.mod]!=1) 
				{
					tmps.push(item);
					obj[item.mod]=1; 
				}
			}
			_gReward.setRewardByTeamItemInfo(tmps);
			_skin.gBtn.y=_gReward.y+_gReward.height+15;
			_skin.bg.height=_skin.gBtn.y+_skin.gBtn.height+15;
			_endTime=getTimer()+10000;
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
					hide();
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
			
			panel.setData(data);
			//UIUtil.alignToStageRightBottom(panel);
			panel.onStageResize(0,0);
		}
		override protected function onStageResize(sw:int, sh:int):void
		{
			this.x = LayerManager.stage.stageWidth - this.width;
			this.y = LayerManager.stage.stageHeight - _skin.bg.height - 100;
		}
	}
}