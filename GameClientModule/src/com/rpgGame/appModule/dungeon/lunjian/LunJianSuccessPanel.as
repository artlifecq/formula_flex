package com.rpgGame.appModule.dungeon.lunjian
{
	import com.game.engine3D.display.InterObject3D;
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.sender.DungeonSender;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.LunJianCfg;
	import com.rpgGame.coreData.clientConfig.Q_lunjian;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.lang.LangUI;
	
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
		private var eftRender:RenderUnit3D;
		
		public function LunJianSuccessPanel()
		{
			_skin=new FuBenJieSuan2_Shengli();
			super(_skin);
			this.playInter3DAt(ClientConfig.getEffect("ui_tiaozhanshengli"),250,130,1,playComplete,addEft);
		}
		
		private function addEft(render:RenderUnit3D):void
		{
			eftRender=render;
			if(!this.parent){
				eftRender.stop(0);
			}else{
				eftRender.play();
			}
		}
		
		private function playComplete(target:InterObject3D):void
		{
//			target.removeFromParent();
		}
		
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,parentContiner);
			data=1;
			var ljid:int=data;
			var cfg:Q_lunjian=LunJianCfg.getCfgByID(ljid);
			var rewads:Array=JSONUtil.decode(cfg.q_rewards);
			var itemInfo:ClientItemInfo=new ClientItemInfo(rewads[0].mod);
			
			_icon=IconCDFace.create(IcoSizeEnum.ICON_64);
			_skin.container.addChild(_icon);
			_icon.x=_skin.icon1.x;
			_icon.y=_skin.icon1.y;
			FaceUtil.SetItemGrid(_icon,itemInfo);
			
			_skin.container.scale=0.1;
			_skin.container.alpha=0;
			leftTime=10;
			TimerServer.addLoop(updateTime,1000);
			updateTime();
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
			if(eftRender){
				eftRender.play(0);
			}
		}
		
		private function updateTime():void
		{
			_skin.lbTime.text=leftTime+LanguageConfig.getText(LangUI.UI_TEXT33);
			leftTime--;
			if(leftTime<=0){
				TimerServer.remove(updateTime);
				this.onHide();
			}
		}
		
		override protected function onHide():void
		{
			super.onHide();
			_icon.destroy();
			TimerServer.remove(updateTime);
		}
	}
}