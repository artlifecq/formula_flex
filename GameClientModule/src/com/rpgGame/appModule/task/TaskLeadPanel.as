package com.rpgGame.appModule.task
{
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.app.view.icon.BgIcon;
	import com.rpgGame.appModule.maps.BigMapsData;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.MapDataManager;
	import com.rpgGame.coreData.info.map.SceneData;
	
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.UIAsset;
	
	import org.mokylin.skin.mainui.renwu.Zhuxian_Renwu;
	
	import starling.display.DisplayObjectContainer;
	import starling.events.TouchEvent;
	
	public class TaskLeadPanel  extends SkinUIPanel
	{
		private var _skin :Zhuxian_Renwu;
		private var titleLabel:Label;
		private var nameLabel:Label;
		private var navLabel:Label;
		private var speakLabel:Label;
		private var timerLabel:Label;
		private var okBut:Button;
		private var icoBgList:Vector.<UIAsset>;
		private var icoList:Vector.<BgIcon>;
		public function TaskLeadPanel()
		{
			_skin=new Zhuxian_Renwu();
			super(_skin);
			init()
		}
		
		private function init():void
		{
			titleLabel=_skin.lbl_title;
			nameLabel=_skin.lb_name;
			navLabel=_skin.lb_jiangli;
			speakLabel=_skin.lb_speak;
			timerLabel=_skin.lb_time;
			okBut=_skin.btn_ok;
			icoBgList=new Vector.<UIAsset>();
			icoBgList.push(_skin.ioc_0);
			icoBgList.push(_skin.ioc_1);
			icoBgList.push(_skin.ioc_2);
			icoBgList.push(_skin.ioc_3);
			icoBgList.push(_skin.ioc_4);
			icoBgList.push(_skin.ioc_5);
			icoList=new Vector.<BgIcon>();
			var i:int;
			for(i=0;i<icoBgList.length;i++)
			{
				var ico:BgIcon=new BgIcon(IcoSizeEnum.ICON_42);
				ico.x=icoBgList[i].x+6;
				ico.y=icoBgList[i].y+6;
				ico.visible=false;
				icoBgList[i].visible=false;
				icoList.push(ico);
				this.addChild(ico);
			}
			
			titleLabel.htmlText="主线任务";
			nameLabel.htmlText="第一章:新手村";
			navLabel.htmlText="任务奖励";
			speakLabel.htmlText="狗贼宇文拓在会稽郡释放万灵血阵，会稽镇一夜之间只剩血光一片，他们聚集在此欲找官府讨要说法，却遭官兵残杀。";
			timerLabel.htmlText="10秒后自动领取奖励";
			icoList[0].setIconResName(ClientConfig.getItemIcon("201",IcoSizeEnum.ICON_42));
			icoList[0].visible=true;
			icoBgList[0].visible=true;
			icoList[1].setIconResName(ClientConfig.getItemIcon("203",IcoSizeEnum.ICON_42));
			icoList[1].visible=true;
			icoBgList[1].visible=true;
			
			
		}
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void 
		{
			super.show(data, openTable, parentContiner);
			
			
			
		}
		override public function hide():void 
		{
			super.hide();
			
		}
	}
}