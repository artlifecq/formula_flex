package com.rpgGame.appModule.dungeon.lunjian
{
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.sender.DungeonSender;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.coreData.cfg.LunJianCfg;
	import com.rpgGame.coreData.clientConfig.Q_lunjian;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	
	import gs.TweenLite;
	
	import org.mokylin.skin.app.fuben.FuBenJieSuan2_Shengli;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	
	import utils.TimerServer;
	
	/**
	 *论剑成功
	 *@author dik
	 *2017-5-11下午4:53:08
	 */
	public class LunJianSuccessPanel extends SkinUIPanel
	{
		private var _skin:FuBenJieSuan2_Shengli;
		private var _icon:IconCDFace;
		private var leftTime:int;
		
		public function LunJianSuccessPanel()
		{
			_skin=new FuBenJieSuan2_Shengli();
			super(_skin);
			_icon=new IconCDFace(IcoSizeEnum.ICON_64);
			_skin.container.addChild(_icon);
		}
		
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,parentContiner);
			var ljid:int=data;
			var cfg:Q_lunjian=LunJianCfg.getCfgByID(ljid);
			var rewads:Array=JSONUtil.decode(cfg.q_rewards);
			var itemInfo:ClientItemInfo=new ClientItemInfo(rewads[0].mod);
			FaceUtil.SetItemGrid(_icon,itemInfo);
			
			_skin.container.scale=0.1;
			_skin.container.alpha=0;
			
			TweenLite.to(_skin.container,1,{scale:1,alpha:1,onComplete:tweenComplete});
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			if(target==_skin.btnEixt){
				DungeonSender.reqQuitDungeon();
				this.onHide();
			}
		}
		
		private function tweenComplete():void
		{
			leftTime=10;
			TimerServer.addLoop(updateTime,1000);
			_skin.lbTime.text=leftTime+"秒后自动退出";
		}
		
		private function updateTime():void
		{
			leftTime--;
			_skin.lbTime.text=leftTime+"秒后自动退出";
			if(leftTime<0){
				TimerServer.remove(updateTime);
			}
		}
		
		override protected function onHide():void
		{
			super.onHide();
			TimerServer.remove(updateTime);
		}
	}
}